part of 'command_log_commands_ui_bloc.dart';

sealed class CommandLogCommandsUiEvent {
  const CommandLogCommandsUiEvent();
}

final class CommandLogCommandsUiToggleAddForm extends CommandLogCommandsUiEvent {
  const CommandLogCommandsUiToggleAddForm();
}

final class CommandLogCommandsUiHideAddForm extends CommandLogCommandsUiEvent {
  const CommandLogCommandsUiHideAddForm();
}

final class CommandLogCommandsUiSetLoadingCommand extends CommandLogCommandsUiEvent {
  final String? commandId;
  const CommandLogCommandsUiSetLoadingCommand(this.commandId);
}
