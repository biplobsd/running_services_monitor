part of 'useful_commands_ui_bloc.dart';

@freezed
sealed class UsefulCommandsUiState with _$UsefulCommandsUiState {
  const factory UsefulCommandsUiState({
    @Default(false) bool showAddForm,
    String? loadingCommandId,
  }) = _UsefulCommandsUiState;
}
