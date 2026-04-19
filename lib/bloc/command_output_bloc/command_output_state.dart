part of 'command_output_bloc.dart';

@freezed
sealed class CommandOutputState with _$CommandOutputState {
  const factory CommandOutputState({
    required String currentEntryId,
    required String command,
    Duration? autoRefreshInterval,
    @Default(false) bool isRefreshing,
    @Default(false) bool isSearchVisible,
    @Default('') String searchQuery,
    @Default(<int>[]) List<int> searchMatches,
    @Default(-1) int currentMatchIndex,
  }) = _CommandOutputState;
}
