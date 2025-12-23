import 'package:freezed_annotation/freezed_annotation.dart';

part 'useful_command.freezed.dart';
part 'useful_command.g.dart';

@freezed
abstract class UsefulCommand with _$UsefulCommand {
  const factory UsefulCommand({
    required String id,
    required String title,
    required String description,
    required String command,
    @Default(false) bool isCustom,
  }) = _UsefulCommand;

  factory UsefulCommand.fromJson(Map<String, dynamic> json) => _$UsefulCommandFromJson(json);
}
