import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';

import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/core/utils/android_settings_helper.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/bloc/app_info_bloc/app_info_bloc.dart';
import 'package:running_services_monitor/l10n/l10n_keys.dart';
import 'package:running_services_monitor/models/app_info_state_model.dart';
import 'widgets/settings/shizuku_permission_dialog.dart';
import 'widgets/home/home_body.dart';
import 'widgets/settings/language_selector.dart';
import 'widgets/settings/theme_toggle_button.dart';
import 'widgets/about/about_button.dart';
import 'widgets/home/app_logo.dart';
import 'widgets/home/search_field.dart';
import 'widgets/common/loading_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late final HomeBloc homeBloc;

  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  bool _isFabExtended = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    homeBloc = getIt<HomeBloc>();

    _searchController.addListener(() {
      homeBloc.add(HomeEvent.updateSearchQuery(_searchController.text.toLowerCase()));
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
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
      providers: [BlocProvider.value(value: homeBloc)],
      child: MultiBlocListener(
        listeners: [
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
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(context.loc.resolve(toast), style: TextStyle(fontSize: 14.sp)),
                        duration: const Duration(seconds: 1),
                        behavior: SnackBarBehavior.fixed,
                      ),
                    );
                  }
                },
                orElse: () {},
              );
            },
          ),
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
              tabs: [
                Tab(
                  child: BlocSelector<HomeBloc, HomeState, int>(
                    selector: (state) => state.value.allApps.length,
                    builder: (context, count) {
                      return Text('${context.loc.all} ($count)', style: TextStyle(fontSize: 14.sp));
                    },
                  ),
                ),
                Tab(
                  child: BlocSelector<AppInfoBloc, AppInfoState, Map<String, CachedAppInfo>>(
                    bloc: getIt<AppInfoBloc>(),
                    selector: (state) => state.value.cachedApps,
                    builder: (context, cachedApps) {
                      return BlocSelector<HomeBloc, HomeState, int>(
                        selector: (state) {
                          return state.value.allApps.where((app) {
                            final cached = cachedApps[app.packageName];
                            if (cached != null) {
                              return !cached.isSystemApp;
                            }
                            return app.isSystemApp == false;
                          }).length;
                        },
                        builder: (context, count) {
                          return Text('${context.loc.user} ($count)', style: TextStyle(fontSize: 14.sp));
                        },
                      );
                    },
                  ),
                ),
                Tab(
                  child: BlocSelector<AppInfoBloc, AppInfoState, Map<String, CachedAppInfo>>(
                    bloc: getIt<AppInfoBloc>(),
                    selector: (state) => state.value.cachedApps,
                    builder: (context, cachedApps) {
                      return BlocSelector<HomeBloc, HomeState, int>(
                        selector: (state) {
                          return state.value.allApps.where((app) {
                            final cached = cachedApps[app.packageName];
                            if (cached != null) {
                              return cached.isSystemApp;
                            }
                            return app.isSystemApp == true;
                          }).length;
                        },
                        builder: (context, count) {
                          return Text('${context.loc.system} ($count)', style: TextStyle(fontSize: 14.sp));
                        },
                      );
                    },
                  ),
                ),
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
                        final cachedApps = getIt<AppInfoBloc>().state.value.cachedApps;
                        homeBloc.add(HomeEvent.updateCachedApps(cachedApps));
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
              BlocSelector<HomeBloc, HomeState, ({bool shizukuReady, bool isAutoUpdateEnabled})>(
                selector: (state) =>
                    (shizukuReady: state.value.shizukuReady, isAutoUpdateEnabled: state.value.isAutoUpdateEnabled),
                builder: (context, data) {
                  if (!data.shizukuReady) return const SizedBox.shrink();
                  return IconButton(
                    icon: Icon(
                      data.isAutoUpdateEnabled ? Icons.timer : Icons.timer_off,
                      color: data.isAutoUpdateEnabled ? Theme.of(context).colorScheme.primary : null,
                    ),
                    onPressed: () => homeBloc.add(const HomeEvent.toggleAutoUpdate()),
                    tooltip: context.loc.autoUpdate,
                  );
                },
              ),
              BlocSelector<HomeBloc, HomeState, ({bool shizukuReady, bool isLoading, bool hasApps})>(
                selector: (state) {
                  final isLoading = state.mapOrNull(loading: (_) => true) ?? false;

                  return (
                    shizukuReady: state.value.shizukuReady,
                    isLoading: isLoading,
                    hasApps: state.value.allApps.isNotEmpty,
                  );
                },
                builder: (context, data) {
                  if (!data.shizukuReady) return const SizedBox.shrink();
                  return IconButton(
                    icon: data.isLoading
                        ? SizedBox(width: 30.w, height: 30.h, child: const LoadingIndicator())
                        : const Icon(Icons.refresh),
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
          body: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is UserScrollNotification) {
                final direction = notification.direction;
                final atTop = notification.metrics.pixels <= 0;
                if (atTop && !_isFabExtended) {
                  setState(() => _isFabExtended = true);
                } else if (direction == ScrollDirection.reverse && _isFabExtended && !atTop) {
                  setState(() => _isFabExtended = false);
                } else if (direction == ScrollDirection.forward && !_isFabExtended) {
                  setState(() => _isFabExtended = true);
                }
              }
              return false;
            },
            child: HomeBody(tabController: _tabController),
          ),
          floatingActionButton: Transform.translate(
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
                  child: _isFabExtended
                      ? FloatingActionButton.extended(
                          key: const ValueKey('extended'),
                          onPressed: AndroidSettingsHelper.tryOpenSystemRunningServices,
                          icon: const Icon(Icons.security),
                          label: Text(context.loc.runningServicesTitle, style: TextStyle(fontSize: 14.sp)),
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
          ),
        ),
      ),
    );
  }
}
