part of 'app_details_bloc.dart';

@freezed
class AppDetailsEvent with _$AppDetailsEvent {
  const factory AppDetailsEvent.started() = _Started;
  const factory AppDetailsEvent.loadDetails(AppProcessInfo appInfo) = _LoadDetails;
}
