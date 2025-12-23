part of 'useful_commands_bloc.dart';

@freezed
sealed class UsefulCommandsEvent with _$UsefulCommandsEvent {
  const factory UsefulCommandsEvent.started() = _Started;
  const factory UsefulCommandsEvent.addCommand({required String title, required String description, required String command}) = _AddCommand;
  const factory UsefulCommandsEvent.removeCommand(String id) = _RemoveCommand;
}
