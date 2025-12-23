import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/bloc/command_log_bloc/command_log_bloc.dart';
import 'package:running_services_monitor/bloc/command_output_bloc/command_output_bloc.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/command_log_entry.dart';
import 'package:running_services_monitor/screens/widgets/common/auto_refresh_timer_button.dart';
import 'package:running_services_monitor/screens/widgets/common/code_output_box.dart';
import 'package:running_services_monitor/screens/widgets/common/loading_indicator.dart';
import 'package:share_plus/share_plus.dart';

class CommandOutputScreen extends StatefulWidget {
  final String entryId;

  const CommandOutputScreen({super.key, required this.entryId});

  @override
  State<CommandOutputScreen> createState() => _CommandOutputScreenState();
}

class _CommandOutputScreenState extends State<CommandOutputScreen> {
  late CommandOutputBloc bloc;

  @override
  void initState() {
    super.initState();
    final entry = getIt<CommandLogBloc>().state.value.where((e) => e.id == widget.entryId).firstOrNull;
    bloc = CommandOutputBloc(entryId: widget.entryId, command: entry?.command ?? '');
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<CommandOutputBloc, CommandOutputState>(
        builder: (context, outputState) {
          return BlocSelector<CommandLogBloc, CommandLogState, CommandLogEntry?>(
            bloc: getIt<CommandLogBloc>(),
            selector: (state) => state.value.where((e) => e.id == outputState.currentEntryId).firstOrNull,
            builder: (context, entry) {
              if (entry == null) {
                return Scaffold(
                  appBar: AppBar(title: Text(context.loc.commandOutput)),
                  body: Center(child: Text(context.loc.error)),
                );
              }

              return Scaffold(
                appBar: AppBar(
                  title: Text(context.loc.commandOutput, style: AppStyles.headlineStyle),
                  actions: [
                    AutoRefreshTimerButton(
                      isEnabled: outputState.autoRefreshInterval != null,
                      currentInterval: outputState.autoRefreshInterval,
                      onToggle: () {
                        if (outputState.autoRefreshInterval != null) {
                          bloc.add(const CommandOutputEvent.setAutoRefreshInterval(null));
                        } else {
                          bloc.add(const CommandOutputEvent.setAutoRefreshInterval(Duration(seconds: 3)));
                        }
                      },
                      onIntervalSelected: (interval) {
                        bloc.add(CommandOutputEvent.setAutoRefreshInterval(interval));
                      },
                    ),
                    IconButton(
                      icon: outputState.isRefreshing ? SizedBox(width: 24.sp, height: 24.sp, child: const LoadingIndicator()) : AppStyles.refreshIcon,
                      tooltip: context.loc.reExecute,
                      onPressed: outputState.isRefreshing ? null : () => bloc.add(const CommandOutputEvent.refresh()),
                    ),
                    IconButton(
                      icon: const Icon(Icons.share),
                      tooltip: 'Share',
                      onPressed: () async {
                        final text = '${context.loc.command}:\n${entry.command}\n\n${context.loc.rawOutput}:\n${entry.output}';
                        final file = XFile.fromData(Uint8List.fromList(text.codeUnits), name: 'command_output.txt', mimeType: 'text/plain');
                        await SharePlus.instance.share(ShareParams(files: [file]));
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.copy),
                      tooltip: context.loc.copy,
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: entry.output));
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(context.loc.copiedToClipboard), duration: const Duration(seconds: 2)));
                      },
                    ),
                  ],
                ),
                body: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate([
                        Container(
                          margin: EdgeInsets.all(16.w),
                          width: double.infinity,
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainerHighest, borderRadius: BorderRadius.circular(8.r)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    context.loc.command,
                                    style: AppStyles.captionStyle.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
                                  ),
                                  const Spacer(),
                                  if (outputState.autoRefreshInterval != null)
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).colorScheme.primaryContainer,
                                        borderRadius: BorderRadius.circular(4.r),
                                      ),
                                      child: Text(
                                        _formatDuration(outputState.autoRefreshInterval!),
                                        style: AppStyles.smallStyle.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              AppStyles.spacingH4,
                              SelectableText(
                                entry.command,
                                style: AppStyles.bodyStyle.copyWith(fontFamily: 'monospace', fontSize: 13.sp),
                              ),
                            ],
                          ),
                        ),
                        CodeOutputBox(
                          text: entry.output.isEmpty ? context.loc.noOutput : entry.output,
                          fontSize: 12.sp,
                          textColor: const Color(0xFF4EC9B0),
                          backgroundColor: Colors.black,
                          horizontalScroll: true,
                          hasBorder: true,
                        ),
                      ]),
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

  String _formatDuration(Duration d) {
    if (d.inMilliseconds < 1000) {
      return '${d.inMilliseconds}ms';
    }
    return '${d.inSeconds}s';
  }
}
