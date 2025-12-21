part of 'meminfo_bloc.dart';

@freezed
abstract class MemInfoEvent with _$MemInfoEvent {
  const factory MemInfoEvent.fetchMemInfo({required String packageName}) = _FetchMemInfo;
  const factory MemInfoEvent.fetchForComparison({required String packageName}) = _FetchForComparison;
  const factory MemInfoEvent.clear() = _Clear;
}
