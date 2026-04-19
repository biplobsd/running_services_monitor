part of 'command_log_commands_ui_bloc.dart';

@freezed
class CommandLogCommandsUiState with _$CommandLogCommandsUiState {
  const factory CommandLogCommandsUiState({
    @Default(false) bool showAddForm,
    String? loadingCommandId,
  }) = _CommandLogCommandsUiState;

  const CommandLogCommandsUiState._();
}
