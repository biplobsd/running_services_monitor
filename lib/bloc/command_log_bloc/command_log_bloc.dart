import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:running_services_monitor/models/command_log_entry.dart';
import 'package:running_services_monitor/services/command_log_service.dart';
import 'package:running_services_monitor/services/shizuku_service.dart';

part 'command_log_event.dart';
part 'command_log_state.dart';
part 'command_log_bloc.freezed.dart';

@LazySingleton()
class CommandLogBloc extends Bloc<CommandLogEvent, CommandLogState> {
  final CommandLogService _commandLogService;
  final ShizukuService _shizukuService;
  StreamSubscription<List<CommandLogEntry>>? _entriesSubscription;

  CommandLogBloc(this._commandLogService, this._shizukuService) : super(_Initial()) {
    on<_Started>(_onStarted);
    on<_Refresh>(_onRefresh);
    on<_ClearLogs>(_onClearLogs);
    on<_ExecuteCommand>(_onExecuteCommand);
    on<_SelectEntry>(_onSelectEntry);
    on<_EntriesUpdated>(_onEntriesUpdated);

    _entriesSubscription = _commandLogService.entriesStream.listen((entries) {
      add(CommandLogEvent.entriesUpdated(entries));
    });
  }

  void _onStarted(_Started event, Emitter<CommandLogState> emit) {
    emit(_Loading(value: state.value));
    final entries = _commandLogService.getEntries();
    emit(_Success(value: [...entries]));
  }

  void _onRefresh(_Refresh event, Emitter<CommandLogState> emit) {
    emit(_Loading(value: state.value));
    final entries = _commandLogService.getEntries();
    emit(_Success(value: [...entries]));
  }

  void _onClearLogs(_ClearLogs event, Emitter<CommandLogState> emit) async {
    emit(_Loading(value: state.value));
    _commandLogService.clearEntries();
    emit(_Success(value: []));
  }

  Future<void> _onExecuteCommand(_ExecuteCommand event, Emitter<CommandLogState> emit) async {
    emit(_Loading(value: state.value));
    try {
      await _shizukuService.executeCommandStream(event.command).drain<void>();
      final entries = _commandLogService.getEntries();
      final latestEntryId = entries.isNotEmpty ? entries.first.id : null;
      emit(_Success(value: entries, selectedEntryId: latestEntryId));
    } catch (e) {
      emit(_Error(value: state.value, message: e.toString()));
    }
  }

  void _onSelectEntry(_SelectEntry event, Emitter<CommandLogState> emit) {
    emit(_Loading(value: state.value));
    emit(_Success(value: [...state.value], selectedEntryId: event.entryId));
  }

  void _onEntriesUpdated(_EntriesUpdated event, Emitter<CommandLogState> emit) {
    emit(_Loading(value: state.value));
    emit(_Success(value: [...event.entries], selectedEntryId: state.selectedEntryId));
  }

  @override
  Future<void> close() {
    _entriesSubscription?.cancel();
    return super.close();
  }
}
