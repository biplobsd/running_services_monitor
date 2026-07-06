// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_info_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppInfoStateModel _$AppInfoStateModelFromJson(Map<String, dynamic> json) =>
    _AppInfoStateModel(
      cachedApps:
          (json['cachedApps'] as Map<String, dynamic>?)?.map(
            (k, e) =>
                MapEntry(k, CachedAppInfo.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$AppInfoStateModelToJson(_AppInfoStateModel instance) =>
    <String, dynamic>{'cachedApps': instance.cachedApps};

_CachedAppInfo _$CachedAppInfoFromJson(Map<String, dynamic> json) =>
    _CachedAppInfo(
      appName: json['appName'] as String,
      isSystemApp: json['isSystemApp'] as bool? ?? false,
    );

Map<String, dynamic> _$CachedAppInfoToJson(_CachedAppInfo instance) =>
    <String, dynamic>{
      'appName': instance.appName,
      'isSystemApp': instance.isSystemApp,
    };
