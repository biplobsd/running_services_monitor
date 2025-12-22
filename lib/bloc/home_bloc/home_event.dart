part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.initializeShizuku({@Default(false) bool silent, @Default(false) bool notify}) =
      _InitializeShizuku;
  const factory HomeEvent.loadData({@Default(false) bool silent, @Default(false) bool notify}) = _LoadData;
  const factory HomeEvent.toggleAutoUpdate() = _ToggleAutoUpdate;
  const factory HomeEvent.toggleSearch() = _ToggleSearch;
  const factory HomeEvent.updateSearchQuery(String query) = _UpdateSearchQuery;
  const factory HomeEvent.removeApp(String packageName) = _RemoveApp;
  const factory HomeEvent.removeService({required String packageName, required String serviceName}) = _RemoveService;
  const factory HomeEvent.removeByPid({required String packageName, required int pid}) = _RemoveByPid;
  const factory HomeEvent.setProcessFilter(ProcessStateFilter filter) = _SetProcessFilter;
  const factory HomeEvent.toggleSortOrder() = _ToggleSortOrder;
  const factory HomeEvent.updateRamInfo(
    List<AppProcessInfo> apps,
    Future<SystemRamInfo?> systemRamInfoFuture,
    bool notify,
  ) = _UpdateRamInfo;
  const factory HomeEvent.toggleShowCoreApps() = _ToggleShowCoreApps;
}
