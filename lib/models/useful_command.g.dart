// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'useful_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UsefulCommand _$UsefulCommandFromJson(Map<String, dynamic> json) =>
    _UsefulCommand(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      command: json['command'] as String,
      isCustom: json['isCustom'] as bool? ?? false,
    );

Map<String, dynamic> _$UsefulCommandToJson(_UsefulCommand instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'command': instance.command,
      'isCustom': instance.isCustom,
    };
