import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/simple_bloc/simple_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import '../models/service_info.dart';
import '../services/shizuku_service.dart';
import '../services/process_service.dart';
import '../widgets/app_list_item.dart';
import '../widgets/ram_bar.dart';
import '../widgets/shizuku_setup_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final ShizukuService _shizukuService = ShizukuService();
  final ProcessService _processService = ProcessService();
  late final SimpleBloc simpleBloc;

  late TabController _tabController;
  Timer? _autoUpdateTimer;
  final TextEditingController _searchController = TextEditingController();

  bool _isLoading = true;
  bool _shizukuReady = false;
  String? _errorMessage;
  bool _isAutoUpdateEnabled = false;
  bool _isSearching = false;
  String _searchQuery = '';

  List<AppProcessInfo> _allApps = [];
  List<AppProcessInfo> _userApps = [];
  List<AppProcessInfo> _systemApps = [];

  // RAM Info
  double _totalRamKb = 0;
  double _freeRamKb = 0;
  double _usedRamKb = 0;
  double _appsRamKb = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.toLowerCase();
      });
    });
    _initializeShizuku();

    simpleBloc = getIt<SimpleBloc>();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _autoUpdateTimer?.cancel();
    _searchController.dispose();
    simpleBloc.close();
    super.dispose();
  }

  Future<void> _initializeShizuku() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Check if Shizuku is running
      final isRunning = await _shizukuService.isShizukuRunning();
      if (!isRunning) {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Shizuku is not running. Please start Shizuku app.';
        });
        _showShizukuSetupDialog();
        return;
      }

      // Initialize Shizuku
      final initialized = await _shizukuService.initialize();
      if (!initialized) {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Failed to initialize Shizuku. Please grant permission.';
        });
        return;
      }

      setState(() {
        _shizukuReady = true;
      });

      // Load services
      await _loadData();
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Error: $e';
      });
    }
  }

  Future<void> _loadData({bool silent = false}) async {
    if (!silent) {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });
    }

    try {
      // Refresh app cache if not silent (manual refresh)
      if (!silent) {
        await _processService.refreshAppCache();
      }

      // Load RAM info
      final ramInfo = await _processService.getSystemRamInfo();

      // Load Apps
      final apps = await _processService.getAppProcessInfos().timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw Exception('Timeout fetching services');
        },
      );

      if (apps.isEmpty) {
        if (!silent) {
          setState(() {
            _isLoading = false;
            _errorMessage =
                'No apps found. This might mean:\\n'
                '• Shizuku doesnt have permission\\n'
                '• dumpsys command failed\\n'
                '• No apps are currently running (unlikely)\\n\\n'
                'Try restarting Shizuku and granting permission again.';
          });
        }
        return;
      }

      // Separate into user and system
      final userApps = apps.where((a) => !a.isSystemApp).toList();
      final systemApps = apps.where((a) => a.isSystemApp).toList();

      // Calculate Apps RAM
      double appsRam = 0;
      for (var app in apps) {
        appsRam += app.totalRamInKb;
      }

      if (mounted) {
        setState(() {
          _allApps = apps;
          _userApps = userApps;
          _systemApps = systemApps;

          _totalRamKb = ramInfo[0];
          _freeRamKb = ramInfo[1];
          _usedRamKb = ramInfo[2];
          _appsRamKb = appsRam;

          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Error loading data: $e');
      if (mounted && !silent) {
        setState(() {
          _isLoading = false;
          _errorMessage = 'Error loading data: $e';
        });
      }
    }
  }

  void _toggleAutoUpdate() {
    setState(() {
      _isAutoUpdateEnabled = !_isAutoUpdateEnabled;
      if (_isAutoUpdateEnabled) {
        _autoUpdateTimer = Timer.periodic(const Duration(seconds: 3), (_) {
          _loadData(silent: true);
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Auto-update enabled (3s)')));
      } else {
        _autoUpdateTimer?.cancel();
        _autoUpdateTimer = null;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Auto-update disabled')));
      }
    });
  }

  void _showShizukuSetupDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ShizukuSetupDialog(
        onRetry: () {
          Navigator.of(context).pop();
          _initializeShizuku();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: simpleBloc,
      child: Scaffold(
        appBar: AppBar(
          title: _isSearching
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
          bottom: _shizukuReady
              ? TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(text: 'All (${_allApps.length})'),
                    Tab(text: 'User (${_userApps.length})'),
                    Tab(text: 'System (${_systemApps.length})'),
                  ],
                )
              : null,
          actions: [
            if (_shizukuReady) ...[
              IconButton(
                icon: Icon(_isSearching ? Icons.close : Icons.search),
                onPressed: () {
                  setState(() {
                    _isSearching = !_isSearching;
                    if (!_isSearching) {
                      _searchController.clear();
                    }
                  });
                },
                tooltip: _isSearching ? 'Close Search' : 'Search',
              ),
              IconButton(
                icon: Icon(
                  _isAutoUpdateEnabled ? Icons.timer : Icons.timer_off,
                  color: _isAutoUpdateEnabled ? Theme.of(context).colorScheme.primary : null,
                ),
                onPressed: _toggleAutoUpdate,
                tooltip: 'Auto-Update (3s)',
              ),
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: _isLoading ? null : () => _loadData(),
                tooltip: 'Refresh',
              ),
            ],
            IconButton(icon: const Icon(Icons.info_outline), onPressed: () => _showInfoDialog(), tooltip: 'About'),
          ],
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading && _allApps.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [CircularProgressIndicator(), SizedBox(height: 16), Text('Loading services...')],
        ),
      );
    }

    if (_errorMessage != null && _allApps.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 64, color: Theme.of(context).colorScheme.error),
              const SizedBox(height: 16),
              Text(_errorMessage!, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: _initializeShizuku,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (!_shizukuReady) {
      return const Center(child: Text('Shizuku not ready'));
    }

    return Column(
      children: [
        BlocSelector<SimpleBloc, SimpleState, int>(
          selector: (state) {
            return state.maybeWhen(success: (value) => value.count ?? 0, orElse: () => state.value.count ?? 0);
          },
          builder: (context, count) {
            return Text('count : $count');
          },
        ),
        // count butttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                simpleBloc.add(const SimpleEvent.count(count: 1));
              },
              child: const Text('Increment Count'),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                simpleBloc.add(const SimpleEvent.count(count: -1));
              },
              child: const Text('Decrement Count'),
            ),
          ],
        ),
        // RAM Bar
        RamBar(totalRamKb: _totalRamKb, usedRamKb: _usedRamKb, appsRamKb: _appsRamKb, freeRamKb: _freeRamKb),
        const Divider(height: 1),
        // App List
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [_buildAppList(_allApps), _buildAppList(_userApps), _buildAppList(_systemApps)],
          ),
        ),
      ],
    );
  }

  Widget _buildAppList(List<AppProcessInfo> apps) {
    final filteredApps = apps.where((app) {
      if (_searchQuery.isEmpty) return true;
      final name = app.appName.toLowerCase();
      final pkg = app.packageName.toLowerCase();
      return name.contains(_searchQuery) || pkg.contains(_searchQuery);
    }).toList();

    if (filteredApps.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox_outlined, size: 64, color: Theme.of(context).colorScheme.outline),
            const SizedBox(height: 16),
            Text(
              _searchQuery.isNotEmpty ? 'No matching apps' : 'No apps found',
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
