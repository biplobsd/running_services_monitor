import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'stats_chart_card.dart';

class PolarChart extends StatelessWidget {
  const PolarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, List<AppProcessInfo>>(
      selector: (state) => state.value.allApps,
      builder: (context, apps) {
        if (apps.isEmpty) return const SizedBox.shrink();

        int activeCount = apps.where((app) => app.isActive).length;
        int cachedCount = apps.where((app) => app.isCached).length;
        int serviceCount = apps.where((app) => app.hasServices).length;

        final data = [
          (context.loc.statsActive, activeCount, Colors.teal),
          (context.loc.services, serviceCount, Colors.amber),
          (context.loc.statsCached, cachedCount, Colors.grey),
        ];

        final maxValue = data.map((e) => e.$2).reduce((a, b) => a > b ? a : b).toDouble();
        if (maxValue == 0) return const SizedBox.shrink();

        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;
        final dividerColor = theme.dividerColor;

        return StatsChartCard(
          title: context.loc.statsPolarChart,
          subtitle: context.loc.statsPolarSubtitle,
          height: 280,
          child: RadarChart(
            RadarChartData(
              dataSets: [
                RadarDataSet(
                  fillColor: colorScheme.primary.withValues(alpha: 0.3),
                  borderColor: colorScheme.primary,
                  borderWidth: 2,
                  entryRadius: 4,
                  dataEntries: data.map((e) => RadarEntry(value: e.$2.toDouble())).toList(),
                ),
              ],
              radarBackgroundColor: Colors.transparent,
              borderData: FlBorderData(show: false),
              radarBorderData: BorderSide(color: dividerColor.withValues(alpha: 0.3)),
              titlePositionPercentageOffset: 0.2,
              titleTextStyle: AppStyles.captionStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 12),
              getTitle: (index, angle) {
                return RadarChartTitle(text: '${data[index].$1}\n(${data[index].$2})', angle: angle);
              },
              tickCount: 4,
              ticksTextStyle: AppStyles.smallStyle.copyWith(color: Colors.grey),
              tickBorderData: BorderSide(color: dividerColor.withValues(alpha: 0.2)),
              gridBorderData: BorderSide(color: dividerColor.withValues(alpha: 0.2)),
            ),
          ),
        );
      },
    );
  }
}
