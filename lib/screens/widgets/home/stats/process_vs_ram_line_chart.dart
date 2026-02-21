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

class ProcessVsRamLineChart extends StatelessWidget {
  const ProcessVsRamLineChart({super.key});

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

            final sortedApps = List<AppProcessInfo>.from(apps)..sort((a, b) => a.processCount.compareTo(b.processCount));

            final theme = Theme.of(context);
            final dividerColor = theme.dividerColor;
            final primary = theme.colorScheme.primary;
            final secondary = theme.colorScheme.secondary;
            final onSurface = theme.colorScheme.onSurface;
            final surfaceContainerHighest = theme.colorScheme.surfaceContainerHighest;

            double maxRam = 0;
            int maxProcessCount = 0;

            final ramSpots = <FlSpot>[];
            final processSpots = <FlSpot>[];

            for (int i = 0; i < sortedApps.length; i++) {
              final app = sortedApps[i];
              final ramMb = app.totalRamInKb / 1024;

              if (ramMb > maxRam) maxRam = ramMb;
              if (app.processCount > maxProcessCount) maxProcessCount = app.processCount;

              ramSpots.add(FlSpot(i.toDouble(), ramMb));
              processSpots.add(FlSpot(i.toDouble(), app.processCount.toDouble()));
            }

            if (maxRam == 0) return const SizedBox.shrink();

            final processScale = maxRam / (maxProcessCount > 0 ? maxProcessCount : 1);

            final scaledProcessSpots = processSpots.map((spot) => FlSpot(spot.x, spot.y * processScale)).toList();

            return StatsChartCard(
              title: context.loc.statsProcessVsRamLine,
              subtitle: context.loc.statsProcessVsRamLineSubtitle,
              height: 220,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: false,
                    getDrawingHorizontalLine: (value) => FlLine(color: dividerColor.withValues(alpha: 0.2)),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        getTitlesWidget: (val, meta) => Text('${val.toInt()}M', style: AppStyles.smallStyle.copyWith(fontSize: 10)),
                      ),
                    ),
                    bottomTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 35,
                        getTitlesWidget: (val, meta) {
                          final processVal = val / processScale;
                          return Text(
                            processVal.toInt().toString(),
                            style: AppStyles.smallStyle.copyWith(fontSize: 10, color: secondary),
                          );
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  minX: 0,
                  maxX: (sortedApps.length - 1).toDouble(),
                  minY: 0,
                  maxY: maxRam * 1.1,
                  lineBarsData: [
                    LineChartBarData(
                      spots: ramSpots,
                      isCurved: true,
                      color: primary,
                      barWidth: 2,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(show: true, color: primary.withValues(alpha: 0.2)),
                    ),
                    LineChartBarData(
                      spots: scaledProcessSpots,
                      isCurved: true,
                      color: secondary,
                      barWidth: 2,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      dashArray: [5, 5],
                    ),
                  ],
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipColor: (spot) => surfaceContainerHighest,
                      getTooltipItems: (touchedSpots) {
                        return touchedSpots.map((spot) {
                          final index = spot.x.toInt();
                          if (index >= 0 && index < sortedApps.length) {
                            final app = sortedApps[index];
                            if (spot.barIndex == 0) {
                              return LineTooltipItem(
                                '${appName(app.packageName)}\n',
                                AppStyles.bodyStyle.copyWith(fontWeight: FontWeight.bold, color: onSurface),
                                children: [
                                  TextSpan(
                                    text: 'RAM: ${spot.y.toStringAsFixed(1)} MB',
                                    style: AppStyles.smallStyle.copyWith(color: primary),
                                  ),
                                ],
                              );
                            } else {
                              return LineTooltipItem('Processes: ${app.processCount}', AppStyles.smallStyle.copyWith(color: secondary));
                            }
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
}
