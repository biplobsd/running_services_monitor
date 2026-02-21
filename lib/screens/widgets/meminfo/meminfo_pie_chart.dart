import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/models/meminfo_data.dart';
import 'package:running_services_monitor/utils/format_utils.dart';
import 'meminfo_chart_data.dart';

class MemInfoPieChart extends StatelessWidget {
  final AppSummary summary;

  const MemInfoPieChart({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    final segments = MemInfoChartData.buildSegments(summary);
    final segmentsTotal = MemInfoChartData.getSegmentsTotal(segments);
    final double total = segmentsTotal > 0 ? segmentsTotal.toDouble() : 1.0;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: AppStyles.sectionPadding,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Memory Distribution', style: AppStyles.titleStyle.copyWith(fontWeight: FontWeight.bold)),
          AppStyles.spacingH16,
          Row(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: CustomPaint(
                  painter: _PieChartPainter(segments: segments, total: total.toDouble()),
                ),
              ),
              AppStyles.spacing16,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: segments.where((s) => s.value > 0).map((segment) {
                    final percentage = (segment.value / total * 100).toStringAsFixed(1);
                    return Padding(
                      padding: EdgeInsets.only(bottom: 6),
                      child: Row(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(color: segment.color, borderRadius: BorderRadius.circular(3)),
                          ),
                          AppStyles.spacing8,
                          Expanded(
                            child: Text(segment.label, style: AppStyles.captionStyle, overflow: TextOverflow.ellipsis),
                          ),
                          Text(
                            '$percentage%',
                            style: AppStyles.captionStyle.copyWith(fontWeight: FontWeight.w600, color: segment.color),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          AppStyles.spacingH12,
          Center(
            child: Text(
              'Total PSS: ${summary.totalPss.formatRam()}',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}

class _PieChartPainter extends CustomPainter {
  final List<MemorySegment> segments;
  final double total;

  _PieChartPainter({required this.segments, required this.total});

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
