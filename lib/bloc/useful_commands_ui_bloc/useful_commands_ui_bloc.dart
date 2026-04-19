import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'useful_commands_ui_event.dart';
part 'useful_commands_ui_state.dart';
part 'useful_commands_ui_bloc.freezed.dart';

class UsefulCommandsUiBloc extends Bloc<UsefulCommandsUiEvent, UsefulCommandsUiState> {
  UsefulCommandsUiBloc() : super(const UsefulCommandsUiState()) {
    on<_ToggleAddForm>(_onToggleAddForm);
    on<_HideAddForm>(_onHideAddForm);
    on<_SetLoadingCommand>(_onSetLoadingCommand);
  }

  void _onToggleAddForm(_ToggleAddForm event, Emitter<UsefulCommandsUiState> emit) {
    emit(state.copyWith(showAddForm: !state.showAddForm));
  }

  void _onHideAddForm(_HideAddForm event, Emitter<UsefulCommandsUiState> emit) {
    emit(state.copyWith(showAddForm: false));
  }

  void _onSetLoadingCommand(_SetLoadingCommand event, Emitter<UsefulCommandsUiState> emit) {
    emit(state.copyWith(loadingCommandId: event.commandId));
  }
}
