part of 'command_log_commands_ui_bloc.dart';

class CommandLogCommandsUiState {
  final bool showAddForm;
  final String? loadingCommandId;

  const CommandLogCommandsUiState({
    this.showAddForm = false,
    this.loadingCommandId,
  });

  CommandLogCommandsUiState copyWith({
    bool? showAddForm,
    String? Function()? loadingCommandId,
  }) {
    return CommandLogCommandsUiState(
      showAddForm: showAddForm ?? this.showAddForm,
      loadingCommandId: loadingCommandId != null ? loadingCommandId() : this.loadingCommandId,
    );
  }
}
