part of 'command_output_bloc.dart';

@freezed
sealed class CommandOutputState with _$CommandOutputState {
  const factory CommandOutputState({
    required String currentEntryId,
    required String command,
    Duration? autoRefreshInterval,
    @Default(false) bool isRefreshing,
  }) = _CommandOutputState;
}
