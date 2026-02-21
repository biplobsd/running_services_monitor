import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:running_services_monitor/bloc/command_log_bloc/command_log_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/utils/format_utils.dart';

class RamInfoBottomSheet extends StatefulWidget {
  final String packageName;

  const RamInfoBottomSheet({super.key, required this.packageName});

  static void show(BuildContext context, String packageName) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => RamInfoBottomSheet(packageName: packageName),
    );
  }

  @override
  State<RamInfoBottomSheet> createState() => _RamInfoBottomSheetState();
}

class _RamInfoBottomSheetState extends State<RamInfoBottomSheet> {
  String? loadingCommand;

  String _formatRawKb(double kb) {
    final kbInt = kb.toInt();
    final formatted = kbInt.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
    return '${formatted}K';
  }

  String _getSourceLabel(RamSourceType source) {
    switch (source) {
      case RamSourceType.pid:
        return 'PID';
      case RamSourceType.processName:
        return 'Process';
      case RamSourceType.lru:
        return 'LRU Process';
      case RamSourceType.meminfoPss:
        return 'Meminfo PSS';
    }
  }

  String _getRawDataLine(RamSourceInfo source, String packageName) {
    final ramStr = _formatRawKb(source.ramKb);
    if (source.processName != null) {
      if (source.pid != null) {
        return '$ramStr: ${source.processName} (pid ${source.pid})';
      }
      return '$ramStr: ${source.processName}';
    } else if (source.pid != null) {
      return '$ramStr: $packageName (pid ${source.pid})';
    }
    return '$ramStr: $packageName';
  }

  void _executeCommand(String command) {
    setState(() => loadingCommand = command);
    getIt<CommandLogBloc>().add(CommandLogEvent.executeCommand(command));
  }

