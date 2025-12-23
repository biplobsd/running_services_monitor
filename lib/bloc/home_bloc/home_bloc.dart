import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:running_services_monitor/core/utils/log_helper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:running_services_monitor/l10n/l10n_keys.dart';
import 'package:running_services_monitor/models/home_state_model.dart';
import 'package:running_services_monitor/models/process_state_filter.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/models/system_ram_info.dart';
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
    on<_SetAutoUpdateInterval>(_onSetAutoUpdateInterval);
    on<_ToggleSearch>(_onToggleSearch);
    on<_UpdateSearchQuery>(_onUpdateSearchQuery, transformer: (events, mapper) => events.debounceTime(const Duration(milliseconds: 300)).switchMap(mapper));
    on<_RemoveApp>(_onRemoveApp);
    on<_RemoveService>(_onRemoveService);
    on<_RemoveByPid>(_onRemoveByPid);
    on<_SetProcessFilter>(_onSetProcessFilter);
    on<_ToggleSortOrder>(_onToggleSortOrder);
    on<_UpdateRamInfo>(_onUpdateRamInfo);
    on<_ToggleShowCoreApps>(_onToggleShowCoreApps);
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
    } catch (e, s) {
      logError(e, s);
      emit(HomeState.failure(state.value.copyWith(shizukuReady: false), L10nKeys.errorInitializingShizuku));
    }
  }

  Future<void> _onLoadData(_LoadData event, Emitter<HomeState> emit) async {
    final isLoading = state.mapOrNull(loading: (value) => true) ?? false;
    if (state.value.isLoadingRam || isLoading) {
      return;
    }

    if (event.silent) {
      await _loadDataSimple(emit, event);
    } else {
      await _loadDataWithStream(emit, event);
    }
  }

  Future<void> _loadDataSimple(Emitter<HomeState> emit, _LoadData event) async {
    emit(HomeState.loading(state.value.copyWith(isLoadingRam: true)));
    try {
      final previousApps = {for (var app in state.value.allApps) app.packageName: app};
      final Map<String, AppProcessInfo> appsMap = {};
      final streamResult = _processService.streamAppProcessInfosWithRamInfo();

      final ramInfoCompleter = Completer<Map<String, AppProcessInfo>>();
      streamResult.onRamInfoReady((updatedAppsMap) {
        ramInfoCompleter.complete(updatedAppsMap);
      });

      await for (final app in streamResult.apps) {
        final prevApp = previousApps[app.packageName];
        if (prevApp != null && app.totalRamInKb <= 0) {
          appsMap[app.packageName] = app.copyWith(totalRamInKb: prevApp.totalRamInKb, ramSources: prevApp.ramSources);
        } else {
          appsMap[app.packageName] = app;
        }
      }

      final updatedAppsMap = await ramInfoCompleter.future;
      final ramInfo = await streamResult.systemRamInfo;

      final showCoreApps = state.value.showCoreApps;
      final allApps = updatedAppsMap.values.where((a) => showCoreApps || !a.isCoreApp).toList();
      emit(
        HomeState.success(
          state.value.copyWith(allApps: allApps, systemRamInfo: ramInfo ?? state.value.systemRamInfo, isLoadingRam: false),
          event.notify ? L10nKeys.refreshedSuccessfully : null,
        ),
      );
    } catch (e, s) {
      logError(e, s);
      emit(HomeState.failure(state.value.copyWith(isLoadingRam: false), L10nKeys.errorLoadingData));
    }
  }

  Future<void> _loadDataWithStream(Emitter<HomeState> emit, _LoadData event) async {
    emit(HomeState.loading(state.value.copyWith(isLoadingRam: true), L10nKeys.loadingApps));
    try {
      final Map<String, AppProcessInfo> appsMap = {};
      final streamResult = _processService.streamAppProcessInfosWithRamInfo();

      streamResult.onRamInfoReady((updatedAppsMap) {
        add(_UpdateRamInfo(updatedAppsMap.values.toList(), streamResult.systemRamInfo, true));
      });

      await for (final app in streamResult.apps) {
        appsMap[app.packageName] = app;
        final allApps = appsMap.values.toList();
        emit(HomeState.loading(state.value.copyWith(allApps: allApps, isLoadingRam: true)));
      }

      final allApps = appsMap.values.toList();
      emit(HomeState.success(state.value.copyWith(allApps: allApps, isLoadingRam: true)));
    } catch (e, s) {
      logError(e, s);
      emit(HomeState.failure(state.value.copyWith(isLoadingRam: false), L10nKeys.errorLoadingData));
    }
  }

  Future<void> _onToggleAutoUpdate(_ToggleAutoUpdate event, Emitter<HomeState> emit) async {
    final newAutoUpdateState = !state.value.isAutoUpdateEnabled;

    if (newAutoUpdateState) {
      _autoUpdateTimer = Timer.periodic(state.value.autoUpdateInterval ?? const Duration(seconds: 3), (_) {
        add(const HomeEvent.loadData(silent: true));
      });
    } else {
      _autoUpdateTimer?.cancel();
      _autoUpdateTimer = null;
    }

    emit(HomeState.success(state.value.copyWith(isAutoUpdateEnabled: newAutoUpdateState)));
  }

  Future<void> _onSetAutoUpdateInterval(_SetAutoUpdateInterval event, Emitter<HomeState> emit) async {
    _autoUpdateTimer?.cancel();
    _autoUpdateTimer = null;

    if (event.interval != null) {
      _autoUpdateTimer = Timer.periodic(event.interval!, (_) {
        add(const HomeEvent.loadData(silent: true));
      });
      emit(HomeState.success(state.value.copyWith(isAutoUpdateEnabled: true, autoUpdateInterval: event.interval)));
    } else {
      emit(HomeState.success(state.value.copyWith(isAutoUpdateEnabled: false, autoUpdateInterval: null)));
    }
  }

  Future<void> _onToggleSearch(_ToggleSearch event, Emitter<HomeState> emit) async {
    final newSearchState = !state.value.isSearching;

    emit(HomeState.success(state.value.copyWith(isSearching: newSearchState, searchQuery: newSearchState ? state.value.searchQuery : '')));
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

      return app.copyWith(services: updatedServices, pids: pids.toList(), totalRamInKb: totalRamKb);
    }

    final updatedAllApps = currentState.allApps.map(updateApp).whereType<AppProcessInfo>().toList();

    emit(HomeState.success(currentState.copyWith(allApps: updatedAllApps)));
  }

  Future<void> _onRemoveByPid(_RemoveByPid event, Emitter<HomeState> emit) async {
    final currentState = state.value;

    AppProcessInfo updateApp(AppProcessInfo app) {
      if (app.packageName != event.packageName) return app;

      final updatedServices = app.services.where((s) => s.pid != event.pid).toList();
      final updatedPids = app.pids.where((p) => p != event.pid).toList();
      final updatedProcesses = app.processes.where((p) => p.pid != event.pid).toList();

      double totalRamKb = 0;
      final Set<int> pids = {};

      for (var process in updatedProcesses) {
        if (process.pid != null) {
          final isNewPid = pids.add(process.pid!);
          if (isNewPid) {
            totalRamKb += process.ramKb;
          }
        }
      }

      for (var service in updatedServices) {
        if (service.pid != null) {
          final isNewPid = pids.add(service.pid!);
          if (isNewPid) {
            totalRamKb += service.ramInKb ?? 0;
          }
        }
      }

      return app.copyWith(services: updatedServices, pids: updatedPids, processes: updatedProcesses, totalRamInKb: totalRamKb);
    }

    final updatedAllApps = currentState.allApps.map(updateApp).toList();

    emit(HomeState.success(currentState.copyWith(allApps: updatedAllApps)));
  }

  Future<void> _onSetProcessFilter(_SetProcessFilter event, Emitter<HomeState> emit) async {
    emit(HomeState.success(state.value.copyWith(selectedProcessFilter: event.filter)));
  }

  Future<void> _onToggleSortOrder(_ToggleSortOrder event, Emitter<HomeState> emit) async {
    emit(HomeState.success(state.value.copyWith(sortAscending: !state.value.sortAscending)));
  }

  Future<void> _onUpdateRamInfo(_UpdateRamInfo event, Emitter<HomeState> emit) async {
    final ramInfo = await event.systemRamInfoFuture;
    emit(
      HomeState.success(
        state.value.copyWith(
          allApps: state.value.showCoreApps ? event.apps : event.apps.where((a) => !a.isCoreApp).toList(),
          systemRamInfo: ramInfo ?? state.value.systemRamInfo,
          isLoadingRam: false,
        ),
        event.notify ? L10nKeys.refreshedSuccessfully : null,
      ),
    );
  }

  Future<void> _onToggleShowCoreApps(_ToggleShowCoreApps event, Emitter<HomeState> emit) async {
    final newValue = !state.value.showCoreApps;
    emit(HomeState.success(state.value.copyWith(showCoreApps: newValue, allApps: [])));
    add(const HomeEvent.loadData());
  }

  @override
  HomeState? fromJson(Map<String, dynamic> json) {
    try {
      final model = HomeStateModel.fromJson(json);
      return HomeState.success(model);
    } catch (e, s) {
      logError(e, s);
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(HomeState state) {
    return state.value.toJson();
  }
}
