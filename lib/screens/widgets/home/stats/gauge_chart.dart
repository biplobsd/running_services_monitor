import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/system_ram_info.dart';
import 'stats_chart_card.dart';

class GaugeChart extends StatelessWidget {
  const GaugeChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, SystemRamInfo>(
      selector: (state) => state.value.systemRamInfo,
      builder: (context, ramInfo) {
        if (ramInfo.totalRamKb == 0) return const SizedBox.shrink();

        final usagePercent = (ramInfo.usedRamKb / ramInfo.totalRamKb).clamp(0.0, 1.0);
        final theme = Theme.of(context);
        final primaryColor = theme.colorScheme.primary;
        final backgroundColor = theme.dividerColor.withValues(alpha: 0.2);
        final onSurface = theme.colorScheme.onSurface;

        return StatsChartCard(
          title: context.loc.statsGaugeChart,
          subtitle: context.loc.statsGaugeSubtitle,
          child: SizedBox(
            height: 200,
            child: CustomPaint(
              size: Size(double.infinity, 200),
              painter: GaugePainter(
                percentage: usagePercent,
                primaryColor: primaryColor,
                backgroundColor: backgroundColor,
                textStyle: AppStyles.headlineStyle.copyWith(color: onSurface, fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }
}

class GaugePainter extends CustomPainter {
  final double percentage;
  final Color primaryColor;
  final Color backgroundColor;
  final TextStyle textStyle;

  GaugePainter({required this.percentage, required this.primaryColor, required this.backgroundColor, required this.textStyle});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height * 0.8);
    final radius = math.min(size.width, size.height) * 0.7;

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), math.pi, math.pi, false, backgroundPaint);

    Color gaugeColor;
    if (percentage < 0.5) {
      gaugeColor = Colors.green;
    } else if (percentage < 0.75) {
      gaugeColor = Colors.orange;
    } else {
      gaugeColor = Colors.red;
    }

    final progressPaint = Paint()
      ..color = gaugeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), math.pi, math.pi * percentage, false, progressPaint);

    final textSpan = TextSpan(text: '${(percentage * 100).toStringAsFixed(0)}%', style: textStyle);
    final textPainter = TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    textPainter.layout();
    textPainter.paint(canvas, Offset(center.dx - textPainter.width / 2, center.dy - textPainter.height - 10));
  }

  @override
  bool shouldRepaint(covariant GaugePainter oldDelegate) {
    return oldDelegate.percentage != percentage || oldDelegate.textStyle != textStyle;
  }
}
