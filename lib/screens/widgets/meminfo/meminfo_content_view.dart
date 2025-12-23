import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/meminfo_data.dart';
import 'meminfo_summary_card.dart';
import 'meminfo_objects_card.dart';
import '../home/stats/meminfo_pie_chart.dart';
import '../common/code_output_box.dart';

class MemInfoContentView extends StatelessWidget {
  final MemInfoData data;
  final bool showRawOutput;
  final VoidCallback onToggleRawOutput;
  final VoidCallback onRefresh;
  final String packageName;

  const MemInfoContentView({
    super.key,
    required this.data,
    required this.showRawOutput,
    required this.onToggleRawOutput,
    required this.onRefresh,
    required this.packageName,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16.h,
      children: [
        Row(
          children: [
            Expanded(
              child: Text('PID: ${data.pid}', style: AppStyles.bodyStyle.copyWith(color: colorScheme.onSurfaceVariant)),
            ),
            IconButton(icon: AppStyles.refreshIcon, onPressed: onRefresh, tooltip: context.loc.refresh),
          ],
        ),
        Row(
          spacing: 8.w,
          children: [
            Expanded(
              child: FilledButton.tonalIcon(
                onPressed: onToggleRawOutput,
                icon: Icon(showRawOutput ? Icons.visibility_off : Icons.code, size: 18.sp),
                label: Text(showRawOutput ? context.loc.hideRawOutput : context.loc.viewRawOutput, style: AppStyles.smallStyle),
              ),
            ),
            Expanded(
              child: FilledButton.icon(
                onPressed: () => context.push('/meminfo-compare', extra: {'packageName': packageName}),
                icon: Icon(Icons.compare_arrows, size: 18.sp),
                label: Text(context.loc.compareWithOther, style: AppStyles.smallStyle),
              ),
            ),
          ],
        ),
        if (showRawOutput)
          CodeOutputBox(
            text: data.rawOutput.isEmpty ? context.loc.noOutput : data.rawOutput,
            fontSize: 10.sp,
            textColor: const Color(0xFF4EC9B0),
            backgroundColor: Colors.black,
            horizontalScroll: true,
            hasBorder: true,
          ),
        if (data.appSummary != null) MemInfoPieChart(summary: data.appSummary!),
        if (data.appSummary != null) MemInfoSummaryCard(summary: data.appSummary!),
        if (data.objects != null) MemInfoObjectsCard(objects: data.objects!),
      ],
    );
  }
}
