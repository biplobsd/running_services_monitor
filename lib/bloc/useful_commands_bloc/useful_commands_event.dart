part of 'useful_commands_bloc.dart';

@freezed
sealed class UsefulCommandsEvent with _$UsefulCommandsEvent {
  const factory UsefulCommandsEvent.started() = _Started;
  const factory UsefulCommandsEvent.addCommand({required String title, required String description, required String command}) = _AddCommand;
  const factory UsefulCommandsEvent.updateCommand({required String id, required String title, required String description, required String command}) = _UpdateCommand;
  const factory UsefulCommandsEvent.removeCommand(String id) = _RemoveCommand;
  const factory UsefulCommandsEvent.hideDefaultCommand(String id) = _HideDefaultCommand;
  const factory UsefulCommandsEvent.resetDefaults() = _ResetDefaults;
}
