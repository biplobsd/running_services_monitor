part of 'app_info_bloc.dart';

@freezed
abstract class AppInfoEvent with _$AppInfoEvent {
  const factory AppInfoEvent.loadAllApps({String? mode}) = _LoadAllApps;
  const factory AppInfoEvent.loadAppInfo(String packageName, {String? mode}) = _LoadAppInfo;
  const factory AppInfoEvent.updateAppsInfo(List<String> packageNames) = _UpdateAppsInfo;
}
