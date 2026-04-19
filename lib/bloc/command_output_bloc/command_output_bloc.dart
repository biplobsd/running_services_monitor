import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
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
    on<_ToggleSearch>(_onToggleSearch);
    on<_UpdateSearchQuery>(_onUpdateSearchQuery);
    on<_NextMatch>(_onNextMatch);
    on<_PreviousMatch>(_onPreviousMatch);

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
    final updatedState = state.copyWith(currentEntryId: event.entryId, isRefreshing: false);
    if (!updatedState.isSearchVisible || updatedState.searchQuery.isEmpty) {
      emit(updatedState);
      return;
    }
    final entry = getIt<CommandLogBloc>().state.value.where((e) => e.id == event.entryId).firstOrNull;
    final matches = _findMatches(entry?.output ?? '', updatedState.searchQuery);
    emit(updatedState.copyWith(searchMatches: matches, currentMatchIndex: matches.isEmpty ? -1 : 0));
  }

  void _onStopRefreshing(_StopRefreshing event, Emitter<CommandOutputState> emit) {
    emit(state.copyWith(isRefreshing: false));
  }

  void _onToggleSearch(_ToggleSearch event, Emitter<CommandOutputState> emit) {
    if (state.isSearchVisible) {
      emit(state.copyWith(isSearchVisible: false, searchQuery: '', searchMatches: <int>[], currentMatchIndex: -1));
      return;
    }
    emit(state.copyWith(isSearchVisible: true));
  }

  void _onUpdateSearchQuery(_UpdateSearchQuery event, Emitter<CommandOutputState> emit) {
    final query = event.query;
    if (query.isEmpty) {
      emit(state.copyWith(searchQuery: query, searchMatches: <int>[], currentMatchIndex: -1));
      return;
    }
    final matches = _findMatches(event.text, query);
    emit(state.copyWith(searchQuery: query, searchMatches: matches, currentMatchIndex: matches.isEmpty ? -1 : 0));
  }

  void _onNextMatch(_NextMatch event, Emitter<CommandOutputState> emit) {
    final matches = state.searchMatches;
    if (matches.isEmpty) {
      return;
    }
    final nextIndex = (state.currentMatchIndex + 1) % matches.length;
    emit(state.copyWith(currentMatchIndex: nextIndex));
  }

  void _onPreviousMatch(_PreviousMatch event, Emitter<CommandOutputState> emit) {
    final matches = state.searchMatches;
    if (matches.isEmpty) {
      return;
    }
    final previousIndex = (state.currentMatchIndex - 1 + matches.length) % matches.length;
    emit(state.copyWith(currentMatchIndex: previousIndex));
  }

  List<int> _findMatches(String text, String query) {
    if (query.isEmpty || text.isEmpty) {
      return <int>[];
    }
    final normalizedText = text.toLowerCase();
    final normalizedQuery = query.toLowerCase();
    final matches = <int>[];
    var start = 0;
    while (start < normalizedText.length) {
      final index = normalizedText.indexOf(normalizedQuery, start);
      if (index == -1) {
        break;
      }
      matches.add(index);
      start = index + normalizedQuery.length;
    }
    return matches;
  }

  @override
  Future<void> close() {
    _autoRefreshTimer?.cancel();
    _commandLogSubscription?.cancel();
    return super.close();
  }
}
