import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:running_services_monitor/utils/format_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:running_services_monitor/l10n/l10n_keys.dart';
import 'package:running_services_monitor/models/home_state_model.dart';
import 'package:running_services_monitor/models/process_state_filter.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/services/process_service.dart';
import 'package:running_services_monitor/services/shizuku_service.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@lazySingleton
class HomeBloc extends HydratedBloc<HomeEvent, HomeState> {
  final ShizukuService _shizukuService;
  final ProcessService _processService;
  Timer? _autoUpdateTimer;

  HomeBloc(this._shizukuService, this._processService) : super(const HomeState.initial(HomeStateModel())) {
    on<_InitializeShizuku>(_onInitializeShizuku);
    on<_LoadData>(_onLoadData);
    on<_ToggleAutoUpdate>(_onToggleAutoUpdate);
    on<_ToggleSearch>(_onToggleSearch);
    on<_UpdateSearchQuery>(_onUpdateSearchQuery);
    on<_RemoveApp>(_onRemoveApp);
    on<_RemoveService>(_onRemoveService);
    on<_SetProcessFilter>(_onSetProcessFilter);
    on<_ToggleSortOrder>(_onToggleSortOrder);
  }

  @override
  Future<void> close() {
    _autoUpdateTimer?.cancel();
    return super.close();
  }

  Future<void> _onInitializeShizuku(_InitializeShizuku event, Emitter<HomeState> emit) async {
    final isAlreadyReady = state.value.shizukuReady;

    if (!isAlreadyReady) {
      emit(HomeState.loading(state.value, L10nKeys.checkingPermissions));
    }

    try {
      final hasRoot = await _shizukuService.checkRootPermission();
      if (hasRoot) {
        final rootGranted = await _shizukuService.requestRootPermission();
        if (rootGranted) {
          final initialized = await _shizukuService.initialize();
          if (initialized) {
            emit(HomeState.success(state.value.copyWith(shizukuReady: true)));
            add(HomeEvent.loadData(silent: event.silent, notify: event.notify));
            return;
          }
        }
      }

      final isRunning = await _shizukuService.isShizukuRunning();
      if (!isRunning) {
        emit(HomeState.failure(state.value.copyWith(shizukuReady: false), L10nKeys.shizukuNotRunning));
        return;
      }

      final hasPermission = await _shizukuService.checkPermission();
      if (!hasPermission) {
        final granted = await _shizukuService.requestPermission();
        if (!granted) {
          emit(HomeState.failure(state.value.copyWith(shizukuReady: false), L10nKeys.permissionDeniedShizuku));
          return;
        }
      }

      final initialized = await _shizukuService.initialize();
      if (!initialized) {
        emit(HomeState.failure(state.value.copyWith(shizukuReady: false), L10nKeys.failedToInitialize));
        return;
      }

      emit(HomeState.success(state.value.copyWith(shizukuReady: true)));

      add(HomeEvent.loadData(silent: event.silent, notify: event.notify));
    } catch (e) {
      emit(HomeState.failure(state.value.copyWith(shizukuReady: false), L10nKeys.errorInitializingShizuku));
    }
  }

  Future<void> _onLoadData(_LoadData event, Emitter<HomeState> emit) async {
    if (event.silent) {
      await _loadDataSimple(emit, event);
    } else {
      await _loadDataWithStream(emit, event);
    }
  }

  Future<void> _loadDataSimple(Emitter<HomeState> emit, _LoadData event) async {
    emit(HomeState.loading(state.value));
    try {
      final Map<String, AppProcessInfo> appsMap = {};
      final streamResult = _processService.streamAppProcessInfosWithRamInfo();

      await for (final app in streamResult.apps) {
        appsMap[app.packageName] = app;
      }

      final allApps = appsMap.values.toList();
      final ramInfo = await streamResult.systemRamInfo;

      emit(
        HomeState.success(
          state.value.copyWith(
            allApps: allApps,
            totalRamKb: ramInfo?[0] ?? state.value.totalRamKb,
            freeRamKb: ramInfo?[1] ?? state.value.freeRamKb,
            usedRamKb: ramInfo?[2] ?? state.value.usedRamKb,
          ),
          event.notify ? L10nKeys.refreshedSuccessfully : null,
        ),
      );
    } catch (e) {
      emit(HomeState.failure(state.value, L10nKeys.errorLoadingData));
    }
  }

