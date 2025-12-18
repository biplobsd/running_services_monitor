import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/bloc/command_log_bloc/command_log_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/command_log_entry.dart';
import 'package:share_plus/share_plus.dart';

class CommandOutputScreen extends StatelessWidget {
  final String entryId;

  const CommandOutputScreen({super.key, required this.entryId});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CommandLogBloc, CommandLogState, CommandLogEntry?>(
      bloc: getIt<CommandLogBloc>(),
      selector: (state) => state.value.where((e) => e.id == entryId).firstOrNull,
      builder: (context, entry) {
        if (entry == null) {
          return Scaffold(
            appBar: AppBar(title: Text(context.loc.commandOutput)),
            body: Center(child: Text(context.loc.error)),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(context.loc.commandOutput, style: TextStyle(fontSize: 20.sp)),
            actions: [
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
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.loc.command,
                          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary),
                        ),
                        SizedBox(height: 4.h),
                        SelectableText(
                          entry.command,
                          style: TextStyle(fontSize: 13.sp, fontFamily: 'monospace'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SelectableText(
                        scrollPhysics: const NeverScrollableScrollPhysics(),
                        entry.output.isEmpty ? context.loc.noOutput : entry.output,
                        style: TextStyle(fontSize: 12.sp, fontFamily: 'monospace', height: 1.5, color: const Color(0xFF4EC9B0)),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        );
      },
    );
  }
}
