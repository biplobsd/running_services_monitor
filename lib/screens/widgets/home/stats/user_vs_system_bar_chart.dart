import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/utils/format_utils.dart';
import 'stats_chart_card.dart';

class UserVsSystemBarChart extends StatelessWidget {
  const UserVsSystemBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, List<AppProcessInfo>>(
      selector: (state) => state.value.allApps,
      builder: (context, apps) {
        if (apps.isEmpty) return const SizedBox.shrink();

        final userApps = apps.where((app) => app.isSystemApp != true).toList();
        final systemApps = apps.where((app) => app.isSystemApp == true).toList();

        final userCount = userApps.length;
        final systemCount = systemApps.length;

        final userRam = userApps.fold<double>(0, (sum, app) => sum + app.totalRamInKb);
        final systemRam = systemApps.fold<double>(0, (sum, app) => sum + app.totalRamInKb);

        final userAvgRam = userCount > 0 ? userRam / userCount : 0.0;
        final systemAvgRam = systemCount > 0 ? systemRam / systemCount : 0.0;

        final theme = Theme.of(context);
        final userColor = Colors.blue;
        final systemColor = Colors.deepPurple;
        final dividerColor = theme.dividerColor;

        final maxCount = (userCount > systemCount ? userCount : systemCount).toDouble();
        final maxRam = (userRam > systemRam ? userRam : systemRam) / 1024;
        final maxAvg = (userAvgRam > systemAvgRam ? userAvgRam : systemAvgRam) / 1024;

        return StatsChartCard(
          title: context.loc.statsUserVsSystemBar,
          subtitle: context.loc.statsUserVsSystemBarSubtitle,
          height: 200,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 100,
              barTouchData: BarTouchData(
                touchTooltipData: BarTouchTooltipData(
                  getTooltipColor: (group) => theme.colorScheme.surfaceContainerHighest,
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    String label;
                    String value;
                    switch (groupIndex) {
                      case 0:
                        label = rodIndex == 0 ? context.loc.user : context.loc.system;
                        value = rodIndex == 0 ? '$userCount' : '$systemCount';
                        break;
                      case 1:
                        label = rodIndex == 0 ? context.loc.user : context.loc.system;
                        value = rodIndex == 0 ? userRam.formatRam() : systemRam.formatRam();
                        break;
                      case 2:
                        label = rodIndex == 0 ? context.loc.user : context.loc.system;
                        value = rodIndex == 0 ? userAvgRam.formatRam() : systemAvgRam.formatRam();
                        break;
                      default:
                        label = '';
                        value = '';
                    }
                    return BarTooltipItem(
                      '$label\n$value',
                      AppStyles.smallStyle.copyWith(color: rodIndex == 0 ? userColor : systemColor, fontWeight: FontWeight.bold),
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
                      String text;
                      switch (value.toInt()) {
                        case 0:
                          text = context.loc.statsAppCount;
                          break;
                        case 1:
                          text = context.loc.statsTotalRam;
                          break;
                        case 2:
                          text = 'Avg RAM';
                          break;
                        default:
                          text = '';
                      }
                      return Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(text, style: AppStyles.captionStyle.copyWith(fontSize: 10)),
                      );
                    },
                    reservedSize: 30,
                  ),
                ),
                leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                getDrawingHorizontalLine: (value) => FlLine(color: dividerColor.withValues(alpha: 0.2)),
              ),
              borderData: FlBorderData(show: false),
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(
                      toY: maxCount > 0 ? (userCount / maxCount) * 100 : 0,
                      color: userColor,
                      width: 20,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                    ),
                    BarChartRodData(
                      toY: maxCount > 0 ? (systemCount / maxCount) * 100 : 0,
                      color: systemColor,
                      width: 20,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 1,
                  barRods: [
                    BarChartRodData(
                      toY: maxRam > 0 ? ((userRam / 1024) / maxRam) * 100 : 0,
                      color: userColor,
                      width: 20,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                    ),
                    BarChartRodData(
                      toY: maxRam > 0 ? ((systemRam / 1024) / maxRam) * 100 : 0,
                      color: systemColor,
                      width: 20,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 2,
                  barRods: [
                    BarChartRodData(
                      toY: maxAvg > 0 ? ((userAvgRam / 1024) / maxAvg) * 100 : 0,
                      color: userColor,
                      width: 20,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                    ),
                    BarChartRodData(
                      toY: maxAvg > 0 ? ((systemAvgRam / 1024) / maxAvg) * 100 : 0,
                      color: systemColor,
                      width: 20,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