  Future<void> _loadDataWithStream(Emitter<HomeState> emit, _LoadData event) async {
    emit(HomeState.loading(state.value, L10nKeys.loadingApps));
    try {
      final Map<String, AppProcessInfo> appsMap = {};

      final streamResult = _processService.streamAppProcessInfosWithRamInfo();
      await for (final app in streamResult.apps) {
        appsMap[app.packageName] = app;

        final allApps = appsMap.values.toList();

        emit(HomeState.loading(state.value.copyWith(allApps: allApps)));
      }

      final allApps = appsMap.values.toList();
      final ramInfo = await streamResult.systemRamInfo;
      emit(
        HomeState.success(
          state.value.copyWith(
            allApps: allApps,
            totalRamKb: ramInfo?[0] ?? state.value.totalRamKb,
            freeRamKb: ramInfo?[1] ?? state.value.freeRamKb,
            usedRamKb: ramInfo?[2] ?? state.value.usedRamKb,
          ),
          L10nKeys.refreshedSuccessfully,
        ),
      );
    } catch (e) {
      emit(HomeState.failure(state.value, L10nKeys.errorLoadingData));
    }
  }

  Future<void> _onToggleAutoUpdate(_ToggleAutoUpdate event, Emitter<HomeState> emit) async {
    final newAutoUpdateState = !state.value.isAutoUpdateEnabled;

    if (newAutoUpdateState) {
      _autoUpdateTimer = Timer.periodic(const Duration(seconds: 3), (_) {
        add(const HomeEvent.loadData(silent: true));
      });
    } else {
      _autoUpdateTimer?.cancel();
      _autoUpdateTimer = null;
    }

    emit(HomeState.success(state.value.copyWith(isAutoUpdateEnabled: newAutoUpdateState)));
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

    emit(HomeState.success(currentState.copyWith(allApps: updatedAllApps)));
  }

  Future<void> _onRemoveService(_RemoveService event, Emitter<HomeState> emit) async {
    final currentState = state.value;

    AppProcessInfo? updateApp(AppProcessInfo app) {
      if (app.packageName != event.packageName) return app;

      final updatedServices = app.services.where((s) => s.serviceName != event.serviceName).toList();

      if (updatedServices.isEmpty) return null;

      double totalRamKb = 0;
      final Set<int> pids = {};
      for (var service in updatedServices) {
        if (service.pid != null) {
          final isNewPid = pids.add(service.pid!);
          if (isNewPid) {
            totalRamKb += service.ramInKb ?? 0;
          }
        }
      }

      return app.copyWith(
        services: updatedServices,
        pids: pids.toList(),
        totalRamInKb: totalRamKb,
        totalRam: formatRam(totalRamKb),
      );
    }

    final updatedAllApps = currentState.allApps.map(updateApp).whereType<AppProcessInfo>().toList();

    emit(HomeState.success(currentState.copyWith(allApps: updatedAllApps)));
  }

  Future<void> _onSetProcessFilter(_SetProcessFilter event, Emitter<HomeState> emit) async {
    emit(HomeState.success(state.value.copyWith(selectedProcessFilter: event.filter)));
  }

  Future<void> _onToggleSortOrder(_ToggleSortOrder event, Emitter<HomeState> emit) async {
    emit(HomeState.success(state.value.copyWith(sortAscending: !state.value.sortAscending)));
  }

  @override
  HomeState? fromJson(Map<String, dynamic> json) {
    try {
      final model = HomeStateModel.fromJson(json);
      return HomeState.success(model);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(HomeState state) {
    return state.value.toJson();
  }
}
