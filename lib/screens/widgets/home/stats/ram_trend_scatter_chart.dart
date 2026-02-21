import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/app_info_bloc/app_info_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/app_info_state_model.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/utils/format_utils.dart';
import 'stats_chart_card.dart';

class RamTrendScatterChart extends StatelessWidget {
  const RamTrendScatterChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppInfoBloc, AppInfoState, Map<String, CachedAppInfo>>(
      bloc: getIt<AppInfoBloc>(),
      selector: (state) => state.value.cachedApps,
      builder: (context, cachedApps) {
        String appName(String packageName) {
          return cachedApps[packageName]?.appName ?? packageName;
        }

        return BlocSelector<HomeBloc, HomeState, List<AppProcessInfo>>(
          selector: (state) => state.value.allApps,
          builder: (context, apps) {
            if (apps.isEmpty) return const SizedBox.shrink();

            final theme = Theme.of(context);
            final dividerColor = theme.dividerColor;
            final primary = theme.colorScheme.primary;
            final tertiary = theme.colorScheme.tertiary;
            final onSurface = theme.colorScheme.onSurface;
            final surfaceContainerHighest = theme.colorScheme.surfaceContainerHighest;

            double maxServices = 0;
            double maxRam = 0;

            double sumX = 0;
            double sumY = 0;
            double sumXY = 0;
            double sumX2 = 0;
            int n = 0;

            final scatterData = <({FlSpot spot, AppProcessInfo app})>[];

            for (final app in apps) {
              final x = app.services.length.toDouble();
              final y = app.totalRamInKb / 1024;

              if (x > maxServices) maxServices = x;
              if (y > maxRam) maxRam = y;

              scatterData.add((spot: FlSpot(x, y), app: app));

              sumX += x;
              sumY += y;
              sumXY += x * y;
              sumX2 += x * x;
              n++;
            }

            if (maxRam == 0 || n < 2) return const SizedBox.shrink();

            final slope = (n * sumXY - sumX * sumY) / (n * sumX2 - sumX * sumX);
            final intercept = (sumY - slope * sumX) / n;

            final trendLine = <FlSpot>[
              FlSpot(0, intercept.clamp(0, maxRam * 1.1)),
              FlSpot(maxServices, (slope * maxServices + intercept).clamp(0, maxRam * 1.1)),
            ];

            final correlation = _calculateCorrelation(apps);
            final correlationText = 'r = ${correlation.toStringAsFixed(2)}';

            return StatsChartCard(
              title: context.loc.statsRamTrendScatter,
              subtitle: '${context.loc.statsRamTrendScatterSubtitle} ($correlationText)',
              height: 250,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: true,
                    getDrawingHorizontalLine: (value) => FlLine(color: dividerColor.withValues(alpha: 0.2)),
                    getDrawingVerticalLine: (value) => FlLine(color: dividerColor.withValues(alpha: 0.2)),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    leftTitles: AxisTitles(
                      axisNameWidget: Text('RAM (MB)', style: AppStyles.captionStyle.copyWith(fontSize: 10)),
                      sideTitles: const SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      axisNameWidget: Text(context.loc.services, style: AppStyles.captionStyle.copyWith(fontSize: 10)),
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 25,
                        getTitlesWidget: (val, meta) => Text(val.toInt().toString(), style: AppStyles.smallStyle.copyWith(fontSize: 10)),
                      ),
                    ),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(show: false),
                  minX: -0.5,
                  maxX: maxServices + 1,
                  minY: 0,
                  maxY: maxRam * 1.1,
                  lineBarsData: [
                    LineChartBarData(
                      spots: scatterData.map((e) => e.spot).toList(),
                      isCurved: false,
                      color: Colors.transparent,
                      barWidth: 0,
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, bar, index) {
                          return FlDotCirclePainter(radius: 5, color: primary.withValues(alpha: 0.6), strokeWidth: 0);
                        },
                      ),
                    ),
                    LineChartBarData(spots: trendLine, isCurved: false, color: tertiary, barWidth: 2, dotData: const FlDotData(show: false), dashArray: [8, 4]),
                  ],
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipColor: (spot) => surfaceContainerHighest,
                      getTooltipItems: (touchedSpots) {
                        return touchedSpots.map((spot) {
                          if (spot.barIndex == 0) {
                            final data = scatterData.firstWhere((e) => e.spot.x == spot.x && (e.spot.y - spot.y).abs() < 0.1, orElse: () => scatterData.first);
                            return LineTooltipItem(
                              '${appName(data.app.packageName)}\n',
                              AppStyles.bodyStyle.copyWith(fontWeight: FontWeight.bold, color: onSurface),
                              children: [
                                TextSpan(
                                  text: '${context.loc.services}: ${spot.x.toInt()}\nRAM: ${(spot.y * 1024).formatRam()}',
                                  style: AppStyles.smallStyle.copyWith(color: primary, fontSize: 12),
                                ),
                              ],
                            );
                          }
                          return null;
                        }).toList();
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  double _calculateCorrelation(List<AppProcessInfo> apps) {
    if (apps.length < 2) return 0;

    final n = apps.length;
    double sumX = 0, sumY = 0, sumXY = 0, sumX2 = 0, sumY2 = 0;

    for (final app in apps) {
      final x = app.services.length.toDouble();
      final y = app.totalRamInKb;
      sumX += x;
      sumY += y;
      sumXY += x * y;
      sumX2 += x * x;
      sumY2 += y * y;
    }

    final numerator = n * sumXY - sumX * sumY;
    final denominator = (n * sumX2 - sumX * sumX) * (n * sumY2 - sumY * sumY);

    if (denominator <= 0) return 0;

    return numerator / math.sqrt(denominator.abs());
  }
}
