part of 'useful_commands_bloc.dart';

@freezed
sealed class UsefulCommandsState with _$UsefulCommandsState {
  const UsefulCommandsState._();

  const factory UsefulCommandsState({@Default([]) List<UsefulCommand> userCommands, @Default(<String>{}) Set<String> hiddenDefaultCommandIds}) =
      _UsefulCommandsState;

  List<UsefulCommand> get commands {
    final visibleDefaults = UsefulCommandsBloc.defaultCommands.where((c) => !hiddenDefaultCommandIds.contains(c.id)).toList();
    return [...userCommands, ...visibleDefaults];
  }

  bool get hasHiddenDefaults => hiddenDefaultCommandIds.isNotEmpty;

  factory UsefulCommandsState.fromJson(Map<String, dynamic> json) => _$UsefulCommandsStateFromJson(json);
}
