// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meminfo_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MemInfoData _$MemInfoDataFromJson(Map<String, dynamic> json) => _MemInfoData(
  packageName: json['packageName'] as String,
  rawOutput: json['rawOutput'] as String,
  pid: (json['pid'] as num).toInt(),
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => MemInfoCategory.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  total: json['total'] == null
      ? null
      : MemInfoTotal.fromJson(json['total'] as Map<String, dynamic>),
  appSummary: json['appSummary'] == null
      ? null
      : AppSummary.fromJson(json['appSummary'] as Map<String, dynamic>),
  objects: json['objects'] == null
      ? null
      : ObjectsInfo.fromJson(json['objects'] as Map<String, dynamic>),
  nativeAllocations: json['nativeAllocations'] == null
      ? null
      : NativeAllocations.fromJson(
          json['nativeAllocations'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$MemInfoDataToJson(_MemInfoData instance) =>
    <String, dynamic>{
      'packageName': instance.packageName,
      'rawOutput': instance.rawOutput,
      'pid': instance.pid,
      'categories': instance.categories,
      'total': instance.total,
      'appSummary': instance.appSummary,
      'objects': instance.objects,
      'nativeAllocations': instance.nativeAllocations,
    };

_MemInfoCategory _$MemInfoCategoryFromJson(Map<String, dynamic> json) =>
    _MemInfoCategory(
      name: json['name'] as String,
      pssTotal: (json['pssTotal'] as num).toInt(),
      privateDirty: (json['privateDirty'] as num?)?.toInt() ?? 0,
      privateClean: (json['privateClean'] as num?)?.toInt() ?? 0,
      swapPssDirty: (json['swapPssDirty'] as num?)?.toInt() ?? 0,
      rssTotal: (json['rssTotal'] as num?)?.toInt() ?? 0,
      heapSize: (json['heapSize'] as num?)?.toInt(),
      heapAlloc: (json['heapAlloc'] as num?)?.toInt(),
      heapFree: (json['heapFree'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MemInfoCategoryToJson(_MemInfoCategory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'pssTotal': instance.pssTotal,
      'privateDirty': instance.privateDirty,
      'privateClean': instance.privateClean,
      'swapPssDirty': instance.swapPssDirty,
      'rssTotal': instance.rssTotal,
      'heapSize': instance.heapSize,
      'heapAlloc': instance.heapAlloc,
      'heapFree': instance.heapFree,
    };

_MemInfoTotal _$MemInfoTotalFromJson(Map<String, dynamic> json) =>
    _MemInfoTotal(
      pssTotal: (json['pssTotal'] as num).toInt(),
      privateDirty: (json['privateDirty'] as num).toInt(),
      privateClean: (json['privateClean'] as num).toInt(),
      swapPssDirty: (json['swapPssDirty'] as num).toInt(),
      rssTotal: (json['rssTotal'] as num).toInt(),
      heapSize: (json['heapSize'] as num).toInt(),
      heapAlloc: (json['heapAlloc'] as num).toInt(),
      heapFree: (json['heapFree'] as num).toInt(),
    );

Map<String, dynamic> _$MemInfoTotalToJson(_MemInfoTotal instance) =>
    <String, dynamic>{
      'pssTotal': instance.pssTotal,
      'privateDirty': instance.privateDirty,
      'privateClean': instance.privateClean,
      'swapPssDirty': instance.swapPssDirty,
      'rssTotal': instance.rssTotal,
      'heapSize': instance.heapSize,
      'heapAlloc': instance.heapAlloc,
      'heapFree': instance.heapFree,
    };

_AppSummary _$AppSummaryFromJson(Map<String, dynamic> json) => _AppSummary(
  javaHeapPss: (json['javaHeapPss'] as num?)?.toInt() ?? 0,
  javaHeapRss: (json['javaHeapRss'] as num?)?.toInt() ?? 0,
  nativeHeapPss: (json['nativeHeapPss'] as num?)?.toInt() ?? 0,
  nativeHeapRss: (json['nativeHeapRss'] as num?)?.toInt() ?? 0,
  codePss: (json['codePss'] as num?)?.toInt() ?? 0,
  codeRss: (json['codeRss'] as num?)?.toInt() ?? 0,
  stackPss: (json['stackPss'] as num?)?.toInt() ?? 0,
  stackRss: (json['stackRss'] as num?)?.toInt() ?? 0,
  graphicsPss: (json['graphicsPss'] as num?)?.toInt() ?? 0,
  graphicsRss: (json['graphicsRss'] as num?)?.toInt() ?? 0,
  privateOther: (json['privateOther'] as num?)?.toInt() ?? 0,
  system: (json['system'] as num?)?.toInt() ?? 0,
  unknownRss: (json['unknownRss'] as num?)?.toInt() ?? 0,
  totalPss: (json['totalPss'] as num?)?.toInt() ?? 0,
  totalRss: (json['totalRss'] as num?)?.toInt() ?? 0,
  totalSwapPss: (json['totalSwapPss'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$AppSummaryToJson(_AppSummary instance) =>
    <String, dynamic>{
      'javaHeapPss': instance.javaHeapPss,
      'javaHeapRss': instance.javaHeapRss,
      'nativeHeapPss': instance.nativeHeapPss,
      'nativeHeapRss': instance.nativeHeapRss,
      'codePss': instance.codePss,
      'codeRss': instance.codeRss,
      'stackPss': instance.stackPss,
      'stackRss': instance.stackRss,
      'graphicsPss': instance.graphicsPss,
      'graphicsRss': instance.graphicsRss,
      'privateOther': instance.privateOther,
      'system': instance.system,
      'unknownRss': instance.unknownRss,
      'totalPss': instance.totalPss,
      'totalRss': instance.totalRss,
      'totalSwapPss': instance.totalSwapPss,
    };

_ObjectsInfo _$ObjectsInfoFromJson(Map<String, dynamic> json) => _ObjectsInfo(
  views: (json['views'] as num?)?.toInt() ?? 0,
  viewRootImpl: (json['viewRootImpl'] as num?)?.toInt() ?? 0,
  appContexts: (json['appContexts'] as num?)?.toInt() ?? 0,
  activities: (json['activities'] as num?)?.toInt() ?? 0,
  assets: (json['assets'] as num?)?.toInt() ?? 0,
  assetManagers: (json['assetManagers'] as num?)?.toInt() ?? 0,
  localBinders: (json['localBinders'] as num?)?.toInt() ?? 0,
  proxyBinders: (json['proxyBinders'] as num?)?.toInt() ?? 0,
  parcelMemory: (json['parcelMemory'] as num?)?.toInt() ?? 0,
  parcelCount: (json['parcelCount'] as num?)?.toInt() ?? 0,
  deathRecipients: (json['deathRecipients'] as num?)?.toInt() ?? 0,
  webViews: (json['webViews'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ObjectsInfoToJson(_ObjectsInfo instance) =>
    <String, dynamic>{
      'views': instance.views,
      'viewRootImpl': instance.viewRootImpl,
      'appContexts': instance.appContexts,
      'activities': instance.activities,
      'assets': instance.assets,
      'assetManagers': instance.assetManagers,
      'localBinders': instance.localBinders,
      'proxyBinders': instance.proxyBinders,
      'parcelMemory': instance.parcelMemory,
      'parcelCount': instance.parcelCount,
      'deathRecipients': instance.deathRecipients,
      'webViews': instance.webViews,
    };

_NativeAllocations _$NativeAllocationsFromJson(Map<String, dynamic> json) =>
    _NativeAllocations(
      bitmapCount: (json['bitmapCount'] as num?)?.toInt() ?? 0,
      bitmapTotalKb: (json['bitmapTotalKb'] as num?)?.toInt() ?? 0,
      otherMallocedCount: (json['otherMallocedCount'] as num?)?.toInt() ?? 0,
      otherMallocedKb: (json['otherMallocedKb'] as num?)?.toInt() ?? 0,
      otherNonMallocedCount:
          (json['otherNonMallocedCount'] as num?)?.toInt() ?? 0,
      otherNonMallocedKb: (json['otherNonMallocedKb'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$NativeAllocationsToJson(_NativeAllocations instance) =>
    <String, dynamic>{
      'bitmapCount': instance.bitmapCount,
      'bitmapTotalKb': instance.bitmapTotalKb,
      'otherMallocedCount': instance.otherMallocedCount,
      'otherMallocedKb': instance.otherMallocedKb,
      'otherNonMallocedCount': instance.otherNonMallocedCount,
      'otherNonMallocedKb': instance.otherNonMallocedKb,
    };
