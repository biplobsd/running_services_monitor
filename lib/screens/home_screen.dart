import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';

import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/core/utils/android_settings_helper.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/bloc/home_ui_bloc/home_ui_bloc.dart';
import 'package:running_services_monitor/l10n/l10n_keys.dart';
import 'widgets/settings/shizuku_permission_dialog.dart';
import 'widgets/home/home_body.dart';
import 'widgets/settings/language_selector.dart';
import 'package:running_services_monitor/utils/snackbar_helper.dart';
import 'widgets/settings/theme_toggle_button.dart';
import 'widgets/about/about_button.dart';
import 'widgets/home/app_logo.dart';
import 'widgets/home/search_field.dart';
import 'widgets/common/loading_indicator.dart';
import 'widgets/home/app_count_tab.dart';
import 'widgets/common/auto_refresh_timer_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final HomeBloc homeBloc;
  late final HomeUiBloc homeUiBloc;

  TabController? _tabController;
  final TextEditingController _searchController = TextEditingController();
  bool _showCoreApps = false;

  @override
  void initState() {
    super.initState();
    homeBloc = getIt<HomeBloc>();
    homeUiBloc = getIt<HomeUiBloc>();

    // Initialize state from bloc
    _showCoreApps = homeBloc.state.value.showCoreApps;
    _initTabController();

    _searchController.addListener(() {
      homeBloc.add(HomeEvent.updateSearchQuery(_searchController.text.toLowerCase()));
    });
  }

  void _initTabController() {
    _tabController?.dispose();
    _tabController = TabController(length: _showCoreApps ? 5 : 4, vsync: this);
    _tabController!.addListener(() {
      if (!_tabController!.indexIsChanging) {
        homeUiBloc.add(HomeUiEvent.tabChanged(_tabController!.index));
      }
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _showShizukuSetupDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ShizukuPermissionDialog(
        type: ShizukuDialogType.setup,
        onRetry: () {
          Navigator.of(context).pop();
          homeBloc.add(const HomeEvent.initializeShizuku());
        },
      ),
    );
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ShizukuPermissionDialog(
        onRetry: () {
          Navigator.of(context).pop();
          homeBloc.add(const HomeEvent.initializeShizuku());
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: homeBloc),
        BlocProvider.value(value: homeUiBloc),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: BlocSelector<HomeBloc, HomeState, bool>(
            selector: (state) => state.value.isSearching,
            builder: (context, isSearching) {
              return isSearching ? SearchField(controller: _searchController) : const AppLogo();
            },
          ),
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: [
              AppCountTab(label: context.loc.all, filter: (app, cached) => true),
              AppCountTab(
                label: context.loc.user,
                filter: (app, cached) {
                  if (cached != null) return !cached.isSystemApp;
                  return app.isSystemApp == false;
                },
              ),
              AppCountTab(
                label: context.loc.system,
                filter: (app, cached) {
                  if (cached != null) return cached.isSystemApp;
                  return app.isSystemApp == true;
                },
              ),
              if (_showCoreApps) AppCountTab(label: context.loc.core, filter: (app, cached) => app.isCoreApp),
              Tab(child: Text(context.loc.stats, style: AppStyles.bodyStyle)),
            ],
          ),
          actions: [
            BlocSelector<HomeBloc, HomeState, ({bool shizukuReady, bool isSearching})>(
              selector: (state) => (shizukuReady: state.value.shizukuReady, isSearching: state.value.isSearching),
              builder: (context, data) {
                if (!data.shizukuReady) return const SizedBox.shrink();
                return IconButton(
                  icon: Icon(data.isSearching ? Icons.close : Icons.search),
                  onPressed: () {
                    if (!data.isSearching) {
                      homeBloc.add(const HomeEvent.toggleSearch());
                    } else {
                      _searchController.clear();
                      homeBloc.add(const HomeEvent.toggleSearch());
                    }
                  },
                  tooltip: data.isSearching ? context.loc.closeSearch : context.loc.search,
                );
              },
            ),
            BlocSelector<HomeBloc, HomeState, ({bool shizukuReady, bool isAutoUpdateEnabled, Duration? autoUpdateInterval})>(
              selector: (state) => (
                shizukuReady: state.value.shizukuReady,
                isAutoUpdateEnabled: state.value.isAutoUpdateEnabled,
                autoUpdateInterval: state.value.autoUpdateInterval,
              ),
              builder: (context, data) {
                if (!data.shizukuReady) return const SizedBox.shrink();
                return AutoRefreshTimerButton(
                  isEnabled: data.isAutoUpdateEnabled,
                  currentInterval: data.autoUpdateInterval,
                  onToggle: () => homeBloc.add(const HomeEvent.toggleAutoUpdate()),
                  onIntervalSelected: (interval) => homeBloc.add(HomeEvent.setAutoUpdateInterval(interval)),
                );
              },
            ),
            BlocSelector<HomeBloc, HomeState, ({bool shizukuReady, bool isLoading, bool hasApps})>(
              selector: (state) {
                final isLoading = state.mapOrNull(loading: (_) => true) ?? false;
                return (shizukuReady: state.value.shizukuReady, isLoading: isLoading, hasApps: state.value.allApps.isNotEmpty);
              },
              builder: (context, data) {
                if (!data.shizukuReady) return const SizedBox.shrink();
                return IconButton(
                  icon: data.isLoading ? SizedBox(width: 30.w, height: 30.h, child: const LoadingIndicator()) : AppStyles.refreshIcon,
                  onPressed: data.isLoading ? null : () => homeBloc.add(const HomeEvent.loadData()),
                  tooltip: context.loc.refresh,
                );
              },
            ),
            const LanguageSelector(),
            const ThemeToggleButton(),
            const AboutButton(),
          ],
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<HomeBloc, HomeState>(
              listenWhen: (previous, current) => previous.value.showCoreApps != current.value.showCoreApps,
              listener: (context, state) {
                setState(() {
                  _showCoreApps = state.value.showCoreApps;
                  _initTabController();
                });
              },
            ),
            BlocListener<HomeBloc, HomeState>(
              listener: (context, state) {
                state.maybeWhen(
                  failure: (value, message) {
                    if (message == L10nKeys.shizukuNotRunning) {
                      _showShizukuSetupDialog();
                    } else if (message == L10nKeys.permissionDeniedShizuku || message == L10nKeys.failedToInitialize) {
                      _showPermissionDialog();
                    }
                  },
                  success: (value, toast) {
                    if (toast != null) {
                      SnackBarHelper.showInfo(context, context.loc.resolve(toast));
                    }
                  },
                  orElse: () {},
                );
              },
            ),
          ],
          child: NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              final direction = switch (notification.direction) {
                ScrollDirection.forward => UiScrollDirection.forward,
                ScrollDirection.reverse => UiScrollDirection.reverse,
                ScrollDirection.idle => UiScrollDirection.idle,
              };
              homeUiBloc.add(HomeUiEvent.scrollDirectionChanged(direction));
              return false;
            },
            child: HomeBody(tabController: _tabController!),
          ),
        ),
        floatingActionButton: BlocSelector<HomeUiBloc, HomeUiState, ({bool isFabVisible, bool isFabExtended})>(
          selector: (state) => (isFabVisible: state.isFabVisible, isFabExtended: state.isFabExtended),
          builder: (context, uiState) {
            if (!uiState.isFabVisible) return const SizedBox.shrink();

            return Transform.translate(
              offset: const Offset(10, 10),
              child: BlocSelector<HomeBloc, HomeState, bool>(
                selector: (state) => state.value.shizukuReady,
                builder: (context, shizukuReady) {
                  if (!shizukuReady) return const SizedBox.shrink();

                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    transitionBuilder: (child, animation) => SizeTransition(
                      sizeFactor: animation,
                      axis: Axis.horizontal,
                      axisAlignment: -1,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 5.h, right: 5.w),
                          child: child,
                        ),
                      ),
                    ),
                    child: uiState.isFabExtended
                        ? FloatingActionButton.extended(
                            key: const ValueKey('extended'),
                            onPressed: AndroidSettingsHelper.tryOpenSystemRunningServices,
                            icon: const Icon(Icons.security),
                            label: Text(context.loc.runningServicesTitle, style: AppStyles.bodyStyle),
                            tooltip: context.loc.openRunningServicesTooltip,
                          )
                        : FloatingActionButton(
                            key: const ValueKey('collapsed'),
                            onPressed: AndroidSettingsHelper.tryOpenSystemRunningServices,
                            tooltip: context.loc.openRunningServicesTooltip,
                            child: const Icon(Icons.security),
                          ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
