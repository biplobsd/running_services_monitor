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

class ServicesVsRamBubbleChart extends StatelessWidget {
  const ServicesVsRamBubbleChart({super.key});

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
            final surfaceContainerHighest = theme.colorScheme.surfaceContainerHighest;
            final onSurface = theme.colorScheme.onSurface;
            final primary = theme.colorScheme.primary;
            final tertiary = theme.colorScheme.tertiary;

            double maxRam = 0;
            double maxServices = 0;

            double sumX = 0;
            double sumY = 0;
            double sumXY = 0;
            double sumX2 = 0;
            double sumY2 = 0;
            int n = 0;

            final scatterData = <({ScatterSpot spot, AppProcessInfo app})>[];

            for (int i = 0; i < apps.length; i++) {
              final app = apps[i];
              final x = app.services.length.toDouble();
              final y = app.totalRamInKb;

              if (y > maxRam) maxRam = y;
              if (x > maxServices) maxServices = x;

              double radius = 4 + (app.processCount > 10 ? 10 : app.processCount).toDouble();

              scatterData.add((
                spot: ScatterSpot(
                  x,
                  y,
                  show: true,
                  dotPainter: FlDotCirclePainter(
                    radius: radius,
                    color: app.isSystemApp == true ? Colors.deepPurpleAccent.withValues(alpha: 0.6) : Colors.blueAccent.withValues(alpha: 0.6),
                    strokeWidth: 0,
                  ),
                ),
                app: app,
              ));

              sumX += x;
              sumY += y;
              sumXY += x * y;
              sumX2 += x * x;
              sumY2 += y * y;
              n++;
            }

            if (maxRam == 0 || n < 2) return const SizedBox.shrink();

            final slope = (n * sumX2 - sumX * sumX) != 0 ? (n * sumXY - sumX * sumY) / (n * sumX2 - sumX * sumX) : 0.0;
            final intercept = (sumY - slope * sumX) / n;

            final numerator = n * sumXY - sumX * sumY;
            final denominator = (n * sumX2 - sumX * sumX) * (n * sumY2 - sumY * sumY);
            final correlation = denominator > 0 ? numerator / math.sqrt(denominator) : 0.0;

            final trendStartY = intercept.clamp(0.0, maxRam * 1.1);
            final trendEndY = (slope * maxServices + intercept).clamp(0.0, maxRam * 1.1);

            return StatsChartCard(
              title: context.loc.statsServicesVsRamCorrelation,
              subtitle: '${context.loc.statsServicesVsRamSubtitle} (r = ${correlation.toStringAsFixed(2)})',
              height: 250,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size.infinite,
                    painter: _TrendLinePainter(
                      startX: 0,
                      startY: trendStartY,
                      endX: maxServices,
                      endY: trendEndY,
                      maxX: maxServices + 1,
                      maxY: maxRam * 1.1,
                      color: tertiary,
                      leftPadding: 0,
                      bottomPadding: 30,
                    ),
                  ),
                  ScatterChart(
                    ScatterChartData(
                      scatterTouchData: ScatterTouchData(
                        touchTooltipData: ScatterTouchTooltipData(
                          getTooltipColor: (spot) => surfaceContainerHighest,
                          getTooltipItems: (ScatterSpot spot) {
                            final matchingData = scatterData.where((d) => d.spot.x == spot.x && (d.spot.y - spot.y).abs() < 0.1).toList();

                            if (matchingData.isNotEmpty) {
                              final app = matchingData.first.app;
                              return ScatterTooltipItem(
                                '${appName(app.packageName)}\n',
                                textStyle: AppStyles.bodyStyle.copyWith(fontWeight: FontWeight.bold, color: onSurface),
                                children: [
                                  TextSpan(
                                    text: 'RAM: ${app.totalRamInKb.formatRam()}\n${context.loc.services}: ${app.services.length}',
                                    style: AppStyles.smallStyle.copyWith(color: primary, fontSize: 12),
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
                      scatterSpots: scatterData.map((d) => d.spot).toList(),
                    ),
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

class _TrendLinePainter extends CustomPainter {
  final double startX;
  final double startY;
  final double endX;
  final double endY;
  final double maxX;
  final double maxY;
  final Color color;
  final double leftPadding;
  final double bottomPadding;

  _TrendLinePainter({
    required this.startX,
    required this.startY,
    required this.endX,
    required this.endY,
    required this.maxX,
    required this.maxY,
    required this.color,
    this.leftPadding = 0,
    this.bottomPadding = 0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final chartWidth = size.width - leftPadding;
    final chartHeight = size.height - bottomPadding;

    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();

    final x1 = leftPadding + ((startX + 0.5) / maxX) * chartWidth;
    final y1 = chartHeight - (startY / maxY) * chartHeight;
    final x2 = leftPadding + ((endX + 0.5) / maxX) * chartWidth;
    final y2 = chartHeight - (endY / maxY) * chartHeight;

    path.moveTo(x1, y1);
    path.lineTo(x2, y2);

    final dashWidth = 8.0;
    final dashSpace = 4.0;
    final totalLength = (Offset(x2, y2) - Offset(x1, y1)).distance;
    final dx = (x2 - x1) / totalLength;
    final dy = (y2 - y1) / totalLength;

    double currentLength = 0;
    final dashPath = Path();
    while (currentLength < totalLength) {
      final segmentLength = math.min(dashWidth, totalLength - currentLength);
      dashPath.moveTo(x1 + dx * currentLength, y1 + dy * currentLength);
      dashPath.lineTo(x1 + dx * (currentLength + segmentLength), y1 + dy * (currentLength + segmentLength));
      currentLength += dashWidth + dashSpace;
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
