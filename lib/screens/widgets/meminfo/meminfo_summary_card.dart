import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/meminfo_data.dart';
import 'package:running_services_monitor/utils/format_utils.dart';

class MemInfoSummaryCard extends StatelessWidget {
  final AppSummary summary;

  const MemInfoSummaryCard({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    final items = [
      _SummaryItem('Java Heap', summary.javaHeapPss, summary.javaHeapRss, Colors.green),
      _SummaryItem('Native Heap', summary.nativeHeapPss, summary.nativeHeapRss, Colors.orange),
      _SummaryItem('Code', summary.codePss, summary.codeRss, Colors.blue),
      _SummaryItem('Stack', summary.stackPss, summary.stackRss, Colors.purple),
      _SummaryItem('Graphics', summary.graphicsPss, summary.graphicsRss, Colors.pink),
      _SummaryItem('Private Other', summary.privateOther, 0, Colors.teal),
      _SummaryItem('System', summary.system, 0, Colors.indigo),
    ];

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.5),
            Theme.of(context).colorScheme.secondaryContainer.withValues(alpha: 0.3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.rSafe),
        border: Border.all(color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.analytics, size: 20.sp, color: Theme.of(context).colorScheme.primary),
              SizedBox(width: 8.w),
              Text(
                context.loc.appSummary,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(child: _buildTotalCard(context, 'Total PSS', summary.totalPss, Colors.blue, Icons.memory)),
              SizedBox(width: 12.w),
              Expanded(child: _buildTotalCard(context, 'Total RSS', summary.totalRss, Colors.purple, Icons.storage)),
            ],
          ),
          if (summary.totalSwapPss > 0) ...[
            SizedBox(height: 12.h),
            _buildTotalCard(context, 'Swap PSS', summary.totalSwapPss, Colors.orange, Icons.swap_horiz),
          ],
          SizedBox(height: 16.h),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: items
                .where((item) => item.pss > 0 || item.rss > 0)
                .map((item) => _buildSummaryChip(context, item))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalCard(BuildContext context, String label, int value, Color color, IconData icon) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.rSafe),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 14.sp, color: color),
              SizedBox(width: 6.w),
              Text(
                label,
                style: TextStyle(fontSize: 11.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            formatRam(value.toDouble()),
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryChip(BuildContext context, _SummaryItem item) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: item.color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20.rSafe),
        border: Border.all(color: item.color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8.w,
            height: 8.w,
            decoration: BoxDecoration(color: item.color, shape: BoxShape.circle),
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.label,
                style: TextStyle(fontSize: 10.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
              Text(
                formatRam(item.pss.toDouble()),
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: item.color),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryItem {
  final String label;
  final int pss;
  final int rss;
  final Color color;

  _SummaryItem(this.label, this.pss, this.rss, this.color);
}
