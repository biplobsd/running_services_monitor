import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/models/meminfo_data.dart';
import 'package:running_services_monitor/utils/format_utils.dart';

class MemInfoCategoryCard extends StatelessWidget {
  final MemInfoCategory category;
  final int maxPss;
  final Color? accentColor;

  const MemInfoCategoryCard({super.key, required this.category, required this.maxPss, this.accentColor});

  IconData _getCategoryIcon(String name) {
    final lower = name.toLowerCase();
    if (lower.contains('native heap')) return Icons.memory;
    if (lower.contains('dalvik')) return Icons.android;
    if (lower.contains('stack')) return Icons.layers;
    if (lower.contains('gfx') || lower.contains('gl') || lower.contains('egl')) return Icons.brush;
    if (lower.contains('mmap') || lower.contains('.so') || lower.contains('.apk')) return Icons.folder;
    if (lower.contains('ashmem')) return Icons.share;
    return Icons.data_usage;
  }

  Color _getCategoryColor(String name, BuildContext context) {
    final lower = name.toLowerCase();
    if (lower.contains('native heap')) return Colors.orange;
    if (lower.contains('dalvik')) return Colors.green;
    if (lower.contains('stack')) return Colors.purple;
    if (lower.contains('gfx') || lower.contains('egl')) return Colors.pink;
    if (lower.contains('gl mtrack')) return Colors.red;
    if (lower.contains('.so')) return Colors.blue;
    if (lower.contains('.apk') || lower.contains('.dex')) return Colors.teal;
    if (lower.contains('unknown')) return Colors.grey;
    return Theme.of(context).colorScheme.primary;
  }

  @override
  Widget build(BuildContext context) {
    final color = accentColor ?? _getCategoryColor(category.name, context);
    final progress = maxPss > 0 ? (category.pssTotal / maxPss).clamp(0.0, 1.0) : 0.0;

    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.rSafe),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(8.rSafe),
                ),
                child: Icon(_getCategoryIcon(category.name), size: 16.sp, color: color),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.name,
                      style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'PSS: ${formatRam(category.pssTotal.toDouble())}',
                      style: TextStyle(fontSize: 11.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    formatRam(category.pssTotal.toDouble()),
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: color),
                  ),
                  if (category.rssTotal > 0)
                    Text(
                      'RSS: ${formatRam(category.rssTotal.toDouble())}',
                      style: TextStyle(fontSize: 10.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
                    ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(4.rSafe),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: color.withValues(alpha: 0.1),
              valueColor: AlwaysStoppedAnimation(color),
              minHeight: 6.h,
            ),
          ),
          SizedBox(height: 8.h),
          Wrap(
            spacing: 6.w,
            runSpacing: 4.h,
            children: [
              _buildMetricChip(context, 'Dirty', category.privateDirty, Colors.red),
              _buildMetricChip(context, 'Clean', category.privateClean, Colors.green),
              _buildMetricChip(context, 'Swap', category.swapPssDirty, Colors.orange),
              if (category.heapSize != null && category.heapSize! > 0)
                _buildMetricChip(context, 'Heap', category.heapSize!, Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricChip(BuildContext context, String label, int value, Color color) {
    if (value == 0) {
      return SizedBox.shrink();
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(6.rSafe)),
      child: Text(
        '$label: ${formatRam(value.toDouble())}',
        style: TextStyle(fontSize: 9.sp, fontWeight: FontWeight.w500, color: color),
      ),
    );
  }
}
