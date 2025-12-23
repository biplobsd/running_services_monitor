part of 'command_output_bloc.dart';

@freezed
sealed class CommandOutputEvent with _$CommandOutputEvent {
  const factory CommandOutputEvent.started({required String entryId, required String command}) = _Started;
  const factory CommandOutputEvent.refresh() = _Refresh;
  const factory CommandOutputEvent.setAutoRefreshInterval(Duration? interval) = _SetAutoRefreshInterval;
  const factory CommandOutputEvent.updateEntry(String entryId) = _UpdateEntry;
  const factory CommandOutputEvent.stopRefreshing() = _StopRefreshing;
}
