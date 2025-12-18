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
      isSearching: json['isSearching'] as bool? ?? false,
      searchQuery: json['searchQuery'] as String? ?? '',
      selectedProcessFilter:
          $enumDecodeNullable(
            _$ProcessStateFilterEnumMap,
            json['selectedProcessFilter'],
          ) ??
          ProcessStateFilter.all,
      sortAscending: json['sortAscending'] as bool? ?? false,
    );

Map<String, dynamic> _$HomeStateModelToJson(_HomeStateModel instance) =>
    <String, dynamic>{
      'allApps': instance.allApps,
      'systemRamInfo': instance.systemRamInfo,
      'isSearching': instance.isSearching,
      'searchQuery': instance.searchQuery,
      'selectedProcessFilter':
          _$ProcessStateFilterEnumMap[instance.selectedProcessFilter]!,
      'sortAscending': instance.sortAscending,
    };

const _$ProcessStateFilterEnumMap = {
  ProcessStateFilter.all: 'all',
  ProcessStateFilter.active: 'active',
  ProcessStateFilter.cached: 'cached',
  ProcessStateFilter.withServices: 'withServices',
};
