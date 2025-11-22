import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import '../models/service_info.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import '../widgets/app_list_item.dart';
import '../widgets/ram_bar.dart';
import '../widgets/shizuku_setup_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late final HomeBloc homeBloc;

  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider.value(value: homeBloc)],
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          // Handle one-time side effects
          state.maybeWhen(
            failure: (value, message) {
              // Show Shizuku setup dialog if needed
              if (message.contains('Shizuku is not running')) {
                _showShizukuSetupDialog();
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
                  title: value.isSearching
                      ? TextField(
                          controller: _searchController,
                          autofocus: true,
                          decoration: const InputDecoration(
                            hintText: 'Search apps...',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.white70),
                          ),
                          style: const TextStyle(color: Colors.white),
                        )
                      : const Text('Running Apps'),
                  bottom: value.shizukuReady
                      ? PreferredSize(
                          preferredSize: const Size.fromHeight(48),
                          child: TabBar(
                            controller: _tabController,
                            tabs: [
                              Tab(text: 'All (${value.allApps.length})'),
                              Tab(text: 'User (${value.userApps.length})'),
                              Tab(text: 'System (${value.systemApps.length})'),
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
                        tooltip: value.isSearching ? 'Close Search' : 'Search',
                      ),
                      IconButton(
                        icon: Icon(
                          value.isAutoUpdateEnabled ? Icons.timer : Icons.timer_off,
                          color: value.isAutoUpdateEnabled ? Theme.of(context).colorScheme.primary : null,
                        ),
                        onPressed: () => homeBloc.add(const HomeEvent.toggleAutoUpdate()),
                        tooltip: 'Auto-Update (3s)',
                      ),
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: value.isLoading ? null : () => homeBloc.add(const HomeEvent.loadData()),
                        tooltip: 'Refresh',
                      ),
                    ],
                    IconButton(icon: const Icon(Icons.info_outline), onPressed: _showInfoDialog, tooltip: 'About'),
                  ],
                );
              },
            ),
          ),
          body: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final value = state.value;

        // Loading state (initial load)
        if (value.isLoading && value.allApps.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CircularProgressIndicator(), SizedBox(height: 16), Text('Loading services...')],
            ),
          );
        }

        // Error state (no data)
        if (value.errorMessage != null && value.allApps.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: Theme.of(context).colorScheme.error),
                  const SizedBox(height: 16),
                  Text(value.errorMessage!, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: 24),
                  FilledButton.icon(
                    onPressed: () => homeBloc.add(const HomeEvent.initializeShizuku()),
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        }

        // Success state
        return Column(
          children: [
            // RAM Bar
            BlocSelector<HomeBloc, HomeState, ({double total, double used, double apps, double free})>(
              selector: (state) => (
                total: state.value.totalRamKb,
                used: state.value.usedRamKb,
                apps: state.value.appsRamKb,
                free: state.value.freeRamKb,
              ),
              builder: (context, ram) {
                return RamBar(totalRamKb: ram.total, usedRamKb: ram.used, appsRamKb: ram.apps, freeRamKb: ram.free);
              },
            ),
            const Divider(height: 1),
            // App List
            Expanded(
              child:
                  BlocSelector<
                    HomeBloc,
                    HomeState,
                    ({List<AppProcessInfo> all, List<AppProcessInfo> user, List<AppProcessInfo> system})
                  >(
                    selector: (state) =>
                        (all: state.value.allApps, user: state.value.userApps, system: state.value.systemApps),
                    builder: (context, apps) {
                      return TabBarView(
                        controller: _tabController,
                        children: [_buildAppList(apps.all), _buildAppList(apps.user), _buildAppList(apps.system)],
                      );
                    },
                  ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAppList(List<AppProcessInfo> apps) {
    return BlocSelector<HomeBloc, HomeState, String>(
      selector: (state) => state.value.searchQuery,
      builder: (context, searchQuery) {
        final filteredApps = apps.where((app) {
          if (searchQuery.isEmpty) return true;
          final name = app.appName.toLowerCase();
          final pkg = app.packageName.toLowerCase();
          return name.contains(searchQuery) || pkg.contains(searchQuery);
        }).toList();

        if (filteredApps.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.inbox_outlined, size: 64, color: Theme.of(context).colorScheme.outline),
                const SizedBox(height: 16),
                Text(
                  searchQuery.isNotEmpty ? 'No matching apps' : 'No apps found',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: filteredApps.length,
          itemBuilder: (context, index) {
            return AppListItem(appInfo: filteredApps[index]);
          },
        );
      },
    );
  }

  void _showInfoDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('About'),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Running Services Monitor', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 8),
              Text('Version 2.0.0'),
              SizedBox(height: 16),
              Text('This app displays all running apps and services on your device, including system apps.'),
              SizedBox(height: 16),
              Text('Features:', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('• Real-time RAM usage monitoring'),
              Text('• Search and filter services'),
              Text('• Auto-update capability'),
              Text('• System vs User app classification'),
              SizedBox(height: 16),
              Text('Requirements:', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text('• Shizuku app must be installed and running'),
            ],
          ),
        ),
        actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('OK'))],
      ),
    );
  }
}
