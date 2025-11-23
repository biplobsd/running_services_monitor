import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'widgets/shizuku_setup_dialog.dart';
import 'widgets/home_body.dart';
import 'package:running_services_monitor/l10n/app_localizations.dart';
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

    // Initialize BLoCs
    homeBloc = getIt<HomeBloc>();

    // Listen to search controller
    _searchController.addListener(() {
      homeBloc.add(HomeEvent.updateSearchQuery(_searchController.text.toLowerCase()));
    });

    // Initialize Shizuku
    homeBloc.add(const HomeEvent.initializeShizuku());
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    homeBloc.close();
    super.dispose();
  }

  void _showShizukuSetupDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ShizukuSetupDialog(
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
          content: Text(AppLocalizations.of(context)!.enjoyingApp),
          action: SnackBarAction(label: AppLocalizations.of(context)!.donate, onPressed: () => context.push('/about')),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider.value(value: homeBloc)],
      child: BlocListener<HomeBloc, HomeState>(
        listenWhen: (previous, current) =>
            previous.value.errorMessage != current.value.errorMessage ||
            previous.value.notification != current.value.notification,
        listener: (context, state) {
          // Handle one-time side effects
          state.maybeWhen(
            failure: (value, message) {
              // Show Shizuku setup dialog if needed
              if (message.contains('Shizuku is not running')) {
                _showShizukuSetupDialog();
              }
            },
            success: (value) {
              if (value.notification != null) {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(value.notification!),
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
            preferredSize: const Size.fromHeight(kToolbarHeight + 48), // Approximate height including TabBar
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                final value = state.value;
                return AppBar(
                  title: value.isSearching ? SearchField(controller: _searchController) : const AppLogo(),
                  bottom: value.shizukuReady
                      ? PreferredSize(
                          preferredSize: const Size.fromHeight(48),
                          child: TabBar(
                            controller: _tabController,
                            tabs: [
                              Tab(text: '${AppLocalizations.of(context)!.all} (${value.allApps.length})'),
                              Tab(text: '${AppLocalizations.of(context)!.user} (${value.userApps.length})'),
                              Tab(text: '${AppLocalizations.of(context)!.system} (${value.systemApps.length})'),
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
                            ? AppLocalizations.of(context)!.closeSearch
                            : AppLocalizations.of(context)!.search,
                      ),
                      IconButton(
                        icon: Icon(
                          value.isAutoUpdateEnabled ? Icons.timer : Icons.timer_off,
                          color: value.isAutoUpdateEnabled ? Theme.of(context).colorScheme.primary : null,
                        ),
                        onPressed: () => homeBloc.add(const HomeEvent.toggleAutoUpdate()),
                        tooltip: AppLocalizations.of(context)!.autoUpdate,
                      ),
                      IconButton(
                        icon:
                            value.isLoading &&
                                value.systemApps.isNotEmpty &&
                                value.userApps.isNotEmpty &&
                                value.allApps.isNotEmpty
                            ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2))
                            : const Icon(Icons.refresh),
                        onPressed: value.isLoading ? null : () => homeBloc.add(const HomeEvent.loadData()),
                        tooltip: AppLocalizations.of(context)!.refresh,
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
