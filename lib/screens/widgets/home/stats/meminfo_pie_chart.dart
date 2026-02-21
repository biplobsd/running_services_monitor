import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/models/meminfo_data.dart';
import 'package:running_services_monitor/screens/widgets/home/stats/stats_chart_card.dart';
import 'package:running_services_monitor/screens/widgets/meminfo/meminfo_chart_data.dart';
import 'package:running_services_monitor/utils/format_utils.dart';

class MemInfoPieChart extends StatelessWidget {
  final AppSummary summary;

  const MemInfoPieChart({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    final segments = MemInfoChartData.buildSegments(summary);
    final segmentsTotal = MemInfoChartData.getSegmentsTotal(segments);

    if (segmentsTotal == 0) return const SizedBox.shrink();

    return StatsChartCard(
      title: 'Memory Distribution',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 2,
                    centerSpaceRadius: 0,
                    sections: segments.where((s) => s.value > 0).map((segment) {
                      final percentage = (segment.value / segmentsTotal * 100);
                      return PieChartSectionData(
                        color: segment.color,
                        value: segment.value,
                        title: percentage > 10 ? '${percentage.toStringAsFixed(0)}%' : '',
                        radius: 60,
                        titleStyle: AppStyles.smallStyle.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                      );
                    }).toList(),
                  ),
                ),
              ),
              AppStyles.spacing16,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: segments.where((s) => s.value > 0).map((segment) {
                    final percentage = (segment.value / segmentsTotal * 100).toStringAsFixed(1);
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
          SizedBox(height: 12),
          Center(
            child: Text(
              'Total PSS: ${summary.totalPss.formatRam()}',
              style: AppStyles.bodyStyle.copyWith(fontSize: 13, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}
