import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/meminfo_data.dart';
import 'package:running_services_monitor/screens/widgets/meminfo/meminfo_chart_data.dart';
import 'package:running_services_monitor/utils/format_utils.dart';

class MemInfoCompareRadarChart extends StatefulWidget {
  final MemInfoData currentData;
  final MemInfoData comparisonData;
  final String currentLabel;
  final String compareLabel;

  const MemInfoCompareRadarChart({super.key, required this.currentData, required this.comparisonData, required this.currentLabel, required this.compareLabel});

  @override
  State<MemInfoCompareRadarChart> createState() => _MemInfoCompareRadarChartState();
}

class _MemInfoCompareRadarChartState extends State<MemInfoCompareRadarChart> {
  bool showPss = true;

  @override
  Widget build(BuildContext context) {
    final metrics = showPss
        ? MemInfoChartData.buildPssMetrics(widget.currentData.appSummary, widget.comparisonData.appSummary, context.loc)
        : MemInfoChartData.buildRssMetrics(widget.currentData.appSummary, widget.comparisonData.appSummary, context.loc);

    final totalPss = MemInfoChartData.getTotalPss(widget.currentData.appSummary, widget.comparisonData.appSummary, context.loc);
    final totalRss = MemInfoChartData.getTotalRss(widget.currentData.appSummary, widget.comparisonData.appSummary, context.loc);

    final maxValue = metrics.expand((m) => [m.currentValue, m.compareValue]).reduce((a, b) => a > b ? a : b);

    if (maxValue == 0) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final primary = colorScheme.primary;
    final secondary = colorScheme.secondary;
    final onPrimary = colorScheme.onPrimary;
    final onSurface = colorScheme.onSurface;
    final dividerColor = theme.dividerColor;

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
          Text(context.loc.memoryProfileComparison, style: AppStyles.titleStyle.copyWith(fontWeight: FontWeight.bold)),
          AppStyles.spacingH8,
          Row(
            children: [
              _LegendDot(color: primary, label: widget.currentLabel),
              AppStyles.spacing16,
              _LegendDot(color: secondary, label: widget.compareLabel),
            ],
          ),
          AppStyles.spacingH16,
          _buildTotalComparison(context, totalPss, totalRss),
          AppStyles.spacingH16,
          Container(
            decoration: BoxDecoration(color: colorScheme.surfaceContainerHigh, borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => showPss = true),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(color: showPss ? primary : Colors.transparent, borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        'PSS',
                        textAlign: TextAlign.center,
                        style: AppStyles.bodyStyle.copyWith(fontWeight: FontWeight.w600, color: showPss ? onPrimary : onSurface),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => showPss = false),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(color: !showPss ? primary : Colors.transparent, borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        'RSS',
                        textAlign: TextAlign.center,
                        style: AppStyles.bodyStyle.copyWith(fontWeight: FontWeight.w600, color: !showPss ? onPrimary : onSurface),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          AppStyles.spacingH16,
          SizedBox(
            height: 220,
            child: RadarChart(
              RadarChartData(
                dataSets: [
                  RadarDataSet(
                    fillColor: primary.withValues(alpha: 0.3),
                    borderColor: primary,
                    borderWidth: 2,
                    entryRadius: 3,
                    dataEntries: metrics.map((m) => RadarEntry(value: m.currentValue)).toList(),
                  ),
                  RadarDataSet(
                    fillColor: secondary.withValues(alpha: 0.2),
                    borderColor: secondary,
                    borderWidth: 2,
                    entryRadius: 3,
                    dataEntries: metrics.map((m) => RadarEntry(value: m.compareValue)).toList(),
                  ),
                ],
                radarBackgroundColor: Colors.transparent,
                borderData: FlBorderData(show: false),
                radarBorderData: BorderSide(color: dividerColor.withValues(alpha: 0.3)),
                titlePositionPercentageOffset: 0.2,
                titleTextStyle: AppStyles.smallStyle.copyWith(fontWeight: FontWeight.w500),
                getTitle: (index, angle) {
                  return RadarChartTitle(text: metrics[index].label, angle: angle);
                },
                tickCount: 4,
                ticksTextStyle: TextStyle(fontSize: 8, color: Colors.grey),
                tickBorderData: BorderSide(color: dividerColor.withValues(alpha: 0.2)),
                gridBorderData: BorderSide(color: dividerColor.withValues(alpha: 0.2)),
              ),
            ),
          ),
          AppStyles.spacingH16,
          _buildMetricsTable(context, metrics),
        ],
      ),
    );
  }

  Widget _buildTotalComparison(BuildContext context, MemoryMetric totalPss, MemoryMetric totalRss) {
    final maxValue = [totalPss.currentValue, totalPss.compareValue, totalRss.currentValue, totalRss.compareValue].reduce((a, b) => a > b ? a : b);

    if (maxValue == 0) return const SizedBox.shrink();

    return SizedBox(
      height: 100,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: maxValue * 1.2,
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (group) => Theme.of(context).colorScheme.surfaceContainerHighest,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                final label = groupIndex == 0 ? context.loc.totalPss : context.loc.totalRss;
                return BarTooltipItem('$label\n${rod.toY.formatRam()}', TextStyle(color: Theme.of(context).colorScheme.onSurface, fontSize: 12));
              },
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              drawBelowEverything: true,
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Text(
                      value.toInt() == 0 ? context.loc.totalPss : context.loc.totalRss,
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                    ),
                  );
                },
                reservedSize: 24,
              ),
            ),
            leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(
                  toY: totalPss.currentValue,
                  color: Theme.of(context).colorScheme.primary,
                  width: 18,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                ),
                BarChartRodData(
                  toY: totalPss.compareValue,
                  color: Theme.of(context).colorScheme.secondary,
                  width: 18,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                ),
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  toY: totalRss.currentValue,
                  color: Theme.of(context).colorScheme.primary,
                  width: 18,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                ),
                BarChartRodData(
                  toY: totalRss.compareValue,
                  color: Theme.of(context).colorScheme.secondary,
                  width: 18,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                ),
              ],
            ),
          ],
          gridData: const FlGridData(show: false),
        ),
      ),
    );
  }

  Widget _buildMetricsTable(BuildContext context, List<MemoryMetric> metrics) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final secondary = theme.colorScheme.secondary;

    return Column(
      children: metrics.map((metric) {
        final diff = metric.currentValue - metric.compareValue;
        final diffPercent = metric.compareValue > 0 ? ((diff / metric.compareValue) * 100).abs() : 0.0;
        final isLower = diff < 0;
        final isEqual = diff.abs() < 0.01;

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Row(
            children: [
              Expanded(flex: 2, child: Text(metric.label, style: AppStyles.captionStyle)),
              Expanded(
                flex: 2,
                child: Text(
                  metric.currentValue.formatRam(),
                  style: AppStyles.captionStyle.copyWith(color: primary),
                  textAlign: TextAlign.end,
                ),
              ),
              AppStyles.spacing8,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: isEqual
                      ? Colors.grey.withValues(alpha: 0.2)
                      : isLower
                      ? Colors.green.withValues(alpha: 0.2)
                      : Colors.red.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!isEqual) Icon(isLower ? Icons.arrow_downward : Icons.arrow_upward, size: 10, color: isLower ? Colors.green : Colors.red),
                    SizedBox(width: 2),
                    Text(
                      isEqual ? '=' : '${diffPercent.toStringAsFixed(0)}%',
                      style: AppStyles.smallStyle.copyWith(fontWeight: FontWeight.bold, color: isEqual ? Colors.grey : (isLower ? Colors.green : Colors.red)),
                    ),
                  ],
                ),
              ),
              AppStyles.spacing8,
              Expanded(
                flex: 2,
                child: Text(
                  metric.compareValue.formatRam(),
                  style: AppStyles.captionStyle.copyWith(color: secondary),
                  textAlign: TextAlign.end,
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
          width: 10,
          height: 10,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: 6),
        Text(label, style: AppStyles.captionStyle, overflow: TextOverflow.ellipsis),
      ],
    );
  }
}
