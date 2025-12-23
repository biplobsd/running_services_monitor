import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/working_mode_bloc/working_mode_bloc.dart';
import 'package:running_services_monitor/core/app_styles.dart';
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
    final colors = Theme.of(context).colorScheme;
    final loc = context.loc;
    final displayName = _getDisplayName();

    return Card(
      margin: AppStyles.cardMargin,
      child: ListTile(
        onTap: () => _showProcessDetails(context),
        title: Text(displayName, style: AppStyles.titleStyle, maxLines: 1),
        trailing: BlocSelector<WorkingModeBloc, WorkingModeState, bool>(
          bloc: getIt<WorkingModeBloc>(),
          selector: (state) => process.pid != null && state.value.currentMode == WorkingMode.root,
          builder: (context, isShow) {
            if (!isShow) return const SizedBox.shrink();
            return FilledButton.icon(
              onPressed: () => _confirmStopProcess(context),
              label: Text(loc.stop, style: AppStyles.subtitleStyle),
              style: FilledButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            );
          },
        ),
        subtitle: Column(
          spacing: 8.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              process.processName,
              style: AppStyles.subtitleStyle.copyWith(color: colors.onSurfaceVariant),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              spacing: 8.w,
              children: [
                Row(
                  spacing: 4.w,
                  children: [
                    Icon(Icons.storage, size: 12.w, color: colors.secondary),
                    Text(
                      process.ramKb.formatRam(),
                      style: AppStyles.captionStyle.copyWith(fontWeight: FontWeight.bold, color: colors.secondary),
                    ),
                  ],
                ),
                if (process.pid != null)
                  Row(
                    spacing: 4.w,
                    children: [
                      Icon(Icons.numbers, size: 12.w, color: colors.primary),
                      Text('${loc.pid}: ${process.pid}', style: AppStyles.captionStyle.copyWith(color: colors.primary)),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getDisplayName() {
    final processName = process.processName;
    final colonIdx = processName.indexOf(':');
    return colonIdx != -1 ? processName.substring(colonIdx + 1) : processName;
  }

  void _showProcessDetails(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final loc = context.loc;
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.memory, color: colors.primary),
            AppStyles.spacing8,
            Expanded(child: Text(loc.process, style: AppStyles.headlineStyle)),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow(context, loc.package, packageName),
              _buildDetailRow(context, loc.process, process.processName),
              _buildDetailRow(context, loc.ramUsage, process.ramKb.formatRam()),
              if (process.pid != null) _buildDetailRow(context, loc.pid, process.pid.toString()),
            ],
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              final text =
                  '${loc.package}: $packageName\n${loc.process}: ${process.processName}\n${loc.ramUsage}: ${process.ramKb.formatRam()}\n${loc.pid}: ${process.pid ?? 'N/A'}';
              Clipboard.setData(ClipboardData(text: text));
              SnackBarHelper.showSuccess(dialogContext, loc.copiedToClipboard);
            },
            icon: const Icon(Icons.copy),
            label: Text(loc.copy),
          ),
          TextButton(onPressed: () => Navigator.of(dialogContext).pop(), child: Text(loc.close)),
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
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
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
    final loc = context.loc;
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(loc.stopServiceConfirm, style: AppStyles.headlineStyle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(process.processName, style: AppStyles.titleStyle),
            AppStyles.spacingH8,
            Text(loc.stopServiceWarning, style: AppStyles.bodyStyle),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(loc.cancel, style: AppStyles.bodyStyle),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              if (process.pid != null) {
                context.read<StopServiceBloc>().add(StopServiceEvent.stopByPid(packageName: packageName, pid: process.pid!));
              }
            },
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: Text(loc.stop, style: AppStyles.bodyStyle),
          ),
        ],
      ),
    );
  }
}
