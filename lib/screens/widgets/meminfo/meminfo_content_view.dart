import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/meminfo_data.dart';
import 'meminfo_category_card.dart';
import 'meminfo_summary_card.dart';
import 'meminfo_objects_card.dart';
import 'meminfo_pie_chart.dart';
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
    final maxPss = data.categories.isNotEmpty
        ? data.categories.map((c) => c.pssTotal).reduce((a, b) => a > b ? a : b)
        : 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'PID: ${data.pid}',
                style: TextStyle(fontSize: 14.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
            ),
            IconButton(
              icon: Icon(Icons.refresh, size: 20.sp),
              onPressed: onRefresh,
              tooltip: context.loc.refresh,
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: FilledButton.tonalIcon(
                onPressed: onToggleRawOutput,
                icon: Icon(showRawOutput ? Icons.visibility_off : Icons.code, size: 18.sp),
                label: Text(
                  showRawOutput ? context.loc.hideRawOutput : context.loc.viewRawOutput,
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: FilledButton.icon(
                onPressed: () => context.push('/meminfo-compare', extra: {'packageName': packageName}),
                icon: Icon(Icons.compare_arrows, size: 18.sp),
                label: Text(context.loc.compareWithOther, style: TextStyle(fontSize: 12.sp)),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        if (showRawOutput) ...[
          CodeOutputBox(
            text: data.rawOutput.isEmpty ? context.loc.noOutput : data.rawOutput,
            fontSize: 10.sp,
            textColor: const Color(0xFF4EC9B0),
            backgroundColor: Colors.black,
            horizontalScroll: true,
            hasBorder: true,
          ),
          SizedBox(height: 16.h),
        ],
        if (data.appSummary != null) ...[MemInfoPieChart(summary: data.appSummary!), SizedBox(height: 16.h)],
        if (data.appSummary != null) ...[MemInfoSummaryCard(summary: data.appSummary!), SizedBox(height: 16.h)],
        if (data.objects != null) ...[MemInfoObjectsCard(objects: data.objects!), SizedBox(height: 16.h)],
        if (data.categories.isNotEmpty) ...[
          Text(
            context.loc.memoryCategories,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12.h),
          ...data.categories.map((category) => MemInfoCategoryCard(category: category, maxPss: maxPss)),
        ],
        SizedBox(height: 24.h),
      ],
    );
  }
}
