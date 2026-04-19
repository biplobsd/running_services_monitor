import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:running_services_monitor/bloc/command_log_bloc/command_log_bloc.dart';
import 'package:running_services_monitor/bloc/command_log_commands_ui_bloc/command_log_commands_ui_bloc.dart';
import 'package:running_services_monitor/bloc/useful_commands_bloc/useful_commands_bloc.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/useful_command.dart';
import 'package:running_services_monitor/screens/widgets/command_log/command_log_add_command_form.dart';
import 'package:running_services_monitor/screens/widgets/command_log/command_log_command_tile.dart';
import 'package:running_services_monitor/screens/widgets/command_log/command_log_commands_header.dart';
import 'package:running_services_monitor/screens/widgets/command_log/command_log_edit_command_form.dart';
import 'package:running_services_monitor/screens/widgets/command_log/command_log_section_header.dart';

class CommandLogCommandsBottomSheet extends StatefulWidget {
  const CommandLogCommandsBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => const CommandLogCommandsBottomSheet(),
    );
  }

  @override
  State<CommandLogCommandsBottomSheet> createState() => _CommandLogCommandsBottomSheetState();
}

class _CommandLogCommandsBottomSheetState extends State<CommandLogCommandsBottomSheet> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final commandController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    commandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CommandLogCommandsUiBloc(),
      child: BlocListener<CommandLogBloc, CommandLogState>(
        bloc: getIt<CommandLogBloc>(),
        listener: (context, state) {
          state.mapOrNull(
            success: (value) {
              final uiBloc = context.read<CommandLogCommandsUiBloc>();
              if (uiBloc.state.loadingCommandId != null) {
                uiBloc.add(const CommandLogCommandsUiEvent.setLoadingCommand(null));
                if (value.selectedEntryId != null) {
                  context.push('/command-output', extra: value.selectedEntryId);
                }
              }
            },
            error: (_) {
              final uiBloc = context.read<CommandLogCommandsUiBloc>();
              if (uiBloc.state.loadingCommandId != null) {
                uiBloc.add(const CommandLogCommandsUiEvent.setLoadingCommand(null));
              }
            },
          );
        },
        child: BlocSelector<UsefulCommandsBloc, UsefulCommandsState, (List<UsefulCommand>, List<UsefulCommand>)>(
          bloc: getIt<UsefulCommandsBloc>(),
          selector: (state) => (
            state.userCommands,
            UsefulCommandsBloc.defaultCommands.where((c) => !state.hiddenDefaultCommandIds.contains(c.id)).toList(),
          ),
          builder: (context, commandsData) {
            final (userCommands, defaultCommands) = commandsData;

            return DraggableScrollableSheet(
              initialChildSize: 0.7,
              minChildSize: 0.3,
              maxChildSize: 0.9,
              expand: false,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Column(
                    children: [
                      const CommandLogCommandsHeader(),
                      Expanded(
                        child: BlocSelector<CommandLogCommandsUiBloc, CommandLogCommandsUiState, (bool, String?)>(
                          selector: (state) => (state.showAddForm, state.editingCommandId),
                          builder: (context, uiData) {
                            final (showAddForm, editingCommandId) = uiData;
                            final editingCommand = editingCommandId != null
                                ? userCommands.where((c) => c.id == editingCommandId).firstOrNull
                                : null;

                            return ListView(
                              controller: scrollController,
                              padding: EdgeInsets.all(16),
                              children: [
                                if (editingCommand != null) ...[
                                  CommandLogEditCommandForm(command: editingCommand),
                                  AppStyles.spacingH16,
                                ] else if (showAddForm) ...[
                                  CommandLogAddCommandForm(
                                    titleController: titleController,
                                    descriptionController: descriptionController,
                                    commandController: commandController,
                                  ),
                                  AppStyles.spacingH16,
                                ],
                                if (userCommands.isNotEmpty) ...[
                                  CommandLogSectionHeader(title: context.loc.myCommands),
                                  ...userCommands.map((cmd) => CommandLogCommandTile(command: cmd)),
                                  AppStyles.spacingH16,
                                ],
                                if (defaultCommands.isNotEmpty) ...[
                                  CommandLogSectionHeader(title: context.loc.defaultCommands),
                                  ...defaultCommands.map((cmd) => CommandLogCommandTile(command: cmd)),
                                ],
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
