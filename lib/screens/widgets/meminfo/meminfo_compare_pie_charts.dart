import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/models/meminfo_data.dart';
import 'package:running_services_monitor/utils/format_utils.dart';
import 'meminfo_chart_data.dart';

class MemInfoComparePieCharts extends StatelessWidget {
  final MemInfoData currentData;
  final MemInfoData comparisonData;
  final String currentLabel;
  final String compareLabel;

  const MemInfoComparePieCharts({super.key, required this.currentData, required this.comparisonData, required this.currentLabel, required this.compareLabel});

  @override
  Widget build(BuildContext context) {
    final currentSummary = currentData.appSummary;
    final compareSummary = comparisonData.appSummary;

    if (currentSummary == null && compareSummary == null) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: AppStyles.sectionPadding,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16.rSafe),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Memory Distribution', style: AppStyles.titleStyle.copyWith(fontWeight: FontWeight.bold)),
          AppStyles.spacingH16,
          Row(
            children: [
              Expanded(
                child: _PieChartColumn(summary: currentSummary, label: currentLabel, color: colorScheme.primary),
              ),
              AppStyles.spacing16,
              Expanded(
                child: _PieChartColumn(summary: compareSummary, label: compareLabel, color: colorScheme.secondary),
              ),
            ],
          ),
          AppStyles.spacingH16,
          _buildLegend(context),
        ],
      ),
    );
  }

  Widget _buildLegend(BuildContext context) {
    return Wrap(
      spacing: 12.w,
      runSpacing: 6.h,
      children: MemInfoChartData.legendItems
          .map(
            (item) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 10.w,
                  height: 10.w,
                  decoration: BoxDecoration(color: item.color, borderRadius: BorderRadius.circular(2.rSafe)),
                ),
                AppStyles.spacing4,
                Text(item.label, style: AppStyles.smallStyle),
              ],
            ),
          )
          .toList(),
    );
  }
}

class _PieChartColumn extends StatelessWidget {
  final AppSummary? summary;
  final String label;
  final Color color;

  const _PieChartColumn({required this.summary, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    final segments = MemInfoChartData.buildSegments(summary);
    final total = MemInfoChartData.getSegmentsTotal(segments);

    return Column(
      children: [
        Text(
          label,
          style: AppStyles.captionStyle.copyWith(fontWeight: FontWeight.w600, color: color),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        AppStyles.spacingH8,
        SizedBox(
          width: 80.w,
          height: 80.w,
          child: segments.isNotEmpty && total > 0
              ? CustomPaint(
                  painter: _MiniPieChartPainter(segments: segments, total: total),
                )
              : Center(child: Text('N/A', style: AppStyles.subtitleStyle)),
        ),
        AppStyles.spacingH8,
        Text(
          summary != null ? summary!.totalPss.formatRam() : '-',
          style: AppStyles.subtitleStyle.copyWith(fontWeight: FontWeight.bold, color: color),
        ),
      ],
    );
  }
}

class _MiniPieChartPainter extends CustomPainter {
  final List<MemorySegment> segments;
  final double total;

  _MiniPieChartPainter({required this.segments, required this.total});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2;

    double startAngle = -math.pi / 2;

    for (final segment in segments) {
      if (segment.value <= 0) continue;
      final sweepAngle = (segment.value / total) * 2 * math.pi;
      final paint = Paint()
        ..color = segment.color
        ..style = PaintingStyle.fill;
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle, sweepAngle, true, paint);
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
