import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/bloc/app_info_bloc/app_info_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/app_info_state_model.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/utils/format_utils.dart';
import 'stats_chart_card.dart';

class ServicesVsRamBubbleChart extends StatelessWidget {
  const ServicesVsRamBubbleChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppInfoBloc, AppInfoState, Map<String, CachedAppInfo>>(
      bloc: getIt<AppInfoBloc>(),
      selector: (state) {
        return state.value.cachedApps;
      },
      builder: (context, cachedApps) {
        String appName(String packageName) {
          return cachedApps[packageName]?.appName ?? packageName;
        }

        return BlocSelector<HomeBloc, HomeState, List<AppProcessInfo>>(
          selector: (state) => state.value.allApps,
          builder: (context, apps) {
            if (apps.isEmpty) return const SizedBox.shrink();

            List<ScatterSpot> spots = [];
            double maxRam = 0;
            double maxServices = 0;

            final theme = Theme.of(context);
            final dividerColor = theme.dividerColor;
            final surfaceContainerHighest = theme.colorScheme.surfaceContainerHighest;
            final onSurface = theme.colorScheme.onSurface;
            final primary = theme.colorScheme.primary;

            for (int i = 0; i < apps.length; i++) {
              final app = apps[i];
              if (app.totalRamInKb > maxRam) maxRam = app.totalRamInKb;
              if (app.services.length > maxServices) maxServices = app.services.length.toDouble();

              double radius = 4 + (app.processCount > 10 ? 10 : app.processCount).toDouble();

              spots.add(
                ScatterSpot(
                  app.services.length.toDouble(),
                  app.totalRamInKb,
                  show: true,
                  dotPainter: FlDotCirclePainter(
                    radius: radius,
                    color: app.isSystemApp == true ? Colors.deepPurpleAccent.withValues(alpha: 0.6) : Colors.blueAccent.withValues(alpha: 0.6),
                    strokeWidth: 0,
                  ),
                ),
              );
            }

            return StatsChartCard(
              title: context.loc.statsServicesVsRamCorrelation,
              subtitle: context.loc.statsServicesVsRamSubtitle,
              height: 250.h,
              child: ScatterChart(
                ScatterChartData(
                  scatterTouchData: ScatterTouchData(
                    touchTooltipData: ScatterTouchTooltipData(
                      getTooltipColor: (spot) => surfaceContainerHighest,
                      getTooltipItems: (ScatterSpot spot) {
                        final matchingApps = apps.where((app) => app.services.length.toDouble() == spot.x && (app.totalRamInKb - spot.y).abs() < 0.1).toList();

                        if (matchingApps.isNotEmpty) {
                          final app = matchingApps.first;
                          return ScatterTooltipItem(
                            '${appName(app.packageName)}\n',
                            textStyle: AppStyles.bodyStyle.copyWith(fontWeight: FontWeight.bold, color: onSurface),
                            children: [
                              TextSpan(
                                text: 'RAM: ${app.totalRamInKb.formatRam()}\n${context.loc.services}: ${app.services.length}',
                                style: AppStyles.smallStyle.copyWith(color: primary, fontSize: 12.sp),
                              ),
                            ],
                          );
                        }
                        return null;
                      },
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: true,
                    getDrawingHorizontalLine: (value) => FlLine(color: dividerColor.withValues(alpha: 0.2)),
                    getDrawingVerticalLine: (value) => FlLine(color: dividerColor.withValues(alpha: 0.2)),
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (val, meta) => Text(val.toInt().toString(), style: const TextStyle(fontSize: 10)),
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
                  scatterSpots: spots.map((s) => s).toList(), // Copy list
                ),
              ),
            );
          },
        );
      },
    );
  }
}
