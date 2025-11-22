part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.initializeShizuku() = _InitializeShizuku;
  const factory HomeEvent.loadData({@Default(false) bool silent}) = _LoadData;
  const factory HomeEvent.toggleAutoUpdate() = _ToggleAutoUpdate;
  const factory HomeEvent.toggleSearch() = _ToggleSearch;
  const factory HomeEvent.updateSearchQuery(String query) = _UpdateSearchQuery;
  const factory HomeEvent.autoUpdateTick() = _AutoUpdateTick;
}
