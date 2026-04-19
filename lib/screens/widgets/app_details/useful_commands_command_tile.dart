import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/command_log_bloc/command_log_bloc.dart';
import 'package:running_services_monitor/bloc/useful_commands_bloc/useful_commands_bloc.dart';
import 'package:running_services_monitor/bloc/useful_commands_ui_bloc/useful_commands_ui_bloc.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/models/useful_command.dart';
import 'package:running_services_monitor/utils/format_utils.dart';

class UsefulCommandsCommandTile extends StatelessWidget {
  final UsefulCommand command;
  final String packageName;
  final AppProcessInfo? appInfo;

  const UsefulCommandsCommandTile({
    super.key,
    required this.command,
    required this.packageName,
    this.appInfo,
  });

  String _replaceplaceholders(String command) {
    String result = command.replaceAll('%p', packageName);
    if (appInfo != null) {
      result = result
          .replaceAll('%pid', appInfo!.pids.isNotEmpty ? appInfo!.pids.first.toString() : '')
          .replaceAll('%pids', appInfo!.pids.join(','))
          .replaceAll('%ram', appInfo!.totalRamInKb.formatRam())
          .replaceAll('%ramKb', appInfo!.totalRamInKb.toStringAsFixed(0))
          .replaceAll('%state', appInfo!.processState ?? '')
          .replaceAll('%cached', appInfo!.cachedMemoryKb.toStringAsFixed(0))
          .replaceAll('%svcCount', appInfo!.services.length.toString())
          .replaceAll('%procCount', appInfo!.processCount.toString());
    }
    return result;
  }

  void _executeCommand(BuildContext context) {
    context.read<UsefulCommandsUiBloc>().add(UsefulCommandsUiEvent.setLoadingCommand(command.id));
    final actualCommand = _replaceplaceholders(command.command);
    getIt<CommandLogBloc>().add(CommandLogEvent.executeCommand(actualCommand));
  }

  void _deleteCommand() {
    if (command.isCustom) {
      getIt<UsefulCommandsBloc>().add(UsefulCommandsEvent.removeCommand(command.id));
    } else {
      getIt<UsefulCommandsBloc>().add(UsefulCommandsEvent.hideDefaultCommand(command.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocSelector<UsefulCommandsUiBloc, UsefulCommandsUiState, String?>(
      selector: (state) => state.loadingCommandId,
      builder: (context, loadingCommandId) {
        final isLoading = loadingCommandId == command.id;

        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            title: Text(command.title, style: AppStyles.bodyStyle.copyWith(fontSize: 14)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  command.description,
                  style: AppStyles.captionStyle.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                AppStyles.spacingH4,
                Text(
                  command.command,
                  style: AppStyles.smallStyle.copyWith(
                    fontFamily: 'monospace',
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    command.isCustom ? Icons.delete_outline : Icons.visibility_off_outlined,
                    size: 20,
                    color: colorScheme.error,
                  ),
                  onPressed: _deleteCommand,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                ),
                IconButton(
                  icon: isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Icon(Icons.play_arrow, size: 24, color: colorScheme.primary),
                  onPressed: loadingCommandId != null ? null : () => _executeCommand(context),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
