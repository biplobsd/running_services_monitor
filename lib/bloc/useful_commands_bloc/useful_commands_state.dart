part of 'useful_commands_bloc.dart';

@freezed
sealed class UsefulCommandsState with _$UsefulCommandsState {
  const factory UsefulCommandsState({@Default([]) List<UsefulCommand> commands}) = _UsefulCommandsState;

  factory UsefulCommandsState.fromJson(Map<String, dynamic> json) => _$UsefulCommandsStateFromJson(json);
}
