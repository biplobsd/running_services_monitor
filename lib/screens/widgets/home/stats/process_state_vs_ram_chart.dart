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

class ProcessStateVsRamChart extends StatelessWidget {
  const ProcessStateVsRamChart({super.key});

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

            final stateGroups = <String, List<AppProcessInfo>>{};
            for (final app in apps) {
              String state = app.processState?.toUpperCase() ?? 'UNK';
              if (state.trim().isEmpty) state = 'UNK';

              stateGroups.putIfAbsent(state, () => []).add(app);
            }

            final data = stateGroups.entries.map((entry) {
              final totalRam = entry.value.fold(0.0, (sum, app) => sum + app.totalRamInKb);
              final avgRam = entry.value.isNotEmpty ? totalRam / entry.value.length : 0.0;
              final sortedApps = List<AppProcessInfo>.from(entry.value)..sort((a, b) => b.totalRamInKb.compareTo(a.totalRamInKb));
              return (state: entry.key, avgRam: avgRam, count: entry.value.length, topApps: sortedApps.take(3).toList());
            }).toList();

            data.sort((a, b) => b.avgRam.compareTo(a.avgRam));

            final topData = data.take(6).toList();

            if (topData.isEmpty) return const SizedBox.shrink();

            final theme = Theme.of(context);
            final textColor = theme.colorScheme.onSurface;
            final surfaceContainerHighest = theme.colorScheme.surfaceContainerHighest;
            final maxRam = topData.first.avgRam;

            if (maxRam <= 0) return const SizedBox.shrink();

            final colors = [Colors.blue, Colors.teal, Colors.orange, Colors.purple, Colors.redAccent, Colors.cyan];

            return StatsChartCard(
              title: context.loc.statsProcessStateRam,
              subtitle: context.loc.statsProcessStateRamSubtitle,
              child: AspectRatio(
                aspectRatio: 1.5,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: maxRam * 1.1,
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipColor: (group) => surfaceContainerHighest,
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          final item = topData[groupIndex];
                          final topAppsText = item.topApps.map((a) => appName(a.packageName)).take(2).join(', ');
                          return BarTooltipItem(
                            '${item.state}\n',
                            AppStyles.bodyStyle.copyWith(fontWeight: FontWeight.bold, color: textColor),
                            children: [
                              TextSpan(
                                text: 'Avg: ${FormatUtils.formatRam(item.avgRam)}\nApps: ${item.count}\n',
                                style: AppStyles.smallStyle.copyWith(color: theme.colorScheme.primary, fontSize: 12),
                              ),
                              if (topAppsText.isNotEmpty)
                                TextSpan(
                                  text: 'Top: $topAppsText',
                                  style: AppStyles.smallStyle.copyWith(color: theme.colorScheme.secondary, fontSize: 10),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            if (value.toInt() >= topData.length) return const SizedBox.shrink();
                            return Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: Text(topData[value.toInt()].state, style: AppStyles.captionStyle.copyWith(fontWeight: FontWeight.bold)),
                            );
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 40,
                          getTitlesWidget: (value, meta) {
                            if (value == 0) return const SizedBox.shrink();
                            return Text(
                              FormatUtils.formatRam(value, decimalPlaces: 0).replaceAll(' MB', ''),
                              style: AppStyles.captionStyle.copyWith(fontSize: 10),
                            );
                          },
                        ),
                      ),
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      horizontalInterval: maxRam / 5,
                      getDrawingHorizontalLine: (value) => FlLine(color: textColor.withValues(alpha: 0.05), strokeWidth: 1),
                    ),
                    borderData: FlBorderData(show: false),
                    barGroups: topData.asMap().entries.map((entry) {
                      final idx = entry.key;
                      final item = entry.value;
                      return BarChartGroupData(
                        x: idx,
                        barRods: [
                          BarChartRodData(
                            toY: item.avgRam,
                            color: colors[idx % colors.length],
                            width: 20,
                            borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
                          ),
                        ],
                      );
                    }).toList(),
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
