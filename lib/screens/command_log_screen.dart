import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:running_services_monitor/bloc/command_log_bloc/command_log_bloc.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/command_log_entry.dart';

class CommandLogScreen extends StatelessWidget {
  const CommandLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CommandLogBloc>()..add(const CommandLogEvent.started()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.loc.commandLogs, style: AppStyles.headlineStyle),
          actions: [
            BlocSelector<CommandLogBloc, CommandLogState, bool>(
              selector: (state) => state.value.isNotEmpty,
              builder: (context, hasEntries) {
                if (!hasEntries) return const SizedBox.shrink();
                return IconButton(
                  icon: AppStyles.deleteIcon,
                  tooltip: context.loc.clearLogs,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (dialogContext) => AlertDialog(
                        title: Text(context.loc.clearLogs),
                        content: Text(context.loc.clearLogsConfirm),
                        actions: [
                          TextButton(onPressed: () => Navigator.of(dialogContext).pop(), child: Text(context.loc.cancel)),
                          FilledButton(
                            onPressed: () {
                              context.read<CommandLogBloc>().add(const CommandLogEvent.clearLogs());
                              Navigator.of(dialogContext).pop();
                            },
                            child: Text(context.loc.yes),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: BlocSelector<CommandLogBloc, CommandLogState, List<CommandLogEntry>>(
          selector: (state) => state.value,
          builder: (context, entries) {
            if (entries.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.terminal, size: 64.w, color: Theme.of(context).colorScheme.outline),
                    AppStyles.spacingH16,
                    Text(
                      context.loc.noCommandLogs,
                      style: AppStyles.bodyStyle.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 16.sp),
                    ),
                  ],
                ),
              );
            }

            return ListView.separated(
              padding: AppStyles.sectionPadding,
              itemCount: entries.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final entry = entries[index];
                final dateFormat = DateFormat('HH:mm:ss');
                return ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  leading: Icon(entry.isSuccess ? Icons.check_circle_outline : Icons.error_outline, color: entry.isSuccess ? Colors.green : Colors.red),
                  title: Text(
                    entry.command,
                    style: AppStyles.bodyStyle.copyWith(fontSize: 13.sp, fontFamily: 'monospace'),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text('${context.loc.executedAt} ${dateFormat.format(entry.timestamp)}', style: AppStyles.smallStyle),
                  trailing: AppStyles.arrowForwardIcon,
                  onTap: () {
                    context.push('/command-output', extra: entry.id);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
