import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:running_services_monitor/models/useful_command.dart';
import 'package:uuid/uuid.dart';

part 'useful_commands_event.dart';
part 'useful_commands_state.dart';
part 'useful_commands_bloc.freezed.dart';
part 'useful_commands_bloc.g.dart';

@lazySingleton
class UsefulCommandsBloc extends HydratedBloc<UsefulCommandsEvent, UsefulCommandsState> {
  static List<UsefulCommand> get defaultCommands => [
    UsefulCommand(id: 'memory_info', title: 'Memory Info', description: 'Detailed memory usage', command: 'dumpsys meminfo %p'),
    UsefulCommand(
      id: 'running_services',
      title: 'Running Services',
      description: 'Active services for the app',
      command: 'dumpsys activity services %p',
    ),
    UsefulCommand(
      id: 'process_info',
      title: 'Process Info',
      description: 'Process details and activity',
      command: 'dumpsys activity processes %p',
    ),
    UsefulCommand(id: 'package_info', title: 'Package Info', description: 'Package manifest and permissions', command: 'pm dump %p'),
    UsefulCommand(id: 'battery_stats', title: 'Battery Stats', description: 'Battery usage statistics', command: 'dumpsys batterystats %p'),
    UsefulCommand(id: 'cpu_info', title: 'CPU Info', description: 'CPU usage for the app', command: 'dumpsys cpuinfo | grep %p'),
    UsefulCommand(
      id: 'network_stats',
      title: 'Network Stats',
      description: 'Network usage details',
      command: 'dumpsys netstats detail | grep %p',
    ),
    UsefulCommand(id: 'procstats', title: 'Procstats', description: 'Process statistics over time', command: 'dumpsys procstats %p'),
    UsefulCommand(id: 'app_ops', title: 'App Ops', description: 'App operations and permissions usage', command: 'appops get %p'),
    UsefulCommand(
      id: 'activity_stack',
      title: 'Activity Stack',
      description: 'Activity stack and history',
      command: 'dumpsys activity activities | grep %p',
    ),
  ];

  UsefulCommandsBloc() : super(const UsefulCommandsState()) {
    on<_Started>(_onStarted);
    on<_AddCommand>(_onAddCommand);
    on<_RemoveCommand>(_onRemoveCommand);

    if (state.commands.isEmpty) {
      add(const UsefulCommandsEvent.started());
    }
  }

  void _onStarted(_Started event, Emitter<UsefulCommandsState> emit) {
    if (state.commands.isEmpty) {
      emit(UsefulCommandsState(commands: defaultCommands));
    }
  }

  void _onAddCommand(_AddCommand event, Emitter<UsefulCommandsState> emit) {
    final newCommand = UsefulCommand(
      id: const Uuid().v4(),
      title: event.title,
      description: event.description,
      command: event.command,
      isCustom: true,
    );
    emit(state.copyWith(commands: [...state.commands, newCommand]));
  }

  void _onRemoveCommand(_RemoveCommand event, Emitter<UsefulCommandsState> emit) {
    emit(state.copyWith(commands: state.commands.where((c) => c.id != event.id).toList()));
  }

  @override
  UsefulCommandsState? fromJson(Map<String, dynamic> json) {
    try {
      final state = UsefulCommandsState.fromJson(json);
      if (state.commands.isEmpty) {
        return UsefulCommandsState(commands: defaultCommands);
      }
      return state;
    } catch (_) {
      return UsefulCommandsState(commands: defaultCommands);
    }
  }

  @override
  Map<String, dynamic>? toJson(UsefulCommandsState state) {
    return state.toJson();
  }
}
