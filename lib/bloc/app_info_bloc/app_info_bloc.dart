import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:running_services_monitor/l10n/l10n_keys.dart';
import 'package:running_services_monitor/models/app_info_state_model.dart';
import 'package:running_services_monitor/services/app_info_service.dart';

part 'app_info_event.dart';
part 'app_info_state.dart';
part 'app_info_bloc.freezed.dart';

@lazySingleton
class AppInfoBloc extends HydratedBloc<AppInfoEvent, AppInfoState> {
  final AppInfoService _appInfoService;

  AppInfoBloc(this._appInfoService) : super(const AppInfoState.initial(AppInfoStateModel())) {
    on<_LoadAllApps>(_onLoadAllApps);
    on<_LoadAppInfo>(_onLoadAppInfo);
    on<_UpdateAppsInfo>(_onUpdateAppsInfo);
  }

  Future<void> _onLoadAllApps(_LoadAllApps event, Emitter<AppInfoState> emit) async {
    emit(AppInfoState.loading(state.value));
    try {
      await _appInfoService.ensureCacheValid();
      final cachedAppsMap = _appInfoService.cachedAppsMap;
      if (cachedAppsMap == null || cachedAppsMap.isEmpty) {
        emit(AppInfoState.success(state.value));
        return;
      }

      final Map<String, CachedAppInfo> newCachedApps = {};
      for (final entry in cachedAppsMap.entries) {
        newCachedApps[entry.key] = CachedAppInfo(
          appName: entry.value.name,
          icon: entry.value.icon,
          isSystemApp: entry.value.isSystemApp,
        );
      }

      emit(AppInfoState.success(state.value.copyWith(cachedApps: newCachedApps)));
    } catch (e) {
      emit(AppInfoState.failure(state.value, L10nKeys.errorLoadingData));
    }
  }

  Future<void> _onLoadAppInfo(_LoadAppInfo event, Emitter<AppInfoState> emit) async {
    try {
      final appInfo = await _appInfoService.getAppInfo(event.packageName);
      if (appInfo == null) return;

      final updatedCachedApps = Map<String, CachedAppInfo>.from(state.value.cachedApps);
      updatedCachedApps[event.packageName] = CachedAppInfo(
        appName: appInfo.name,
        icon: appInfo.icon,
        isSystemApp: appInfo.isSystemApp,
      );

      emit(AppInfoState.success(state.value.copyWith(cachedApps: updatedCachedApps)));
    } catch (_) {}
  }

  Future<void> _onUpdateAppsInfo(_UpdateAppsInfo event, Emitter<AppInfoState> emit) async {
    try {
      final cachedAppsMap = _appInfoService.cachedAppsMap;
      if (cachedAppsMap == null || cachedAppsMap.isEmpty) return;

      final updatedCachedApps = Map<String, CachedAppInfo>.from(state.value.cachedApps);

      for (final packageName in event.packageNames) {
        if (updatedCachedApps.containsKey(packageName)) continue;

        final appInfo = cachedAppsMap[packageName];
        if (appInfo != null) {
          updatedCachedApps[packageName] = CachedAppInfo(
            appName: appInfo.name,
            icon: appInfo.icon,
            isSystemApp: appInfo.isSystemApp,
          );
        }
      }

      emit(AppInfoState.success(state.value.copyWith(cachedApps: updatedCachedApps)));
    } catch (_) {}
  }

  @override
  AppInfoState? fromJson(Map<String, dynamic> json) {
    try {
      final model = AppInfoStateModel.fromJson(json);
      return AppInfoState.success(model);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(AppInfoState state) {
    return state.value.toJson();
  }
}
