// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'changelog_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChangelogInfo _$ChangelogInfoFromJson(Map<String, dynamic> json) =>
    _ChangelogInfo(
      version: json['version'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$ChangelogInfoToJson(_ChangelogInfo instance) =>
    <String, dynamic>{
      'version': instance.version,
      'title': instance.title,
      'body': instance.body,
      'date': instance.date,
    };
