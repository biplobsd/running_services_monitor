// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeStateModel _$HomeStateModelFromJson(Map<String, dynamic> json) =>
    _HomeStateModel(
      allApps:
          (json['allApps'] as List<dynamic>?)
              ?.map((e) => AppProcessInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      systemRamInfo: json['systemRamInfo'] == null
          ? const SystemRamInfo()
          : SystemRamInfo.fromJson(
              json['systemRamInfo'] as Map<String, dynamic>,
            ),
      showCoreApps: json['showCoreApps'] as bool? ?? false,
    );

Map<String, dynamic> _$HomeStateModelToJson(_HomeStateModel instance) =>
    <String, dynamic>{
      'allApps': instance.allApps,
      'systemRamInfo': instance.systemRamInfo,
      'showCoreApps': instance.showCoreApps,
    };
