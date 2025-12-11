import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:running_services_monitor/l10n/l10n_keys.dart';
import 'package:running_services_monitor/services/process_service.dart';

part 'stop_service_event.dart';
part 'stop_service_state.dart';
part 'stop_service_bloc.freezed.dart';

@injectable
class StopServiceBloc extends Bloc<StopServiceEvent, StopServiceState> {
  final ProcessService _processService;

  StopServiceBloc(this._processService) : super(const StopServiceState.initial()) {
    on<_StopAllServices>(_onStopAllServices);
    on<_StopSingleService>(_onStopSingleService);
    on<_Reset>(_onReset);
  }

  Future<void> _onStopAllServices(_StopAllServices event, Emitter<StopServiceState> emit) async {
    emit(StopServiceState.stopping(packageName: event.packageName));

    try {
      final success = await _processService.stopService(event.packageName);

      if (success) {
        emit(StopServiceState.success(packageName: event.packageName));
      } else {
        emit(const StopServiceState.error(message: L10nKeys.failedToStopAllServices));
      }
    } catch (e) {
      emit(StopServiceState.error(message: L10nKeys.error));
    }
  }

  Future<void> _onStopSingleService(_StopSingleService event, Emitter<StopServiceState> emit) async {
    emit(StopServiceState.stopping(packageName: event.packageName, serviceName: event.serviceName));

    try {
      final success = await _processService.stopServiceByComponent(
        packageName: event.packageName,
        serviceName: event.serviceName,
      );

      if (success) {
        emit(
          StopServiceState.success(
            packageName: event.packageName,
            serviceName: event.serviceName,
            servicePid: event.pid,
          ),
        );
      } else {
        if (event.pid != null) {
          final killSuccess = await _processService.stopServiceByPid(event.pid!);
          if (killSuccess) {
            emit(
              StopServiceState.success(
                packageName: event.packageName,
                serviceName: event.serviceName,
                servicePid: event.pid,
              ),
            );
            return;
          }
        }
        emit(StopServiceState.error(message: L10nKeys.stopServiceError));
      }
    } catch (e) {
      emit(StopServiceState.error(message: L10nKeys.error));
    }
  }

  Future<void> _onReset(_Reset event, Emitter<StopServiceState> emit) async {
    emit(const StopServiceState.initial());
  }
}
