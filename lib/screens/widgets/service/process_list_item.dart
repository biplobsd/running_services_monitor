import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/working_mode_bloc/working_mode_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/models/working_mode.dart';
import 'package:running_services_monitor/utils/format_utils.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/bloc/stop_service_bloc/stop_service_bloc.dart';
import 'package:running_services_monitor/utils/snackbar_helper.dart';

class ProcessListItem extends StatelessWidget {
  final ProcessEntry process;
  final String packageName;

  const ProcessListItem({super.key, required this.process, required this.packageName});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final processName = process.processName;
    final colonIdx = processName.indexOf(':');
    final displayName = colonIdx != -1 ? processName.substring(colonIdx + 1) : processName;

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 4.h),
      child: ListTile(
        onTap: () => _showProcessDetails(context),
        title: Text(
          displayName,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
          maxLines: 1,
        ),
        trailing: BlocSelector<WorkingModeBloc, WorkingModeState, bool>(
          bloc: getIt<WorkingModeBloc>(),
          selector: (state) {
            return process.pid != null && state.value.currentMode == WorkingMode.root;
          },
          builder: (context, isShow) {
            return isShow
                ? FilledButton.icon(
                    onPressed: () => _confirmStopProcess(context),
                    label: Text(context.loc.stop, style: TextStyle(fontSize: 12.sp)),
                    style: FilledButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  )
                : const SizedBox();
          },
        ),
        subtitle: Column(
          spacing: 8.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              processName,
              style: TextStyle(fontSize: 12.sp, color: colorScheme.onSurfaceVariant),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              spacing: 8.w,
              children: [
                Row(
                  spacing: 4.w,
                  children: [
                    Icon(Icons.storage, size: 12.w, color: colorScheme.secondary),
                    Text(
                      formatRam(process.ramKb),
                      style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold, color: colorScheme.secondary),
                    ),
                  ],
                ),

                if (process.pid != null)
                  Row(
                    spacing: 4.w,
                    children: [
                      Icon(Icons.numbers, size: 12.w, color: colorScheme.primary),
                      Text(
                        '${context.loc.pid}: ${process.pid}',
                        style: TextStyle(fontSize: 11.sp, color: colorScheme.primary),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showProcessDetails(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.memory, color: colorScheme.primary),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(context.loc.process, style: TextStyle(fontSize: 18.sp)),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow(context, context.loc.package, packageName),
              _buildDetailRow(context, context.loc.process, process.processName),
              _buildDetailRow(context, context.loc.ramUsage, formatRam(process.ramKb)),
              if (process.pid != null) _buildDetailRow(context, context.loc.pid, process.pid.toString()),
            ],
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              final text =
                  '''
${context.loc.package}: $packageName
${context.loc.process}: ${process.processName}
${context.loc.ramUsage}: ${formatRam(process.ramKb)}
${context.loc.pid}: ${process.pid ?? 'N/A'}
''';
              Clipboard.setData(ClipboardData(text: text));
              SnackBarHelper.showSuccess(dialogContext, context.loc.copiedToClipboard);
            },
            icon: const Icon(Icons.copy),
            label: Text(context.loc.copy),
          ),
          TextButton(onPressed: () => Navigator.of(dialogContext).pop(), child: Text(context.loc.close)),
        ],
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100.w,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13.sp,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            child: SelectableText(value, style: TextStyle(fontSize: 13.sp)),
          ),
        ],
      ),
    );
  }

  void _confirmStopProcess(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(context.loc.stopServiceConfirm, style: TextStyle(fontSize: 18.sp)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              process.processName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            SizedBox(height: 8.h),
            Text(context.loc.stopServiceWarning, style: TextStyle(fontSize: 14.sp)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(context.loc.cancel, style: TextStyle(fontSize: 14.sp)),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              if (process.pid != null) {
                context.read<StopServiceBloc>().add(
                  StopServiceEvent.stopByPid(packageName: packageName, pid: process.pid!),
                );
              }
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: Text(context.loc.stop, style: TextStyle(fontSize: 14.sp)),
          ),
        ],
      ),
    );
  }
}
