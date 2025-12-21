part of 'meminfo_bloc.dart';

@freezed
abstract class MemInfoState with _$MemInfoState {
  const factory MemInfoState.initial() = _Initial;
  const factory MemInfoState.loading({MemInfoData? currentData, MemInfoData? comparisonData}) = _Loading;
  const factory MemInfoState.loaded({required MemInfoData data, MemInfoData? comparisonData}) = _Loaded;
  const factory MemInfoState.error({required String message, MemInfoData? currentData}) = _Error;
}
