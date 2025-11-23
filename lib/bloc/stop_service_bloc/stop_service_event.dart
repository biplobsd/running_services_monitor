part of 'stop_service_bloc.dart';

@freezed
class StopServiceEvent with _$StopServiceEvent {
  const factory StopServiceEvent.stopAllServices({required String packageName, required List<int> pids}) =
      _StopAllServices;

  const factory StopServiceEvent.reset() = _Reset;
}
