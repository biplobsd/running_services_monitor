part of 'command_log_commands_ui_bloc.dart';

@freezed
sealed class CommandLogCommandsUiEvent with _$CommandLogCommandsUiEvent {
  const factory CommandLogCommandsUiEvent.toggleAddForm() = _ToggleAddForm;
  const factory CommandLogCommandsUiEvent.hideAddForm() = _HideAddForm;
  const factory CommandLogCommandsUiEvent.setLoadingCommand(String? commandId) = _SetLoadingCommand;
}
