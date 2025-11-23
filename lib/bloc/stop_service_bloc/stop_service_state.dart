part of 'stop_service_bloc.dart';

@freezed
class StopServiceState with _$StopServiceState {
  const factory StopServiceState.initial() = _Initial;

  const factory StopServiceState.stopping({required String packageName}) = _Stopping;

  const factory StopServiceState.success({required String packageName}) = _Success;

  const factory StopServiceState.error({required String message}) = _Error;
}
