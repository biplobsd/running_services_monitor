// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_ram_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SystemRamInfo _$SystemRamInfoFromJson(Map<String, dynamic> json) =>
    _SystemRamInfo(
      totalRamKb: (json['totalRamKb'] as num?)?.toDouble() ?? 0.0,
      totalRamStatus: json['totalRamStatus'] as String? ?? '',
      freeRamKb: (json['freeRamKb'] as num?)?.toDouble() ?? 0.0,
      cachedPssKb: (json['cachedPssKb'] as num?)?.toDouble() ?? 0.0,
      cachedKernelKb: (json['cachedKernelKb'] as num?)?.toDouble() ?? 0.0,
      actualFreeKb: (json['actualFreeKb'] as num?)?.toDouble() ?? 0.0,
      usedRamKb: (json['usedRamKb'] as num?)?.toDouble() ?? 0.0,
      usedPssKb: (json['usedPssKb'] as num?)?.toDouble() ?? 0.0,
      kernelKb: (json['kernelKb'] as num?)?.toDouble() ?? 0.0,
      gpuKb: (json['gpuKb'] as num?)?.toDouble() ?? 0.0,
      lostRamKb: (json['lostRamKb'] as num?)?.toDouble() ?? 0.0,
      zramPhysicalKb: (json['zramPhysicalKb'] as num?)?.toDouble() ?? 0.0,
      zramSwapKb: (json['zramSwapKb'] as num?)?.toDouble() ?? 0.0,
      zramTotalSwapKb: (json['zramTotalSwapKb'] as num?)?.toDouble() ?? 0.0,
      oomKb: (json['oomKb'] as num?)?.toDouble() ?? 0.0,
      restoreLimitKb: (json['restoreLimitKb'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$SystemRamInfoToJson(_SystemRamInfo instance) =>
    <String, dynamic>{
      'totalRamKb': instance.totalRamKb,
      'totalRamStatus': instance.totalRamStatus,
      'freeRamKb': instance.freeRamKb,
      'cachedPssKb': instance.cachedPssKb,
      'cachedKernelKb': instance.cachedKernelKb,
      'actualFreeKb': instance.actualFreeKb,
      'usedRamKb': instance.usedRamKb,
      'usedPssKb': instance.usedPssKb,
      'kernelKb': instance.kernelKb,
      'gpuKb': instance.gpuKb,
      'lostRamKb': instance.lostRamKb,
      'zramPhysicalKb': instance.zramPhysicalKb,
      'zramSwapKb': instance.zramSwapKb,
      'zramTotalSwapKb': instance.zramTotalSwapKb,
      'oomKb': instance.oomKb,
      'restoreLimitKb': instance.restoreLimitKb,
    };
