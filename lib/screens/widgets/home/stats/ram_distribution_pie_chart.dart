import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/bloc/stats_bloc/stats_bloc.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/system_ram_info.dart';
import 'chart_indicator.dart';
import 'stats_chart_card.dart';

class RamDistributionPieChart extends StatelessWidget {
  const RamDistributionPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<StatsBloc, StatsState, int>(
      selector: (state) => state.ramDistributionTouchedIndex,
      builder: (context, touchedIndex) {
        return BlocSelector<HomeBloc, HomeState, SystemRamInfo>(
          selector: (state) => state.value.systemRamInfo,
          builder: (context, ramInfo) {
            if (ramInfo.totalRamKb == 0) return const SizedBox.shrink();

            final used = ramInfo.usedRamKb;
            final free = ramInfo.freeRamKb;
            final zram = ramInfo.zramTotalSwapKb;

            final List<PieChartSectionData> sections = [
              PieChartSectionData(
                color: Colors.redAccent,
                value: used,
                title: '${(used / 1024 / 1024).toStringAsFixed(1)} GB',
                radius: touchedIndex == 0 ? 60 : 50,
                titleStyle: AppStyles.smallStyle.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              PieChartSectionData(
                color: Colors.greenAccent,
                value: free,
                title: '${(free / 1024 / 1024).toStringAsFixed(1)} GB',
                radius: touchedIndex == 1 ? 60 : 50,
                titleStyle: AppStyles.smallStyle.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              if (zram > 0)
                PieChartSectionData(
                  color: Colors.orangeAccent,
                  value: zram,
                  title: '${(zram / 1024 / 1024).toStringAsFixed(1)} GB',
                  radius: touchedIndex == 2 ? 60 : 50,
                  titleStyle: AppStyles.smallStyle.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                ),
            ];

            return StatsChartCard(
              title: context.loc.statsRamDistributionPie,
              subtitle: context.loc.statsRamDistributionSubtitle,
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: PieChart(
                      PieChartData(
                        pieTouchData: PieTouchData(
                          touchCallback: (FlTouchEvent event, pieTouchResponse) {
                            if (!event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                              context.read<StatsBloc>().add(const StatsEvent.updateChartTouchIndex(chartType: 'ramDistribution', index: -1));
                              return;
                            }
                            context.read<StatsBloc>().add(
                              StatsEvent.updateChartTouchIndex(chartType: 'ramDistribution', index: pieTouchResponse.touchedSection!.touchedSectionIndex),
                            );
                          },
                        ),
                        borderData: FlBorderData(show: false),
                        sectionsSpace: 2,
                        centerSpaceRadius: 40,
                        sections: sections,
                      ),
                    ),
                  ),
                  AppStyles.spacingH16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ChartIndicator(color: Colors.redAccent, text: context.loc.statsUsed, isSelected: touchedIndex == 0),
                      ChartIndicator(color: Colors.greenAccent, text: context.loc.statsFree, isSelected: touchedIndex == 1),
                      if (zram > 0) ChartIndicator(color: Colors.orangeAccent, text: context.loc.statsZram, isSelected: touchedIndex == 2),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
