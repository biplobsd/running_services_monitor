import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:m3e_design/theme/m3e_theme.dart';

class ConstrainedWavyProgress extends StatefulWidget {
  final double value;
  final bool animate;
  final Color? activeColor;
  final Color? trackColor;

  const ConstrainedWavyProgress({
    super.key,
    required this.value,
    this.animate = false,
    this.activeColor,
    this.trackColor,
  });

  @override
  State<ConstrainedWavyProgress> createState() => _ConstrainedWavyProgressState();
}

class _ConstrainedWavyProgressState extends State<ConstrainedWavyProgress> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 1200))
      ..addListener(() {
        if (mounted && widget.animate) setState(() {});
      });
    if (widget.animate) {
      controller.repeat();
    }
  }

  @override
  void didUpdateWidget(covariant ConstrainedWavyProgress oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate) {
      if (!controller.isAnimating) controller.repeat();
    } else {
      if (controller.isAnimating) controller.stop();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final m3e = theme.extension<M3ETheme>() ?? M3ETheme.defaults(theme.colorScheme);

    final active = widget.activeColor ?? m3e.colors.primary;
    final track = widget.trackColor ?? m3e.colors.surfaceContainerHighest;

    const trackHeight = 8.0;
    const waveAmplitude = 3.0;
    const wavePeriod = 40.0;
    const gap = 4.0;
    const dotDiameter = 4.0;
    const dotOffset = 2.0;
    const trailingMargin = 14.0;
    const inset = 4.0;

    final totalHeight = trackHeight + 2 * waveAmplitude;
    final phaseValue = widget.animate ? controller.value * 2 * math.pi : 0.0;

    return RepaintBoundary(
      child: SizedBox(
        height: totalHeight,
        width: double.infinity,
        child: CustomPaint(
          painter: _WavyPainter(
            value: widget.value,
            active: active,
            track: track,
            phase: phaseValue,
            trackHeight: trackHeight,
            waveAmplitude: waveAmplitude,
            wavePeriod: wavePeriod,
            gap: gap,
            dotDiameter: dotDiameter,
            dotOffset: dotOffset,
            trailingMargin: trailingMargin,
            inset: inset,
          ),
        ),
      ),
    );
  }
}

class _WavyPainter extends CustomPainter {
  final double value;
  final Color active;
  final Color track;
  final double phase;
  final double trackHeight;
  final double waveAmplitude;
  final double wavePeriod;
  final double gap;
  final double dotDiameter;
  final double dotOffset;
  final double trailingMargin;
  final double inset;

  _WavyPainter({
    required this.value,
    required this.active,
    required this.track,
    required this.phase,
    required this.trackHeight,
    required this.waveAmplitude,
    required this.wavePeriod,
    required this.gap,
    required this.dotDiameter,
    required this.dotOffset,
    required this.trailingMargin,
    required this.inset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final left = inset;
    final right = size.width - trailingMargin;
    final width = math.max(0.0, right - left);
    final cy = size.height / 2;

    final base = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = trackHeight
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true;

    final double p = value.clamp(0.0, 1.0);
    final double activeEndX = left + width * p;
    final double trackStartX = math.min(right, activeEndX + gap);

    canvas.drawLine(Offset(trackStartX, cy), Offset(right, cy), base..color = track);

    final start = left;
    final end = activeEndX;
    final path = Path();
    const step = 1.5;
    final k = 2 * math.pi / wavePeriod;

    double x = start;
    double y = cy + waveAmplitude * math.sin(phase + (x - start) * k);
    path.moveTo(x, y);
    for (x = start + step; x <= end; x += step) {
      y = cy + waveAmplitude * math.sin(phase + (x - start) * k);
      path.lineTo(x, y);
    }
    y = cy + waveAmplitude * math.sin(phase + (end - start) * k);
    path.lineTo(end, y);

    canvas.drawPath(
      path,
      base
        ..color = active
        ..strokeWidth = trackHeight,
    );

    final dotCenterX = math.max(left, right - dotOffset);
    canvas.drawCircle(Offset(dotCenterX, cy), dotDiameter / 2, Paint()..color = active);
  }

  @override
  bool shouldRepaint(covariant _WavyPainter old) =>
      value != old.value || active != old.active || track != old.track || phase != old.phase;
}