  Widget _buildCommandButton(String command, String displayCommand, String tooltip) {
    final isLoading = loadingCommand == command;
    return IconButton(
      icon: isLoading ? SizedBox(width: 16, height: 16, child: const CircularProgressIndicator(strokeWidth: 2)) : Icon(Icons.play_arrow, size: 16),
      onPressed: loadingCommand != null ? null : () => _executeCommand(command),
      tooltip: tooltip,
      padding: EdgeInsets.zero,
      style: ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
      constraints: BoxConstraints(minWidth: 32, minHeight: 32),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = context.loc; // Cached
    final verifyCommand = 'adb shell dumpsys meminfo | grep "${widget.packageName}"';
    final command1 = 'dumpsys meminfo | grep "${widget.packageName}"';
    final command2 = 'dumpsys meminfo ${widget.packageName}';

    return BlocListener<CommandLogBloc, CommandLogState>(
      bloc: getIt<CommandLogBloc>(),
      listener: (context, state) {
        state.mapOrNull(
          success: (value) {
            if (loadingCommand != null) {
              setState(() => loadingCommand = null);
              if (value.selectedEntryId != null) {
                context.push('/command-output', extra: value.selectedEntryId);
              }
            }
          },
          error: (_) {
            setState(() => loadingCommand = null);
          },
        );
      },
      child: BlocSelector<HomeBloc, HomeState, AppProcessInfo?>(
        bloc: getIt<HomeBloc>(),
        selector: (state) => state.value.allApps.firstWhereOrNull((app) => app.packageName == widget.packageName),
        builder: (context, appInfo) {
          final theme = Theme.of(context); // Cached
          final colorScheme = theme.colorScheme;
          final onSurfaceVariant = colorScheme.onSurfaceVariant;
          final surfaceContainerHighest = colorScheme.surfaceContainerHighest;

          return DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.3,
            maxChildSize: 0.9,
            expand: false,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(color: onSurfaceVariant.withValues(alpha: 0.4), borderRadius: BorderRadius.circular(2)),
                    ),
                    Padding(
                      padding: AppStyles.paddingH16, // Use AppStyles
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            loc.ramCalculation,
                            style: AppStyles.titleStyle.copyWith(fontWeight: FontWeight.bold), // Fixed style name
                          ),
                          IconButton(
                            icon: AppStyles.closeIcon, // Use AppStyles
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 1, color: theme.colorScheme.outlineVariant),
                    Expanded(
                      child: appInfo == null
                          ? Center(child: Text(loc.noRamDataAvailable))
                          : ListView(
                              controller: scrollController,
                              padding: AppStyles.padding16, // Use AppStyles
                              children: [
                                Container(
                                  padding: AppStyles.padding12, // Use AppStyles
                                  decoration: BoxDecoration(color: colorScheme.primaryContainer, borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(loc.totalRam, style: AppStyles.bodyStyle.copyWith(fontWeight: FontWeight.w500)),
                                      Text(
                                        appInfo.totalRamInKb.formatRam(),
                                        style: AppStyles.titleStyle.copyWith(fontWeight: FontWeight.bold, color: colorScheme.primary),
                                      ),
                                    ],
                                  ),
                                ),
                                AppStyles.spacingH16,
                                if (appInfo.ramSources.isEmpty)
                                  Container(
                                    padding: AppStyles.padding12,
                                    decoration: BoxDecoration(color: surfaceContainerHighest, borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      children: [
                                        Icon(Icons.info_outline, size: 20, color: onSurfaceVariant),
                                        AppStyles.spacing8,
                                        Expanded(
                                          child: Text(loc.noRamDataAvailable, style: AppStyles.captionStyle.copyWith(color: onSurfaceVariant)),
                                        ),
                                      ],
                                    ),
                                  )
                                else ...[
                                  Text(loc.ramSources, style: AppStyles.bodyStyle.copyWith(fontWeight: FontWeight.w600)),
                                  AppStyles.spacingH8,
                                  ...appInfo.ramSources.map(
                                    (source) => Container(
                                      margin: EdgeInsets.only(bottom: 8),
                                      padding: AppStyles.padding10,
                                      decoration: BoxDecoration(color: surfaceContainerHighest, borderRadius: BorderRadius.circular(8)),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                decoration: BoxDecoration(color: colorScheme.secondaryContainer, borderRadius: BorderRadius.circular(4)),
                                                child: Text(
                                                  _getSourceLabel(source.source),
                                                  style: AppStyles.smallStyle.copyWith(fontWeight: FontWeight.w500, color: colorScheme.onSecondaryContainer),
                                                ),
                                              ),
                                              AppStyles.spacing8,
                                              Expanded(
                                                child: Text(
                                                  source.pid != null ? 'PID ${source.pid}' : source.processName ?? '-',
                                                  style: AppStyles.captionStyle,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Text(
                                                source.ramKb.formatRam(),
                                                style: AppStyles.captionStyle.copyWith(fontWeight: FontWeight.bold, color: colorScheme.primary),
                                              ),
                                            ],
                                          ),
                                          AppStyles.spacingH6,
                                          Container(
                                            width: double.infinity,
                                            padding: AppStyles.padding8,
                                            decoration: BoxDecoration(
                                              color: theme.colorScheme.surface,
                                              borderRadius: BorderRadius.circular(4),
                                              border: Border.all(color: theme.colorScheme.outline.withValues(alpha: 0.3)),
                                            ),
                                            child: SelectableText(
                                              _getRawDataLine(source, widget.packageName),
                                              style: AppStyles.smallStyle.copyWith(fontFamily: 'monospace'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                                AppStyles.spacingH16,
                                Text(loc.playCommand, style: AppStyles.bodyStyle.copyWith(fontWeight: FontWeight.w600)),
                                AppStyles.spacingH8,
                                Container(
                                  width: double.infinity,
                                  padding: AppStyles.padding10,
                                  decoration: BoxDecoration(color: surfaceContainerHighest, borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: SelectableText(verifyCommand, style: AppStyles.smallStyle.copyWith(fontFamily: 'monospace')),
                                      ),
                                      _buildCommandButton(command1, verifyCommand, loc.executeCommand),
                                    ],
                                  ),
                                ),
                                AppStyles.spacingH8,
                                Container(
                                  width: double.infinity,
                                  padding: AppStyles.padding10,
                                  decoration: BoxDecoration(color: surfaceContainerHighest, borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: SelectableText('adb shell $command2', style: AppStyles.smallStyle.copyWith(fontFamily: 'monospace')),
                                      ),
                                      _buildCommandButton(command2, 'adb shell $command2', loc.executeCommand),
                                    ],
                                  ),
                                ),
                                AppStyles.spacingH12,
                                Text(
                                  loc.ramCalculationExplanation,
                                  style: AppStyles.smallStyle.copyWith(color: onSurfaceVariant, fontStyle: FontStyle.italic),
                                ),
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
}
