import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:running_services_monitor/models/home_state_model.dart';
import 'package:running_services_monitor/services/app_info_service.dart';
import 'package:running_services_monitor/services/process_service.dart';
import 'package:running_services_monitor/services/shizuku_service.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@lazySingleton
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ShizukuService _shizukuService;
  final AppInfoService _appInfoService;
  final ProcessService _processService;
  Timer? _autoUpdateTimer;

  HomeBloc(this._shizukuService, this._appInfoService, this._processService) : super(const HomeState.initial(HomeStateModel())) {
    on<_InitializeShizuku>(_onInitializeShizuku);
    on<_LoadData>(_onLoadData);
    on<_ToggleAutoUpdate>(_onToggleAutoUpdate);
    on<_ToggleSearch>(_onToggleSearch);
    on<_UpdateSearchQuery>(_onUpdateSearchQuery);
    on<_RemoveApp>(_onRemoveApp);

    on<_AutoUpdateTick>(_onAutoUpdateTick);
  }

  @override
  Future<void> close() {
    _autoUpdateTimer?.cancel();
    return super.close();
  }

  Future<void> _onInitializeShizuku(_InitializeShizuku event, Emitter<HomeState> emit) async {
    emit(HomeState.loading(state.value.copyWith(isLoading: true, errorMessage: null)));

    try {
      // Check if Shizuku is running
      final isRunning = await _shizukuService.isShizukuRunning();
      if (!isRunning) {
        emit(
          HomeState.failure(
            state.value.copyWith(isLoading: false, shizukuReady: false),
            'Shizuku is not running. Please start Shizuku app.',
          ),
        );
        return;
      }

      // Initialize Shizuku
      final initialized = await _shizukuService.initialize();
      if (!initialized) {
        emit(
          HomeState.failure(
            state.value.copyWith(isLoading: false, shizukuReady: false),
            'Failed to initialize Shizuku. Please grant permission.',
          ),
        );
        return;
      }

      emit(HomeState.success(state.value.copyWith(shizukuReady: true)));

      // Load data after successful initialization
      add(const HomeEvent.loadData());
    } catch (e) {
      emit(HomeState.failure(state.value.copyWith(isLoading: false, shizukuReady: false), 'Error: $e'));
    }
  }

  Future<void> _onLoadData(_LoadData event, Emitter<HomeState> emit) async {
    if (!event.silent) {
      emit(
        HomeState.loading(
          state.value.copyWith(
            isLoading: true,
            errorMessage: null,
            notification: null,
            loadingStatus: 'Fetching system info...',
          ),
        ),
      );
    }

    try {
      // Parallel execution of independent tasks
      final results = await Future.wait([
        // 1. Ensure app info cache is valid
        _appInfoService.ensureCacheValid(),
        // 2. Get RAM info
        _processService.getSystemRamInfo(),
        // 3. Get raw service data
        _processService.fetchRawServicesData(),
      ]);

      final memData = results[1] as ({List<double>? ramInfo, String? meminfo})?;
      final ramInfo = memData?.ramInfo;
      final memInfo = memData?.meminfo;
      final services = results[2] as String?;

      if (services == null || services.isEmpty) {
        if (!event.silent) {
          emit(
            HomeState.failure(
              state.value.copyWith(isLoading: false),
              'No apps found. This might mean:\n'
              '• Shizuku doesn\'t have permission\n'
              '• dumpsys command failed\n'
              '• No apps are currently running (unlikely)\n\n'
              'Try restarting Shizuku and granting permission again.',
            ),
          );
        }
        return;
      }

      if (!event.silent) {
        emit(HomeState.loading(state.value.copyWith(isLoading: true, loadingStatus: 'Processing data...')));
      }

      // Process the raw data
      final apps = await _processService
          .processServiceData(services: services, meminfo: memInfo ?? '')
          .timeout(
            const Duration(minutes: 2),
            onTimeout: () {
              throw Exception('Timeout processing services');
            },
          );

      // Separate into user and system
      final userApps = apps.where((a) => !a.isSystemApp).toList();
      final systemApps = apps.where((a) => a.isSystemApp).toList();

      // Calculate Apps RAM
      double appsRam = 0;
      for (var app in apps) {
        appsRam += app.totalRamInKb;
      }

      String? notificationMessage;
      if (event.silent) {
        final time = DateTime.now();
        final timeStr =
            '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}';
        notificationMessage = 'Auto-updated at $timeStr';
      } else {
        notificationMessage = 'Refreshed successfully';
      }

      emit(
        HomeState.success(
          state.value.copyWith(
            allApps: apps,
            userApps: userApps,
            systemApps: systemApps,
            totalRamKb: ramInfo?[0] ?? 0,
            freeRamKb: ramInfo?[1] ?? 0,
            usedRamKb: ramInfo?[2] ?? 0,
            appsRamKb: appsRam,
            isLoading: false,
            notification: notificationMessage,
            loadingStatus: null,
          ),
        ),
      );
    } catch (e) {
      if (!event.silent) {
        emit(HomeState.failure(state.value.copyWith(isLoading: false), 'Error loading data: $e'));
      }
    }
  }

  Future<void> _onToggleAutoUpdate(_ToggleAutoUpdate event, Emitter<HomeState> emit) async {
    final newAutoUpdateState = !state.value.isAutoUpdateEnabled;

    if (newAutoUpdateState) {
      // Start auto-update
      _autoUpdateTimer = Timer.periodic(const Duration(seconds: 3), (_) {
        add(const HomeEvent.autoUpdateTick());
      });
    } else {
      // Stop auto-update
      _autoUpdateTimer?.cancel();
      _autoUpdateTimer = null;
    }

    emit(HomeState.success(state.value.copyWith(isAutoUpdateEnabled: newAutoUpdateState)));
  }

  Future<void> _onAutoUpdateTick(_AutoUpdateTick event, Emitter<HomeState> emit) async {
    // Trigger silent data load
    add(const HomeEvent.loadData(silent: true));
  }

  Future<void> _onToggleSearch(_ToggleSearch event, Emitter<HomeState> emit) async {
    final newSearchState = !state.value.isSearching;

    emit(
      HomeState.success(
        state.value.copyWith(isSearching: newSearchState, searchQuery: newSearchState ? state.value.searchQuery : ''),
      ),
    );
  }

  Future<void> _onUpdateSearchQuery(_UpdateSearchQuery event, Emitter<HomeState> emit) async {
    emit(HomeState.success(state.value.copyWith(searchQuery: event.query)));
  }

  Future<void> _onRemoveApp(_RemoveApp event, Emitter<HomeState> emit) async {
    final currentState = state.value;
    final updatedAllApps = currentState.allApps.where((app) => app.packageName != event.packageName).toList();
    final updatedUserApps = currentState.userApps.where((app) => app.packageName != event.packageName).toList();
    final updatedSystemApps = currentState.systemApps.where((app) => app.packageName != event.packageName).toList();

    // Recalculate Apps RAM
    double appsRam = 0;
    for (var app in updatedAllApps) {
      appsRam += app.totalRamInKb;
    }

    emit(
      HomeState.success(
        currentState.copyWith(
          allApps: updatedAllApps,
          userApps: updatedUserApps,
          systemApps: updatedSystemApps,
          appsRamKb: appsRam,
        ),
      ),
    );
  }
}
