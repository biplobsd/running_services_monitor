// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'useful_commands_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UsefulCommandsState _$UsefulCommandsStateFromJson(Map<String, dynamic> json) =>
    _UsefulCommandsState(
      userCommands:
          (json['userCommands'] as List<dynamic>?)
              ?.map((e) => UsefulCommand.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      hiddenDefaultCommandIds:
          (json['hiddenDefaultCommandIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toSet() ??
          const <String>{},
    );

Map<String, dynamic> _$UsefulCommandsStateToJson(
  _UsefulCommandsState instance,
) => <String, dynamic>{
  'userCommands': instance.userCommands,
  'hiddenDefaultCommandIds': instance.hiddenDefaultCommandIds.toList(),
};
