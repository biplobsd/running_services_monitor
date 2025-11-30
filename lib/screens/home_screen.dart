import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';

import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
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
            success: (value) {
              if (value.notification != null) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(value.notification!, style: TextStyle(fontSize: 14.sp)),
                    duration: const Duration(seconds: 1),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                _checkReviewRequest();
              }
            },
            orElse: () {},
          );
        },
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight((kToolbarHeight + 100).sp),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                final value = state.value;
                return AppBar(
                  title: value.isSearching ? SearchField(controller: _searchController) : const AppLogo(),
                  bottom: value.shizukuReady
                      ? PreferredSize(
                          preferredSize: Size.fromHeight(48.h),
                          child: TabBar(
                            controller: _tabController,
                            tabs: [
                              Tab(child: Text('${context.loc.all} (${value.allApps.length})', style: TextStyle(fontSize: 14.sp))),
                              Tab(child: Text('${context.loc.user} (${value.userApps.length})', style: TextStyle(fontSize: 14.sp))),
                              Tab(child: Text('${context.loc.system} (${value.systemApps.length})', style: TextStyle(fontSize: 14.sp))),
                            ],
                          ),
                        )
                      : null,
                  actions: [
                    if (value.shizukuReady) ...[
                      IconButton(
                        icon: Icon(value.isSearching ? Icons.close : Icons.search),
                        onPressed: () {
                          if (!value.isSearching) {
                            homeBloc.add(const HomeEvent.toggleSearch());
                          } else {
                            _searchController.clear();
                            homeBloc.add(const HomeEvent.toggleSearch());
                          }
                        },
                        tooltip: value.isSearching
                            ? context.loc.closeSearch
                            : context.loc.search,
                      ),
                      IconButton(
                        icon: Icon(
                          value.isAutoUpdateEnabled ? Icons.timer : Icons.timer_off,
                          color: value.isAutoUpdateEnabled ? Theme.of(context).colorScheme.primary : null,
                        ),
                        onPressed: () => homeBloc.add(const HomeEvent.toggleAutoUpdate()),
                        tooltip: context.loc.autoUpdate,
                      ),
                      IconButton(
                        icon:
                            value.isLoading &&
                                value.systemApps.isNotEmpty &&
                                value.userApps.isNotEmpty &&
                                value.allApps.isNotEmpty
                            ? SizedBox(width: 18.w, height: 24.h, child: FittedBox(child: CircularProgressIndicator()))
                            : const Icon(Icons.refresh),
                        onPressed: value.isLoading ? null : () => homeBloc.add(const HomeEvent.loadData()),
                        tooltip: context.loc.refresh,
                      ),
                    ],
                    const LanguageSelector(),
                    const ThemeToggleButton(),
                    const AboutButton(),
                  ],
                );
              },
            ),
          ),
          body: HomeBody(tabController: _tabController),
        ),
      ),
    );
  }
}
