import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'command_log_commands_ui_event.dart';
part 'command_log_commands_ui_state.dart';
part 'command_log_commands_ui_bloc.freezed.dart';

class CommandLogCommandsUiBloc extends Bloc<CommandLogCommandsUiEvent, CommandLogCommandsUiState> {
  CommandLogCommandsUiBloc() : super(const CommandLogCommandsUiState()) {
    on<_ToggleAddForm>(_onToggleAddForm);
    on<_HideAddForm>(_onHideAddForm);
    on<_SetLoadingCommand>(_onSetLoadingCommand);
    on<_SetEditingCommand>(_onSetEditingCommand);
  }

  void _onToggleAddForm(_ToggleAddForm event, Emitter<CommandLogCommandsUiState> emit) {
    emit(state.copyWith(showAddForm: !state.showAddForm));
  }

  void _onHideAddForm(_HideAddForm event, Emitter<CommandLogCommandsUiState> emit) {
    emit(state.copyWith(showAddForm: false));
  }

  void _onSetLoadingCommand(_SetLoadingCommand event, Emitter<CommandLogCommandsUiState> emit) {
    emit(state.copyWith(loadingCommandId: event.commandId));
  }

  void _onSetEditingCommand(_SetEditingCommand event, Emitter<CommandLogCommandsUiState> emit) {
    emit(state.copyWith(editingCommandId: event.commandId));
  }
}
