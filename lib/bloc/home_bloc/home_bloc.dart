import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:running_services_monitor/models/home_state_model.dart';
import 'package:running_services_monitor/services/process_service.dart';
import 'package:running_services_monitor/services/shizuku_service.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ShizukuService _shizukuService;
  final ProcessService _processService;
  Timer? _autoUpdateTimer;

  HomeBloc(this._shizukuService, this._processService) : super(const HomeState.initial(HomeStateModel())) {
    on<_InitializeShizuku>(_onInitializeShizuku);
    on<_LoadData>(_onLoadData);
    on<_ToggleAutoUpdate>(_onToggleAutoUpdate);
    on<_ToggleSearch>(_onToggleSearch);
    on<_UpdateSearchQuery>(_onUpdateSearchQuery);
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
      emit(HomeState.loading(state.value.copyWith(isLoading: true, errorMessage: null)));
    }

    try {
      // Refresh app cache if not silent (manual refresh)
      if (!event.silent) {
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

      // Separate into user and system
      final userApps = apps.where((a) => !a.isSystemApp).toList();
      final systemApps = apps.where((a) => a.isSystemApp).toList();

      // Calculate Apps RAM
      double appsRam = 0;
      for (var app in apps) {
        appsRam += app.totalRamInKb;
      }

      emit(
        HomeState.success(
          state.value.copyWith(
            allApps: apps,
            userApps: userApps,
            systemApps: systemApps,
            totalRamKb: ramInfo[0],
            freeRamKb: ramInfo[1],
            usedRamKb: ramInfo[2],
            appsRamKb: appsRam,
            isLoading: false,
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
}
