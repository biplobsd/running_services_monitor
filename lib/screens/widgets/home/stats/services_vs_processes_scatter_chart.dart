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
import 'stats_chart_card.dart';

class ServicesVsProcessesScatterChart extends StatelessWidget {
  const ServicesVsProcessesScatterChart({super.key});

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

            final points = apps.where((a) => a.processCount > 0 || a.services.isNotEmpty).map((app) {
              return (x: app.processCount.toDouble(), y: app.services.length.toDouble(), app: app);
            }).toList();

            if (points.isEmpty) return const SizedBox.shrink();

            final maxX = points.map((e) => e.x).reduce(math.max);
            final maxY = points.map((e) => e.y).reduce(math.max);

            final n = points.length;
            final sumX = points.fold(0.0, (sum, p) => sum + p.x);
            final sumY = points.fold(0.0, (sum, p) => sum + p.y);
            final sumXY = points.fold(0.0, (sum, p) => sum + p.x * p.y);
            final sumX2 = points.fold(0.0, (sum, p) => sum + p.x * p.x);
            final sumY2 = points.fold(0.0, (sum, p) => sum + p.y * p.y);

            final numerator = n * sumXY - sumX * sumY;
            final denominator = math.sqrt((n * sumX2 - sumX * sumX) * (n * sumY2 - sumY * sumY));
            final r = denominator != 0 ? numerator / denominator : 0.0;

            final theme = Theme.of(context);
            final textColor = theme.colorScheme.onSurface;
            final surfaceContainerHighest = theme.colorScheme.surfaceContainerHighest;
            final userColor = Colors.blueAccent;
            final systemColor = Colors.deepPurpleAccent;

            return StatsChartCard(
              title: context.loc.statsServicesVsProcesses,
              subtitle: '${context.loc.statsServicesVsProcessesSubtitle}\nCorrelation (r): ${r.toStringAsFixed(2)}',
              child: AspectRatio(
                aspectRatio: 1.2,
                child: ScatterChart(
                  ScatterChartData(
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: true,
                      getDrawingHorizontalLine: (value) => FlLine(color: textColor.withValues(alpha: 0.1), strokeWidth: 1),
                      getDrawingVerticalLine: (value) => FlLine(color: textColor.withValues(alpha: 0.1), strokeWidth: 1),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            if (value % 2 != 0 && value < 10) return const SizedBox.shrink();
                            return Padding(
                              padding: EdgeInsets.only(top: 4),
                              child: Text(value.toInt().toString(), style: AppStyles.captionStyle),
                            );
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          getTitlesWidget: (value, meta) {
                            return Text(value.toInt().toString(), style: AppStyles.captionStyle);
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: true, border: Border.all(color: textColor.withValues(alpha: 0.1))),
                    scatterSpots: [
                      ...points.map((p) {
                        return ScatterSpot(
                          p.x,
                          p.y,
                          dotPainter: FlDotCirclePainter(
                            color: (p.app.isSystemApp ?? false) ? systemColor.withValues(alpha: 0.6) : userColor.withValues(alpha: 0.6),
                            radius: 4.0,
                            strokeWidth: 0,
                          ),
                        );
                      }),
                    ],
                    minX: 0,
                    maxX: maxX * 1.05,
                    minY: 0,
                    maxY: maxY * 1.05,
                    scatterTouchData: ScatterTouchData(
                      touchTooltipData: ScatterTouchTooltipData(
                        getTooltipColor: (spot) => surfaceContainerHighest,
                        getTooltipItems: (ScatterSpot spot) {
                          final p = points.firstWhere((e) => e.x == spot.x && e.y == spot.y);
                          return ScatterTooltipItem(
                            '${appName(p.app.packageName)}\n',
                            textStyle: AppStyles.bodyStyle.copyWith(fontWeight: FontWeight.bold, color: textColor),
                            children: [
                              TextSpan(
                                text: 'Processes: ${spot.x.toInt()}\nServices: ${spot.y.toInt()}',
                                style: AppStyles.smallStyle.copyWith(color: theme.colorScheme.primary, fontSize: 12),
                              ),
                            ],
                          );
                        },
                      ),
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
}
