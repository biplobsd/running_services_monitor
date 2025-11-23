import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:running_services_monitor/services/process_service.dart';

part 'stop_service_event.dart';
part 'stop_service_state.dart';
part 'stop_service_bloc.freezed.dart';

@injectable
class StopServiceBloc extends Bloc<StopServiceEvent, StopServiceState> {
  final ProcessService _processService;

  StopServiceBloc(this._processService) : super(const StopServiceState.initial()) {
    on<_StopAllServices>(_onStopAllServices);
    on<_Reset>(_onReset);
  }

  Future<void> _onStopAllServices(_StopAllServices event, Emitter<StopServiceState> emit) async {
    emit(StopServiceState.stopping(packageName: event.packageName));

    try {
      // Use force-stop for stopping all services of an app
      final success = await _processService.stopService(event.packageName);

      if (success) {
        emit(StopServiceState.success(packageName: event.packageName));
      } else {
        emit(const StopServiceState.error(message: 'Failed to stop all services'));
      }
    } catch (e) {
      emit(StopServiceState.error(message: 'Error: $e'));
    }
  }

  Future<void> _onReset(_Reset event, Emitter<StopServiceState> emit) async {
    emit(const StopServiceState.initial());
  }
}
