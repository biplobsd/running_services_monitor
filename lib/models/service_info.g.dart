// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RunningServiceInfo _$RunningServiceInfoFromJson(Map<String, dynamic> json) =>
    _RunningServiceInfo(
      user: json['user'] as String,
      pid: (json['pid'] as num?)?.toInt(),
      processName: json['processName'] as String,
      serviceName: json['serviceName'] as String,
      packageName: json['packageName'] as String,
      isSystemApp: json['isSystemApp'] as bool,
      serviceClass: json['serviceClass'] as String?,
      appName: json['appName'] as String?,
      ramUsage: json['ramUsage'] as String?,
      ramInKb: (json['ramInKb'] as num?)?.toDouble(),
      intent: json['intent'] as String?,
      baseDir: json['baseDir'] as String?,
      dataDir: json['dataDir'] as String?,
      isForeground: json['isForeground'] as bool?,
      foregroundId: (json['foregroundId'] as num?)?.toInt(),
      createTime: json['createTime'] as String?,
      lastActivityTime: json['lastActivityTime'] as String?,
      startRequested: json['startRequested'] as bool?,
      createdFromFg: json['createdFromFg'] as bool?,
      rawServiceRecord: json['rawServiceRecord'] as String?,
      uid: (json['uid'] as num?)?.toInt(),
      recentCallingUid: (json['recentCallingUid'] as num?)?.toInt(),
      connections:
          (json['connections'] as List<dynamic>?)
              ?.map((e) => ConnectionRecord.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      hasBound: json['hasBound'] as bool? ?? false,
    );

Map<String, dynamic> _$RunningServiceInfoToJson(_RunningServiceInfo instance) =>
    <String, dynamic>{
      'user': instance.user,
      'pid': instance.pid,
      'processName': instance.processName,
      'serviceName': instance.serviceName,
      'packageName': instance.packageName,
      'isSystemApp': instance.isSystemApp,
      'serviceClass': instance.serviceClass,
      'appName': instance.appName,
      'ramUsage': instance.ramUsage,
      'ramInKb': instance.ramInKb,
      'intent': instance.intent,
      'baseDir': instance.baseDir,
      'dataDir': instance.dataDir,
      'isForeground': instance.isForeground,
      'foregroundId': instance.foregroundId,
      'createTime': instance.createTime,
      'lastActivityTime': instance.lastActivityTime,
      'startRequested': instance.startRequested,
      'createdFromFg': instance.createdFromFg,
      'rawServiceRecord': instance.rawServiceRecord,
      'uid': instance.uid,
      'recentCallingUid': instance.recentCallingUid,
      'connections': instance.connections,
      'hasBound': instance.hasBound,
    };

_AppProcessInfo _$AppProcessInfoFromJson(Map<String, dynamic> json) =>
    _AppProcessInfo(
      packageName: json['packageName'] as String,
      appName: json['appName'] as String,
      services: (json['services'] as List<dynamic>)
          .map((e) => RunningServiceInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      pids: (json['pids'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      totalRam: json['totalRam'] as String,
      totalRamInKb: (json['totalRamInKb'] as num).toDouble(),
      isSystemApp: json['isSystemApp'] as bool?,
      connections:
          (json['connections'] as List<dynamic>?)
              ?.map((e) => ConnectionRecord.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      processState: json['processState'] as String?,
      adjLevel: json['adjLevel'] as String?,
      hasServices: json['hasServices'] as bool? ?? true,
      ramSources:
          (json['ramSources'] as List<dynamic>?)
              ?.map((e) => RamSourceInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      cachedMemoryKb: (json['cachedMemoryKb'] as num?)?.toDouble() ?? 0,
      processes:
          (json['processes'] as List<dynamic>?)
              ?.map((e) => ProcessEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AppProcessInfoToJson(_AppProcessInfo instance) =>
    <String, dynamic>{
      'packageName': instance.packageName,
      'appName': instance.appName,
      'services': instance.services,
      'pids': instance.pids,
      'totalRam': instance.totalRam,
      'totalRamInKb': instance.totalRamInKb,
      'isSystemApp': instance.isSystemApp,
      'connections': instance.connections,
      'processState': instance.processState,
      'adjLevel': instance.adjLevel,
      'hasServices': instance.hasServices,
      'ramSources': instance.ramSources,
      'cachedMemoryKb': instance.cachedMemoryKb,
      'processes': instance.processes,
    };

_RamSourceInfo _$RamSourceInfoFromJson(Map<String, dynamic> json) =>
    _RamSourceInfo(
      source: $enumDecode(_$RamSourceTypeEnumMap, json['source']),
      ramKb: (json['ramKb'] as num).toDouble(),
      pid: (json['pid'] as num?)?.toInt(),
      processName: json['processName'] as String?,
    );

Map<String, dynamic> _$RamSourceInfoToJson(_RamSourceInfo instance) =>
    <String, dynamic>{
      'source': _$RamSourceTypeEnumMap[instance.source]!,
      'ramKb': instance.ramKb,
      'pid': instance.pid,
      'processName': instance.processName,
    };

const _$RamSourceTypeEnumMap = {
  RamSourceType.pid: 'pid',
  RamSourceType.lru: 'lru',
  RamSourceType.processName: 'processName',
  RamSourceType.meminfoPss: 'meminfoPss',
};

_ProcessEntry _$ProcessEntryFromJson(Map<String, dynamic> json) =>
    _ProcessEntry(
      processName: json['processName'] as String,
      ramKb: (json['ramKb'] as num).toDouble(),
      pid: (json['pid'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProcessEntryToJson(_ProcessEntry instance) =>
    <String, dynamic>{
      'processName': instance.processName,
      'ramKb': instance.ramKb,
      'pid': instance.pid,
    };

_RunningProcessInfo _$RunningProcessInfoFromJson(Map<String, dynamic> json) =>
    _RunningProcessInfo(
      packageName: json['packageName'] as String,
      processName: json['processName'] as String,
      pid: (json['pid'] as num).toInt(),
      uid: (json['uid'] as num).toInt(),
      appName: json['appName'] as String?,
      isSystemApp: json['isSystemApp'] as bool,
      importance: json['importance'] as String,
    );

Map<String, dynamic> _$RunningProcessInfoToJson(_RunningProcessInfo instance) =>
    <String, dynamic>{
      'packageName': instance.packageName,
      'processName': instance.processName,
      'pid': instance.pid,
      'uid': instance.uid,
      'appName': instance.appName,
      'isSystemApp': instance.isSystemApp,
      'importance': instance.importance,
    };

_ConnectionRecord _$ConnectionRecordFromJson(Map<String, dynamic> json) =>
    _ConnectionRecord(
      packageName: json['packageName'] as String,
      serviceName: json['serviceName'] as String,
      bindingPackage: json['bindingPackage'] as String?,
      bindingProcess: json['bindingProcess'] as String?,
      conn: json['conn'] as String?,
      flags: json['flags'] as String?,
      isForeground: json['isForeground'] as bool?,
      isVisible: json['isVisible'] as bool?,
      hasCapabilities: json['hasCapabilities'] as bool?,
      rawConnectionRecord: json['rawConnectionRecord'] as String?,
    );

Map<String, dynamic> _$ConnectionRecordToJson(_ConnectionRecord instance) =>
    <String, dynamic>{
      'packageName': instance.packageName,
      'serviceName': instance.serviceName,
      'bindingPackage': instance.bindingPackage,
      'bindingProcess': instance.bindingProcess,
      'conn': instance.conn,
      'flags': instance.flags,
      'isForeground': instance.isForeground,
      'isVisible': instance.isVisible,
      'hasCapabilities': instance.hasCapabilities,
      'rawConnectionRecord': instance.rawConnectionRecord,
    };
