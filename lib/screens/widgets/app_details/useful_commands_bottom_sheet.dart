import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:running_services_monitor/bloc/command_log_bloc/command_log_bloc.dart';
import 'package:running_services_monitor/bloc/useful_commands_bloc/useful_commands_bloc.dart';
import 'package:running_services_monitor/bloc/useful_commands_ui_bloc/useful_commands_ui_bloc.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/models/useful_command.dart';
import 'useful_commands_header.dart';
import 'useful_commands_add_command_form.dart';
import 'useful_commands_command_tile.dart';
import 'useful_commands_section_header.dart';

class UsefulCommandsBottomSheet extends StatefulWidget {
  final String packageName;
  final AppProcessInfo? appInfo;

  const UsefulCommandsBottomSheet({super.key, required this.packageName, this.appInfo});

  static void show(BuildContext context, String packageName, {AppProcessInfo? appInfo}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => UsefulCommandsBottomSheet(packageName: packageName, appInfo: appInfo),
    );
  }

  @override
  State<UsefulCommandsBottomSheet> createState() => _UsefulCommandsBottomSheetState();
}

class _UsefulCommandsBottomSheetState extends State<UsefulCommandsBottomSheet> {
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
    final colorScheme = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (_) => UsefulCommandsUiBloc(),
      child: BlocListener<CommandLogBloc, CommandLogState>(
        bloc: getIt<CommandLogBloc>(),
        listener: (context, state) {
          state.mapOrNull(
            success: (value) {
              final uiBloc = context.read<UsefulCommandsUiBloc>();
              if (uiBloc.state.loadingCommandId != null) {
                uiBloc.add(const UsefulCommandsUiEvent.setLoadingCommand(null));
                if (value.selectedEntryId != null) {
                  context.push('/command-output', extra: value.selectedEntryId);
                }
              }
            },
            error: (_) {
              final uiBloc = context.read<UsefulCommandsUiBloc>();
              if (uiBloc.state.loadingCommandId != null) {
                uiBloc.add(const UsefulCommandsUiEvent.setLoadingCommand(null));
              }
            },
          );
        },
        child: BlocSelector<UsefulCommandsBloc, UsefulCommandsState, (List<UsefulCommand>, List<UsefulCommand>)>(
          bloc: getIt<UsefulCommandsBloc>(),
          selector: (state) => (
            state.userCommands,
            UsefulCommandsBloc.defaultPackageCommands.where((c) => !state.hiddenDefaultCommandIds.contains(c.id)).toList(),
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
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: Column(
                    children: [
                      const UsefulCommandsHeader(),
                      Expanded(
                        child: BlocSelector<UsefulCommandsUiBloc, UsefulCommandsUiState, bool>(
                          selector: (state) => state.showAddForm,
                          builder: (context, showAddForm) {
                            return ListView(
                              controller: scrollController,
                              padding: const EdgeInsets.all(16),
                              children: [
                                if (showAddForm) ...[
                                  UsefulCommandsAddCommandForm(
                                    titleController: titleController,
                                    descriptionController: descriptionController,
                                    commandController: commandController,
                                    packageName: widget.packageName,
                                    appInfo: widget.appInfo,
                                  ),
                                  AppStyles.spacingH16,
                                ],
                                if (userCommands.isNotEmpty) ...[
                                  UsefulCommandsSectionHeader(title: context.loc.myCommands),
                                  ...userCommands.map(
                                    (cmd) => UsefulCommandsCommandTile(
                                      command: cmd,
                                      packageName: widget.packageName,
                                      appInfo: widget.appInfo,
                                    ),
                                  ),
                                  AppStyles.spacingH16,
                                ],
                                if (defaultCommands.isNotEmpty) ...[
                                  UsefulCommandsSectionHeader(title: context.loc.defaultCommands),
                                  ...defaultCommands.map(
                                    (cmd) => UsefulCommandsCommandTile(
                                      command: cmd,
                                      packageName: widget.packageName,
                                      appInfo: widget.appInfo,
                                    ),
                                  ),
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
