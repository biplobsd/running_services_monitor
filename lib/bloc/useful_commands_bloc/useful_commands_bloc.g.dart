// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'useful_commands_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UsefulCommandsState _$UsefulCommandsStateFromJson(Map<String, dynamic> json) =>
    _UsefulCommandsState(
      commands:
          (json['commands'] as List<dynamic>?)
              ?.map((e) => UsefulCommand.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UsefulCommandsStateToJson(
  _UsefulCommandsState instance,
) => <String, dynamic>{'commands': instance.commands};
