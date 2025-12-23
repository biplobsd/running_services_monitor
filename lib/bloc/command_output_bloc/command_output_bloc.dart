import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:running_services_monitor/bloc/command_log_bloc/command_log_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';

part 'command_output_event.dart';
part 'command_output_state.dart';
part 'command_output_bloc.freezed.dart';

class CommandOutputBloc extends Bloc<CommandOutputEvent, CommandOutputState> {
  Timer? _autoRefreshTimer;
  StreamSubscription? _commandLogSubscription;

  CommandOutputBloc({required String entryId, required String command})
    : super(CommandOutputState(currentEntryId: entryId, command: command)) {
    on<_Started>(_onStarted);
    on<_Refresh>(_onRefresh);
    on<_SetAutoRefreshInterval>(_onSetAutoRefreshInterval);
    on<_UpdateEntry>(_onUpdateEntry);
    on<_StopRefreshing>(_onStopRefreshing);

    _commandLogSubscription = getIt<CommandLogBloc>().stream.listen((logState) {
      logState.mapOrNull(
        success: (successState) {
          if (state.isRefreshing && successState.selectedEntryId != null) {
            add(CommandOutputEvent.updateEntry(successState.selectedEntryId!));
          }
        },
        error: (_) {
          if (state.isRefreshing) {
            add(const CommandOutputEvent.stopRefreshing());
          }
        },
      );
    });
  }

  void _onStarted(_Started event, Emitter<CommandOutputState> emit) {
    emit(CommandOutputState(currentEntryId: event.entryId, command: event.command));
  }

  void _onRefresh(_Refresh event, Emitter<CommandOutputState> emit) {
    emit(state.copyWith(isRefreshing: true));
    getIt<CommandLogBloc>().add(CommandLogEvent.executeCommand(state.command));
  }

  void _onSetAutoRefreshInterval(_SetAutoRefreshInterval event, Emitter<CommandOutputState> emit) {
    _autoRefreshTimer?.cancel();
    _autoRefreshTimer = null;

    emit(state.copyWith(autoRefreshInterval: event.interval));

    if (event.interval != null) {
      _autoRefreshTimer = Timer.periodic(event.interval!, (_) {
        add(const CommandOutputEvent.refresh());
      });
    }
  }

  void _onUpdateEntry(_UpdateEntry event, Emitter<CommandOutputState> emit) {
    emit(state.copyWith(currentEntryId: event.entryId, isRefreshing: false));
  }

  void _onStopRefreshing(_StopRefreshing event, Emitter<CommandOutputState> emit) {
    emit(state.copyWith(isRefreshing: false));
  }

  @override
  Future<void> close() {
    _autoRefreshTimer?.cancel();
    _commandLogSubscription?.cancel();
    return super.close();
  }
}
