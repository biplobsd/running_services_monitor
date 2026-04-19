import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/command_log_bloc/command_log_bloc.dart';
import 'package:running_services_monitor/bloc/command_log_commands_ui_bloc/command_log_commands_ui_bloc.dart';
import 'package:running_services_monitor/bloc/useful_commands_bloc/useful_commands_bloc.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/models/useful_command.dart';

class CommandLogCommandTile extends StatelessWidget {
  final UsefulCommand command;

  const CommandLogCommandTile({super.key, required this.command});

  void _deleteCommand() {
    if (command.isCustom) {
      getIt<UsefulCommandsBloc>().add(UsefulCommandsEvent.removeCommand(command.id));
    } else {
      getIt<UsefulCommandsBloc>().add(UsefulCommandsEvent.hideDefaultCommand(command.id));
    }
  }

  void _executeCommand(BuildContext context) {
    context.read<CommandLogCommandsUiBloc>().add(CommandLogCommandsUiEvent.setLoadingCommand(command.id));
    getIt<CommandLogBloc>().add(CommandLogEvent.executeCommand(command.command));
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocSelector<CommandLogCommandsUiBloc, CommandLogCommandsUiState, String?>(
      selector: (state) => state.loadingCommandId,
      builder: (context, loadingCommandId) {
        final isLoading = loadingCommandId == command.id;
        final isAnyLoading = loadingCommandId != null;

        return Container(
          margin: EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            title: Text(command.title, style: AppStyles.bodyStyle.copyWith(fontSize: 14)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(command.description, style: AppStyles.captionStyle.copyWith(color: colorScheme.onSurfaceVariant)),
                AppStyles.spacingH4,
                Text(
                  command.command,
                  style: AppStyles.smallStyle.copyWith(fontFamily: 'monospace', color: colorScheme.primary),
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (command.isCustom)
                  IconButton(
                    icon: Icon(Icons.edit_outlined, size: 20, color: colorScheme.onSurfaceVariant),
                    onPressed: () => context.read<CommandLogCommandsUiBloc>().add(CommandLogCommandsUiEvent.setEditingCommand(command.id)),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(minWidth: 32, minHeight: 32),
                  ),
                IconButton(
                  icon: Icon(
                    command.isCustom ? Icons.delete_outline : Icons.visibility_off_outlined,
                    size: 20,
                    color: colorScheme.error,
                  ),
                  onPressed: _deleteCommand,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(minWidth: 32, minHeight: 32),
                ),
                IconButton(
                  icon: isLoading
                      ? SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                      : Icon(Icons.play_arrow, size: 24, color: colorScheme.primary),
                  onPressed: isAnyLoading ? null : () => _executeCommand(context),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(minWidth: 40, minHeight: 40),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
