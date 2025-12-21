import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/models/meminfo_data.dart';
import 'package:running_services_monitor/utils/format_utils.dart';

class MemInfoCompareBarChart extends StatelessWidget {
  final MemInfoData currentData;
  final MemInfoData comparisonData;
  final String currentLabel;
  final String compareLabel;

  const MemInfoCompareBarChart({
    super.key,
    required this.currentData,
    required this.comparisonData,
    required this.currentLabel,
    required this.compareLabel,
  });

  @override
  Widget build(BuildContext context) {
    final metrics = _buildMetrics();
    final maxValue = metrics.expand((m) => [m.currentValue, m.compareValue]).reduce((a, b) => a > b ? a : b);

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
            'Memory Comparison',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              _LegendItem(color: Theme.of(context).colorScheme.primary, label: currentLabel),
              SizedBox(width: 16.w),
              _LegendItem(color: Theme.of(context).colorScheme.secondary, label: compareLabel),
            ],
          ),
          SizedBox(height: 16.h),
          ...metrics.map(
            (metric) => _MetricBarRow(
              metric: metric,
              maxValue: maxValue,
              primaryColor: Theme.of(context).colorScheme.primary,
              secondaryColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }

  List<_CompareMetric> _buildMetrics() {
    final current = currentData.appSummary;
    final compare = comparisonData.appSummary;

    return [
      _CompareMetric('Java Heap', current?.javaHeapPss.toDouble() ?? 0, compare?.javaHeapPss.toDouble() ?? 0),
      _CompareMetric('Native Heap', current?.nativeHeapPss.toDouble() ?? 0, compare?.nativeHeapPss.toDouble() ?? 0),
      _CompareMetric('Code', current?.codePss.toDouble() ?? 0, compare?.codePss.toDouble() ?? 0),
      _CompareMetric('Graphics', current?.graphicsPss.toDouble() ?? 0, compare?.graphicsPss.toDouble() ?? 0),
      _CompareMetric('Stack', current?.stackPss.toDouble() ?? 0, compare?.stackPss.toDouble() ?? 0),
    ];
  }
}

class _CompareMetric {
  final String label;
  final double currentValue;
  final double compareValue;

  _CompareMetric(this.label, this.currentValue, this.compareValue);
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12.w,
          height: 12.w,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(3.rSafe)),
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

class _MetricBarRow extends StatelessWidget {
  final _CompareMetric metric;
  final double maxValue;
  final Color primaryColor;
  final Color secondaryColor;

  const _MetricBarRow({
    required this.metric,
    required this.maxValue,
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final currentWidth = maxValue > 0 ? (metric.currentValue / maxValue) : 0.0;
    final compareWidth = maxValue > 0 ? (metric.compareValue / maxValue) : 0.0;

    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                metric.label,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  Text(
                    formatRam(metric.currentValue),
                    style: TextStyle(fontSize: 10.sp, color: primaryColor, fontWeight: FontWeight.w600),
                  ),
                  Text(' / ', style: TextStyle(fontSize: 10.sp)),
                  Text(
                    formatRam(metric.compareValue),
                    style: TextStyle(fontSize: 10.sp, color: secondaryColor, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Stack(
            children: [
              Container(
                height: 8.h,
                decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(4.rSafe),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        FractionallySizedBox(
                          widthFactor: math.min(1.0, compareWidth),
                          child: Container(
                            height: 8.h,
                            decoration: BoxDecoration(
                              color: secondaryColor.withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(4.rSafe),
                            ),
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor: math.min(1.0, currentWidth),
                          child: Container(
                            height: 8.h,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [primaryColor, primaryColor.withValues(alpha: 0.7)]),
                              borderRadius: BorderRadius.circular(4.rSafe),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
