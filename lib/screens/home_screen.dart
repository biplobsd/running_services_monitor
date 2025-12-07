import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';

import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/core/utils/android_settings_helper.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'widgets/shizuku_permission_dialog.dart';
import 'widgets/home_body.dart';
import 'widgets/language_selector.dart';
import 'widgets/theme_toggle_button.dart';
import 'widgets/about_button.dart';
import 'widgets/app_logo.dart';
import 'widgets/search_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late final HomeBloc homeBloc;

  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  int _refreshCount = 0;
  bool _isFabExtended = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    homeBloc = getIt<HomeBloc>();

    _searchController.addListener(() {
      homeBloc.add(HomeEvent.updateSearchQuery(_searchController.text.toLowerCase()));
    });

    homeBloc.add(const HomeEvent.initializeShizuku());
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

  void _checkReviewRequest() {
    _refreshCount++;
    if (_refreshCount % 5 == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.loc.enjoyingApp, style: TextStyle(fontSize: 14.sp)),
          action: SnackBarAction(label: context.loc.donate, onPressed: () => context.push('/about')),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider.value(value: homeBloc)],
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          state.maybeWhen(
            failure: (value, message) {
              if (message.contains('Shizuku is not running')) {
                _showShizukuSetupDialog();
              } else if (message.contains('Permission denied') || message.contains('grant permission')) {
                _showPermissionDialog();
              }
            },
            success: (value, toast, updateAppInfoIcons) {
              if (toast != null) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(toast, style: TextStyle(fontSize: 14.sp)),
                    duration: const Duration(seconds: 1),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                _checkReviewRequest();

                if (updateAppInfoIcons ?? false) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Future.delayed(const Duration(milliseconds: 500), () {
                      homeBloc.add(const HomeEvent.updateAppInfoIcons());
                    });
                  });
                }
              }
            },
            orElse: () {},
          );
        },
        child: Scaffold(
          appBar: AppBar(
            title: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                final value = state.value;
                return value.isSearching ? SearchField(controller: _searchController) : const AppLogo();
              },
            ),
            bottom: TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      final value = state.value;
                      return Text('${context.loc.all} (${value.allApps.length})', style: TextStyle(fontSize: 14.sp));
                    },
                  ),
                ),
                Tab(
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      final value = state.value;
                      return Text('${context.loc.user} (${value.userApps.length})', style: TextStyle(fontSize: 14.sp));
                    },
                  ),
                ),
                Tab(
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      final value = state.value;
                      return Text(
                        '${context.loc.system} (${value.systemApps.length})',
                        style: TextStyle(fontSize: 14.sp),
                      );
                    },
                  ),
                ),
              ],
            ),
            actions: [
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  final value = state.value;
                  if (!value.shizukuReady) return const SizedBox.shrink();
                  return IconButton(
                    icon: Icon(value.isSearching ? Icons.close : Icons.search),
                    onPressed: () {
                      if (!value.isSearching) {
                        homeBloc.add(const HomeEvent.toggleSearch());
                      } else {
                        _searchController.clear();
                        homeBloc.add(const HomeEvent.toggleSearch());
                      }
                    },
                    tooltip: value.isSearching ? context.loc.closeSearch : context.loc.search,
                  );
                },
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  final value = state.value;
                  if (!value.shizukuReady) return const SizedBox.shrink();
                  return IconButton(
                    icon: Icon(
                      value.isAutoUpdateEnabled ? Icons.timer : Icons.timer_off,
                      color: value.isAutoUpdateEnabled ? Theme.of(context).colorScheme.primary : null,
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
                    hasApps:
                        state.value.systemApps.isNotEmpty &&
                        state.value.userApps.isNotEmpty &&
                        state.value.allApps.isNotEmpty,
                  );
                },
                builder: (context, data) {
                  if (!data.shizukuReady) return const SizedBox.shrink();
                  return IconButton(
                    icon: data.isLoading
                        ? SizedBox(
                            width: 18.w,
                            height: 24.h,
                            child: const FittedBox(child: CircularProgressIndicator()),
                          )
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
          floatingActionButton: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              final value = state.value;
              if (!value.shizukuReady) return const SizedBox.shrink();

              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                transitionBuilder: (child, animation) => SizeTransition(
                  sizeFactor: animation,
                  axis: Axis.horizontal,
                  axisAlignment: -1,
                  child: Align(alignment: Alignment.bottomRight, child: child),
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
    );
  }
}
