import 'package:flutter_bloc/flutter_bloc.dart';

part 'command_log_commands_ui_event.dart';
part 'command_log_commands_ui_state.dart';

class CommandLogCommandsUiBloc extends Bloc<CommandLogCommandsUiEvent, CommandLogCommandsUiState> {
  CommandLogCommandsUiBloc() : super(const CommandLogCommandsUiState()) {
    on<CommandLogCommandsUiToggleAddForm>(_onToggleAddForm);
    on<CommandLogCommandsUiHideAddForm>(_onHideAddForm);
    on<CommandLogCommandsUiSetLoadingCommand>(_onSetLoadingCommand);
  }

  void _onToggleAddForm(CommandLogCommandsUiToggleAddForm event, Emitter<CommandLogCommandsUiState> emit) {
    emit(state.copyWith(showAddForm: !state.showAddForm));
  }

  void _onHideAddForm(CommandLogCommandsUiHideAddForm event, Emitter<CommandLogCommandsUiState> emit) {
    emit(state.copyWith(showAddForm: false));
  }

  void _onSetLoadingCommand(CommandLogCommandsUiSetLoadingCommand event, Emitter<CommandLogCommandsUiState> emit) {
    emit(state.copyWith(loadingCommandId: () => event.commandId));
  }
}
