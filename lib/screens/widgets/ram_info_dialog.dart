import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:running_services_monitor/bloc/command_log_bloc/command_log_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/core/extensions.dart';
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
      icon: isLoading
          ? SizedBox(width: 16.sp, height: 16.sp, child: const CircularProgressIndicator(strokeWidth: 2))
          : Icon(Icons.play_arrow, size: 16.sp),
      onPressed: loadingCommand != null ? null : () => _executeCommand(command),
      tooltip: tooltip,
      padding: EdgeInsets.zero,
      style: ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
      constraints: BoxConstraints(minWidth: 32.w, minHeight: 32.h),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;
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
          return DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.3,
            maxChildSize: 0.9,
            expand: false,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16.rSafe)),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12.h),
                      width: 40.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(2.rSafe),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            loc.ramCalculation,
                            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: Icon(Icons.close, size: 24.sp),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      ),
                    ),
                    Divider(height: 1, color: Theme.of(context).colorScheme.outlineVariant),
                    Expanded(
                      child: appInfo == null
                          ? Center(child: Text(loc.noRamDataAvailable))
                          : ListView(
                              controller: scrollController,
                              padding: EdgeInsets.all(16.w),
                              children: [
                                Container(
                                  padding: EdgeInsets.all(12.w),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.primaryContainer,
                                    borderRadius: BorderRadius.circular(8.rSafe),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        loc.totalRam,
                                        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        appInfo.totalRam,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).colorScheme.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 16.h),
                                if (appInfo.ramSources.isEmpty)
                                  Container(
                                    padding: EdgeInsets.all(12.w),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.surfaceContainerHighest,
                                      borderRadius: BorderRadius.circular(8.rSafe),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.info_outline, size: 20.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
                                        SizedBox(width: 8.w),
                                        Expanded(
                                          child: Text(
                                            loc.noRamDataAvailable,
                                            style: TextStyle(fontSize: 12.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                else ...[
                                  Text(
                                    loc.ramSources,
                                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(height: 8.h),
                                  ...appInfo.ramSources.map(
                                    (source) => Container(
                                      margin: EdgeInsets.only(bottom: 8.h),
                                      padding: EdgeInsets.all(10.w),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).colorScheme.surfaceContainerHighest,
                                        borderRadius: BorderRadius.circular(8.rSafe),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context).colorScheme.secondaryContainer,
                                                  borderRadius: BorderRadius.circular(4.rSafe),
                                                ),
                                                child: Text(
                                                  _getSourceLabel(source.source),
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 8.w),
                                              Expanded(
                                                child: Text(
                                                  source.pid != null ? 'PID ${source.pid}' : source.processName ?? '-',
                                                  style: TextStyle(fontSize: 12.sp),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Text(
                                                formatRam(source.ramKb),
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Theme.of(context).colorScheme.primary,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 6.h),
                                          Container(
                                            width: double.infinity,
                                            padding: EdgeInsets.all(8.w),
                                            decoration: BoxDecoration(
                                              color: Theme.of(context).colorScheme.surface,
                                              borderRadius: BorderRadius.circular(4.rSafe),
                                              border: Border.all(color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3)),
                                            ),
                                            child: SelectableText(
                                              _getRawDataLine(source, widget.packageName),
                                              style: TextStyle(fontSize: 10.sp, fontFamily: 'monospace'),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                                SizedBox(height: 16.h),
                                Text(
                                  loc.playCommand,
                                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 8.h),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(10.w),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.surfaceContainerHighest,
                                    borderRadius: BorderRadius.circular(8.rSafe),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: SelectableText(
                                          verifyCommand,
                                          style: TextStyle(fontSize: 10.sp, fontFamily: 'monospace'),
                                        ),
                                      ),
                                      _buildCommandButton(command1, verifyCommand, loc.executeCommand),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.all(10.w),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.surfaceContainerHighest,
                                    borderRadius: BorderRadius.circular(8.rSafe),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: SelectableText(
                                          'adb shell $command2',
                                          style: TextStyle(fontSize: 10.sp, fontFamily: 'monospace'),
                                        ),
                                      ),
                                      _buildCommandButton(command2, 'adb shell $command2', loc.executeCommand),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                Text(
                                  loc.ramCalculationExplanation,
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                    fontStyle: FontStyle.italic,
                                  ),
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
