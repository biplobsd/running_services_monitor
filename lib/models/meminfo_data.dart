import 'package:freezed_annotation/freezed_annotation.dart';

part 'meminfo_data.freezed.dart';
part 'meminfo_data.g.dart';

@freezed
abstract class MemInfoData with _$MemInfoData {
  const factory MemInfoData({
    required String packageName,
    required String rawOutput,
    required int pid,
    @Default([]) List<MemInfoCategory> categories,
    MemInfoTotal? total,
    AppSummary? appSummary,
    ObjectsInfo? objects,
    NativeAllocations? nativeAllocations,
  }) = _MemInfoData;

  factory MemInfoData.fromJson(Map<String, dynamic> json) => _$MemInfoDataFromJson(json);
}

@freezed
abstract class MemInfoCategory with _$MemInfoCategory {
  const factory MemInfoCategory({
    required String name,
    required int pssTotal,
    @Default(0) int privateDirty,
    @Default(0) int privateClean,
    @Default(0) int swapPssDirty,
    @Default(0) int rssTotal,
    int? heapSize,
    int? heapAlloc,
    int? heapFree,
  }) = _MemInfoCategory;

  factory MemInfoCategory.fromJson(Map<String, dynamic> json) => _$MemInfoCategoryFromJson(json);
}

@freezed
abstract class MemInfoTotal with _$MemInfoTotal {
  const factory MemInfoTotal({
    required int pssTotal,
    required int privateDirty,
    required int privateClean,
    required int swapPssDirty,
    required int rssTotal,
    required int heapSize,
    required int heapAlloc,
    required int heapFree,
  }) = _MemInfoTotal;

  factory MemInfoTotal.fromJson(Map<String, dynamic> json) => _$MemInfoTotalFromJson(json);
}

@freezed
abstract class AppSummary with _$AppSummary {
  const factory AppSummary({
    @Default(0) int javaHeapPss,
    @Default(0) int javaHeapRss,
    @Default(0) int nativeHeapPss,
    @Default(0) int nativeHeapRss,
    @Default(0) int codePss,
    @Default(0) int codeRss,
    @Default(0) int stackPss,
    @Default(0) int stackRss,
    @Default(0) int graphicsPss,
    @Default(0) int graphicsRss,
    @Default(0) int privateOther,
    @Default(0) int system,
    @Default(0) int unknownRss,
    @Default(0) int totalPss,
    @Default(0) int totalRss,
    @Default(0) int totalSwapPss,
  }) = _AppSummary;

  factory AppSummary.fromJson(Map<String, dynamic> json) => _$AppSummaryFromJson(json);
}

@freezed
abstract class ObjectsInfo with _$ObjectsInfo {
  const factory ObjectsInfo({
    @Default(0) int views,
    @Default(0) int viewRootImpl,
    @Default(0) int appContexts,
    @Default(0) int activities,
    @Default(0) int assets,
    @Default(0) int assetManagers,
    @Default(0) int localBinders,
    @Default(0) int proxyBinders,
    @Default(0) int parcelMemory,
    @Default(0) int parcelCount,
    @Default(0) int deathRecipients,
    @Default(0) int webViews,
  }) = _ObjectsInfo;

  factory ObjectsInfo.fromJson(Map<String, dynamic> json) => _$ObjectsInfoFromJson(json);
}

@freezed
abstract class NativeAllocations with _$NativeAllocations {
  const factory NativeAllocations({
    @Default(0) int bitmapCount,
    @Default(0) int bitmapTotalKb,
    @Default(0) int otherMallocedCount,
    @Default(0) int otherMallocedKb,
    @Default(0) int otherNonMallocedCount,
    @Default(0) int otherNonMallocedKb,
  }) = _NativeAllocations;

  factory NativeAllocations.fromJson(Map<String, dynamic> json) => _$NativeAllocationsFromJson(json);
}
