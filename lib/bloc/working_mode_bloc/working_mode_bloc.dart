import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:running_services_monitor/core/utils/log_helper.dart';
import 'package:running_services_monitor/l10n/gen/l10n_keys.dart';
import 'package:running_services_monitor/models/working_mode.dart';
import 'package:running_services_monitor/models/working_mode_state_model.dart';
import 'package:running_services_monitor/services/shizuku_service.dart';

part 'working_mode_event.dart';
part 'working_mode_state.dart';
part 'working_mode_bloc.freezed.dart';

@lazySingleton
class WorkingModeBloc extends HydratedBloc<WorkingModeEvent, WorkingModeState> {
  final ShizukuService _shizukuService;

  WorkingModeBloc(this._shizukuService) : super(const WorkingModeState.initial(WorkingModeStateModel())) {
    on<_DetectModes>(_onDetectModes);
    on<_SetMode>(_onSetMode);
    on<_RefreshStatus>(_onRefreshStatus);
  }

  Future<void> _onDetectModes(_DetectModes event, Emitter<WorkingModeState> emit) async {
    emit(WorkingModeState.detecting(state.value.copyWith(isDetecting: true)));

    try {
      final isRootAvailable = await _shizukuService.checkRootPermission();
      final isShizukuAvailable = await _shizukuService.isShizukuRunning();

      WorkingMode? selectedMode = state.value.currentMode;

      if (selectedMode != null) {
        final isModeStillAvailable = switch (selectedMode) {
          WorkingMode.root => isRootAvailable,
          WorkingMode.shizuku => isShizukuAvailable,
        };
        if (!isModeStillAvailable) {
          selectedMode = null;
        }
      }

      if (selectedMode == null) {
        if (isRootAvailable) {
          selectedMode = WorkingMode.root;
        } else if (isShizukuAvailable) {
          selectedMode = WorkingMode.shizuku;
        }
      }

      if (selectedMode != null) {
        _shizukuService.setWorkingMode(selectedMode);
      }

      emit(
        WorkingModeState.ready(
          state.value.copyWith(
            currentMode: selectedMode,
            isRootAvailable: isRootAvailable,
            isShizukuAvailable: isShizukuAvailable,
            isDetecting: false,
          ),
        ),
      );
    } catch (e, s) {
      logError(e, s);
      emit(WorkingModeState.error(state.value.copyWith(isDetecting: false), L10nKeys.errorLoadingData));
    }
  }

  Future<void> _onSetMode(_SetMode event, Emitter<WorkingModeState> emit) async {
    emit(WorkingModeState.detecting(state.value.copyWith(isDetecting: true)));

    try {
      bool canUseMode = false;

      switch (event.mode) {
        case WorkingMode.root:
          final hasRoot = await _shizukuService.checkRootPermission();
          if (hasRoot) {
            final granted = await _shizukuService.requestRootPermission();
            canUseMode = granted;
            if (granted) {
              emit(WorkingModeState.detecting(state.value.copyWith(isRootAvailable: true, isDetecting: true)));
            }
          }
          break;
        case WorkingMode.shizuku:
          final isRunning = await _shizukuService.isShizukuRunning();
          if (isRunning) {
            final hasPermission = await _shizukuService.checkPermission();
            if (!hasPermission) {
              final granted = await _shizukuService.requestPermission();
              canUseMode = granted;
            } else {
              canUseMode = true;
            }
            if (canUseMode) {
              emit(WorkingModeState.detecting(state.value.copyWith(isShizukuAvailable: true, isDetecting: true)));
            }
          }
          break;
      }

      if (!canUseMode) {
        emit(WorkingModeState.error(state.value.copyWith(isDetecting: false), L10nKeys.modeNotAvailable));
        return;
      }

      _shizukuService.setWorkingMode(event.mode);
      emit(WorkingModeState.ready(state.value.copyWith(currentMode: event.mode, isDetecting: false)));
    } catch (e, s) {
      logError(e, s);
      emit(WorkingModeState.error(state.value.copyWith(isDetecting: false), L10nKeys.modeNotAvailable));
    }
  }

  Future<void> _onRefreshStatus(_RefreshStatus event, Emitter<WorkingModeState> emit) async {
    add(const WorkingModeEvent.detectModes());
  }

  @override
  WorkingModeState? fromJson(Map<String, dynamic> json) {
    try {
      final model = WorkingModeStateModel.fromJson(json);
      return WorkingModeState.ready(model);
    } catch (e, s) {
      logError(e, s);
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(WorkingModeState state) {
    return state.value.toJson();
  }
}
