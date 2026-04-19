part of 'useful_commands_ui_bloc.dart';

@freezed
sealed class UsefulCommandsUiEvent with _$UsefulCommandsUiEvent {
  const factory UsefulCommandsUiEvent.toggleAddForm() = _ToggleAddForm;
  const factory UsefulCommandsUiEvent.hideAddForm() = _HideAddForm;
  const factory UsefulCommandsUiEvent.setLoadingCommand(String? commandId) = _SetLoadingCommand;
}
