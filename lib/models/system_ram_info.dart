import 'package:freezed_annotation/freezed_annotation.dart';

part 'system_ram_info.freezed.dart';
part 'system_ram_info.g.dart';

@freezed
abstract class SystemRamInfo with _$SystemRamInfo {
  const factory SystemRamInfo({
    @Default(0.0) double totalRamKb,
    @Default('') String totalRamStatus,

    @Default(0.0) double freeRamKb,
    @Default(0.0) double cachedPssKb,
    @Default(0.0) double cachedKernelKb,
    @Default(0.0) double actualFreeKb,

    @Default(0.0) double usedRamKb,
    @Default(0.0) double usedPssKb,
    @Default(0.0) double kernelKb,

    @Default(0.0) double gpuKb,
    @Default(0.0) double lostRamKb,

    @Default(0.0) double zramPhysicalKb,
    @Default(0.0) double zramSwapKb,
    @Default(0.0) double zramTotalSwapKb,

    @Default(0.0) double oomKb,
    @Default(0.0) double restoreLimitKb,
  }) = _SystemRamInfo;

  factory SystemRamInfo.fromJson(Map<String, dynamic> json) => _$SystemRamInfoFromJson(json);
}
