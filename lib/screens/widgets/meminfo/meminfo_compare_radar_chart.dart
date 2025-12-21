import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/models/meminfo_data.dart';
import 'package:running_services_monitor/utils/format_utils.dart';
import 'meminfo_chart_data.dart';

class MemInfoCompareRadarChart extends StatelessWidget {
  final MemInfoData currentData;
  final MemInfoData comparisonData;
  final String currentLabel;
  final String compareLabel;

  const MemInfoCompareRadarChart({
    super.key,
    required this.currentData,
    required this.comparisonData,
    required this.currentLabel,
    required this.compareLabel,
  });

  @override
  Widget build(BuildContext context) {
    final currentSummary = currentData.appSummary;
    final compareSummary = comparisonData.appSummary;

    if (currentSummary == null && compareSummary == null) {
      return const SizedBox.shrink();
    }

    final metrics = MemInfoChartData.buildMetrics(currentSummary, compareSummary);
    final maxValue = metrics.map((m) => math.max(m.currentValue, m.compareValue)).reduce((a, b) => a > b ? a : b);

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16.rSafe),
        border: Border.all(color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Radar Comparison',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _LegendDot(color: Theme.of(context).colorScheme.primary, label: currentLabel),
              SizedBox(width: 16.w),
              _LegendDot(color: Theme.of(context).colorScheme.secondary, label: compareLabel),
            ],
          ),
          SizedBox(height: 16.h),
          AspectRatio(
            aspectRatio: 1.2,
            child: CustomPaint(
              painter: _RadarChartPainter(
                metrics: metrics,
                maxValue: maxValue,
                primaryColor: Theme.of(context).colorScheme.primary,
                secondaryColor: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          _buildMetricsTable(context, metrics),
        ],
      ),
    );
  }

  Widget _buildMetricsTable(BuildContext context, List<MemoryMetric> metrics) {
    return Column(
      children: metrics.map((m) {
        final diff = m.currentValue - m.compareValue;
        final diffColor = diff < 0
            ? Colors.green
            : diff > 0
            ? Colors.red
            : Theme.of(context).colorScheme.onSurfaceVariant;
        final diffIcon = diff < 0
            ? Icons.arrow_downward
            : diff > 0
            ? Icons.arrow_upward
            : null;

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Row(
            children: [
              SizedBox(
                width: 60.w,
                child: Text(m.label, style: TextStyle(fontSize: 11.sp)),
              ),
              Expanded(
                child: Text(
                  formatRam(m.currentValue),
                  style: TextStyle(fontSize: 11.sp, color: Theme.of(context).colorScheme.primary),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                'vs',
                style: TextStyle(fontSize: 10.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  formatRam(m.compareValue),
                  style: TextStyle(fontSize: 11.sp, color: Theme.of(context).colorScheme.secondary),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                width: 50.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (diffIcon != null) Icon(diffIcon, size: 12.sp, color: diffColor),
                    Flexible(
                      child: Text(
                        formatRam(diff.abs()),
                        style: TextStyle(fontSize: 10.sp, color: diffColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12.w,
          height: 12.w,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.3),
            border: Border.all(color: color, width: 2),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 6.w),
        Text(
          label,
          style: TextStyle(fontSize: 11.sp),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class _RadarChartPainter extends CustomPainter {
  final List<MemoryMetric> metrics;
  final double maxValue;
  final Color primaryColor;
  final Color secondaryColor;

  _RadarChartPainter({
    required this.metrics,
    required this.maxValue,
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 * 0.8;
    final sides = metrics.length;
    final angleStep = 2 * math.pi / sides;

    _drawWeb(canvas, center, radius, sides, angleStep);
    _drawLabels(canvas, center, radius, sides, angleStep);
    _drawDataPolygon(canvas, center, radius, sides, angleStep, true, primaryColor);
    _drawDataPolygon(canvas, center, radius, sides, angleStep, false, secondaryColor);
  }

  void _drawWeb(Canvas canvas, Offset center, double radius, int sides, double angleStep) {
    final webPaint = Paint()
      ..color = Colors.grey.withValues(alpha: 0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (int ring = 1; ring <= 4; ring++) {
      final ringRadius = radius * ring / 4;
      final path = Path();
      for (int i = 0; i <= sides; i++) {
        final angle = -math.pi / 2 + i * angleStep;
        final x = center.dx + ringRadius * math.cos(angle);
        final y = center.dy + ringRadius * math.sin(angle);
        if (i == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      path.close();
      canvas.drawPath(path, webPaint);
    }

    for (int i = 0; i < sides; i++) {
      final angle = -math.pi / 2 + i * angleStep;
      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);
      canvas.drawLine(center, Offset(x, y), webPaint);
    }
  }

  void _drawLabels(Canvas canvas, Offset center, double radius, int sides, double angleStep) {
    final textPainter = TextPainter(textDirection: TextDirection.ltr);
    final labelRadius = radius + 15;

    for (int i = 0; i < sides; i++) {
      final angle = -math.pi / 2 + i * angleStep;
      final x = center.dx + labelRadius * math.cos(angle);
      final y = center.dy + labelRadius * math.sin(angle);

      textPainter.text = TextSpan(
        text: metrics[i].label,
        style: TextStyle(fontSize: 9, color: Colors.grey[600]),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(x - textPainter.width / 2, y - textPainter.height / 2));
    }
  }

  void _drawDataPolygon(
    Canvas canvas,
    Offset center,
    double radius,
    int sides,
    double angleStep,
    bool isCurrent,
    Color color,
  ) {
    final max = maxValue > 0 ? maxValue : 1;
    final path = Path();
    final fillPaint = Paint()
      ..color = color.withValues(alpha: 0.2)
      ..style = PaintingStyle.fill;
    final strokePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    for (int i = 0; i <= sides; i++) {
      final index = i % sides;
      final value = isCurrent ? metrics[index].currentValue : metrics[index].compareValue;
      final normalizedValue = (value / max).clamp(0.0, 1.0);
      final angle = -math.pi / 2 + index * angleStep;
      final x = center.dx + radius * normalizedValue * math.cos(angle);
      final y = center.dy + radius * normalizedValue * math.sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, strokePaint);

    final dotPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    for (int i = 0; i < sides; i++) {
      final value = isCurrent ? metrics[i].currentValue : metrics[i].compareValue;
      final normalizedValue = (value / max).clamp(0.0, 1.0);
      final angle = -math.pi / 2 + i * angleStep;
      final x = center.dx + radius * normalizedValue * math.cos(angle);
      final y = center.dy + radius * normalizedValue * math.sin(angle);
      canvas.drawCircle(Offset(x, y), 4, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
