import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:running_services_monitor/bloc/command_log_bloc/command_log_bloc.dart';
import 'package:running_services_monitor/bloc/useful_commands_bloc/useful_commands_bloc.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/models/useful_command.dart';
import 'package:running_services_monitor/utils/format_utils.dart';

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
  String? loadingCommandId;
  bool showAddForm = false;
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

  String _replaceplaceholders(String command) {
    final appInfo = widget.appInfo;
    String result = command.replaceAll('%p', widget.packageName);
    if (appInfo != null) {
      result = result
          .replaceAll('%pid', appInfo.pids.isNotEmpty ? appInfo.pids.first.toString() : '')
          .replaceAll('%pids', appInfo.pids.join(','))
          .replaceAll('%ram', appInfo.totalRamInKb.formatRam())
          .replaceAll('%ramKb', appInfo.totalRamInKb.toStringAsFixed(0))
          .replaceAll('%state', appInfo.processState ?? '')
          .replaceAll('%cached', appInfo.cachedMemoryKb.toStringAsFixed(0))
          .replaceAll('%svcCount', appInfo.services.length.toString())
          .replaceAll('%procCount', appInfo.processCount.toString());
    }
    return result;
  }

  void _executeCommand(UsefulCommand command) {
    setState(() => loadingCommandId = command.id);
    final actualCommand = _replaceplaceholders(command.command);
    getIt<CommandLogBloc>().add(CommandLogEvent.executeCommand(actualCommand));
  }

  void _addCustomCommand() {
    if (titleController.text.isEmpty || commandController.text.isEmpty) return;
    getIt<UsefulCommandsBloc>().add(
      UsefulCommandsEvent.addCommand(title: titleController.text, description: descriptionController.text, command: commandController.text),
    );
    titleController.clear();
    descriptionController.clear();
    commandController.clear();
    setState(() => showAddForm = false);
  }

  void _deleteCommand(UsefulCommand command) {
    if (command.isCustom) {
      getIt<UsefulCommandsBloc>().add(UsefulCommandsEvent.removeCommand(command.id));
    } else {
      getIt<UsefulCommandsBloc>().add(UsefulCommandsEvent.hideDefaultCommand(command.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BlocListener<CommandLogBloc, CommandLogState>(
      bloc: getIt<CommandLogBloc>(),
      listener: (context, state) {
        state.mapOrNull(
          success: (value) {
            if (loadingCommandId != null) {
              setState(() => loadingCommandId = null);
              if (value.selectedEntryId != null) {
                context.push('/command-output', extra: value.selectedEntryId);
              }
            }
          },
          error: (_) => setState(() => loadingCommandId = null),
        );
      },
      child: BlocBuilder<UsefulCommandsBloc, UsefulCommandsState>(
        bloc: getIt<UsefulCommandsBloc>(),
        builder: (context, state) {
          final userCommands = state.userCommands;
          final defaultCommands = UsefulCommandsBloc.defaultCommands.where((c) => !state.hiddenDefaultCommandIds.contains(c.id)).toList();

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
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(color: colorScheme.onSurfaceVariant.withValues(alpha: 0.4), borderRadius: BorderRadius.circular(2)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(loc.usefulCommands, style: AppStyles.titleStyle.copyWith(fontSize: 18)),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (state.hasHiddenDefaults)
                                IconButton(
                                  icon: Icon(Icons.restore, size: 24),
                                  tooltip: loc.resetDefaults,
                                  onPressed: () => getIt<UsefulCommandsBloc>().add(const UsefulCommandsEvent.resetDefaults()),
                                ),
                              IconButton(
                                icon: Icon(showAddForm ? Icons.close : Icons.add, size: 24),
                                onPressed: () => setState(() => showAddForm = !showAddForm),
                              ),
                              IconButton(
                                icon: Icon(Icons.close, size: 24),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 1, color: colorScheme.outlineVariant),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        padding: EdgeInsets.all(16),
                        children: [
                          if (showAddForm) ...[_buildAddCommandForm(context), AppStyles.spacingH16],
                          if (userCommands.isNotEmpty) ...[
                            _buildSectionHeader(context, loc.myCommands),
                            ...userCommands.map((cmd) => _buildCommandTile(context, cmd)),
                            AppStyles.spacingH16,
                          ],
                          if (defaultCommands.isNotEmpty) ...[
                            _buildSectionHeader(context, loc.defaultCommands),
                            ...defaultCommands.map((cmd) => _buildCommandTile(context, cmd)),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: AppStyles.captionStyle.copyWith(color: colorScheme.primary, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildPlaceholderReference(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final placeholders = <MapEntry<String, String>>[
      MapEntry('%p', 'packageName → ${widget.packageName}'),
      if (widget.appInfo != null) ...[
        MapEntry('%pid', 'First PID → ${widget.appInfo!.pids.isNotEmpty ? widget.appInfo!.pids.first : "N/A"}'),
        MapEntry('%pids', 'All PIDs → ${widget.appInfo!.pids.join(",")}'),
        MapEntry('%ram', 'Total RAM → ${widget.appInfo!.totalRamInKb.formatRam()}'),
        MapEntry('%ramKb', 'RAM in KB → ${widget.appInfo!.totalRamInKb.toStringAsFixed(0)}'),
        MapEntry('%state', 'Process State → ${widget.appInfo!.processState ?? "N/A"}'),
        MapEntry('%cached', 'Cached Memory KB → ${widget.appInfo!.cachedMemoryKb.toStringAsFixed(0)}'),
        MapEntry('%svcCount', 'Services Count → ${widget.appInfo!.services.length}'),
        MapEntry('%procCount', 'Process Count → ${widget.appInfo!.processCount}'),
      ],
    ];

    return ExpansionTile(
      title: Text(context.loc.placeholders, style: AppStyles.bodyStyle.copyWith(fontSize: 14)),
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.only(bottom: 8),
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(color: colorScheme.surfaceContainerHighest, borderRadius: BorderRadius.circular(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: placeholders.map((entry) {
              return Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(color: colorScheme.primaryContainer, borderRadius: BorderRadius.circular(4)),
                      child: Text(
                        entry.key,
                        style: AppStyles.smallStyle.copyWith(fontFamily: 'monospace', fontWeight: FontWeight.w600, color: colorScheme.onPrimaryContainer),
                      ),
                    ),
                    AppStyles.spacing8,
                    Expanded(
                      child: Text(
                        entry.value,
                        style: AppStyles.smallStyle.copyWith(fontSize: 11),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildAddCommandForm(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colorScheme.primary.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.loc.addCommand, style: AppStyles.titleStyle.copyWith(fontSize: 14)),
          SizedBox(height: 12),
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: context.loc.commandTitle, isDense: true, border: const OutlineInputBorder()),
          ),
          AppStyles.spacingH8,
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(labelText: context.loc.commandDescription, isDense: true, border: const OutlineInputBorder()),
          ),
          AppStyles.spacingH8,
          TextField(
            controller: commandController,
            decoration: InputDecoration(labelText: context.loc.command, isDense: true, border: const OutlineInputBorder(), hintText: 'dumpsys meminfo %p'),
          ),
          SizedBox(height: 12),
          _buildPlaceholderReference(context),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () => setState(() => showAddForm = false), child: Text(context.loc.cancel)),
              AppStyles.spacing8,
              FilledButton(onPressed: _addCustomCommand, child: Text(context.loc.addCommand)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCommandTile(BuildContext context, UsefulCommand command) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isLoading = loadingCommandId == command.id;

    return Container(
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(color: colorScheme.surfaceContainerHighest, borderRadius: BorderRadius.circular(8)),
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
            IconButton(
              icon: Icon(command.isCustom ? Icons.delete_outline : Icons.visibility_off_outlined, size: 20, color: colorScheme.error),
              onPressed: () => _deleteCommand(command),
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(minWidth: 32, minHeight: 32),
            ),
            IconButton(
              icon: isLoading
                  ? SizedBox(width: 20, height: 20, child: const CircularProgressIndicator(strokeWidth: 2))
                  : Icon(Icons.play_arrow, size: 24, color: colorScheme.primary),
              onPressed: loadingCommandId != null ? null : () => _executeCommand(command),
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(minWidth: 40, minHeight: 40),
            ),
          ],
        ),
      ),
    );
  }
}
