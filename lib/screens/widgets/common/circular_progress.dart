import 'dart:math' as math;

import 'package:flutter/material.dart';

class CircularProgress extends StatefulWidget {
  final double? value;
  final Color? activeColor;
  final Color? trackColor;

  const CircularProgress({super.key, this.value, this.activeColor, this.trackColor});

  @override
  State<CircularProgress> createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress> with SingleTickerProviderStateMixin {
  late final AnimationController rotationController;

  bool get isIndeterminate => widget.value == null;

  @override
  void initState() {
    super.initState();
    rotationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 3600));
    if (isIndeterminate) {
      rotationController.repeat();
    }
  }

  @override
  void didUpdateWidget(covariant CircularProgress oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (isIndeterminate && !rotationController.isAnimating) {
      rotationController.repeat();
    } else if (!isIndeterminate && rotationController.isAnimating) {
      rotationController.stop();
    }
  }

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final active = widget.activeColor ?? colorScheme.primary;
    final track = widget.trackColor ?? colorScheme.surfaceContainerHighest;

    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: rotationController,
        builder: (context, child) {
          final rotation = isIndeterminate ? rotationController.value * 2 * math.pi : 0.0;
          return CustomPaint(
            painter: _CircularWavyPainter(value: widget.value, active: active, track: track, rotation: rotation),
            child: const SizedBox.expand(),
          );
        },
      ),
    );
  }
}

class _CircularWavyPainter extends CustomPainter {
  final double? value;
  final Color active;
  final Color track;
  final double rotation;

  _CircularWavyPainter({required this.value, required this.active, required this.track, required this.rotation});

  @override
  void paint(Canvas canvas, Size s) {
    const stroke = 4.0;
    final center = s.center(Offset.zero);
    final baseRadius = (math.min(s.width, s.height) - stroke) / 2;

    final amp = 2.0;
    final scallopLen = 18.0;
    final taperLen = scallopLen / 2;

    final activeSweep = value == null ? math.pi * 2 : (value!.clamp(0.0, 1.0) * math.pi * 2);
    final start = -math.pi / 2 + rotation;
    final end = start + activeSweep;

    final bool waveOnly = value == null || (value != null && value! >= 1.0);
    if (!waveOnly) {
      final trackPaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke
        ..strokeCap = StrokeCap.round
        ..isAntiAlias = true
        ..color = track;

      final gapAngle = 2.0 / baseRadius;
      final rect = Rect.fromCircle(center: center, radius: baseRadius);
      final total = math.pi * 2;
      final a1 = end + gapAngle;
      final a2 = start - gapAngle;
      double sweep1 = (a2 - a1);
      while (sweep1 <= 0) {
        sweep1 += total;
      }
      canvas.drawArc(rect, a1, sweep1, false, trackPaint);
    }

    final steps = math.max(48, (s.width * 1.2).round());
    final path = Path();
    for (int i = 0; i <= steps; i++) {
      final t = i / steps;
      final ang = start + (end - start) * t;
      final arcLen = baseRadius * (ang - start);
      final arcToEnd = baseRadius * (end - ang);
      double taperFactor = 1.0;
      if (arcToEnd < taperLen) {
        final tEnd = (arcToEnd / taperLen).clamp(0.0, 1.0);
        taperFactor = math.sin(tEnd * math.pi / 2);
      }
      final r = baseRadius + (amp * taperFactor) * math.sin(arcLen / scallopLen * 2 * math.pi);
      final p = Offset(center.dx + r * math.cos(ang), center.dy + r * math.sin(ang));
      if (i == 0) {
        path.moveTo(p.dx, p.dy);
      } else {
        path.lineTo(p.dx, p.dy);
      }
    }
    final activePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..color = active;
    canvas.drawPath(path, activePaint);
  }

  @override
  bool shouldRepaint(covariant _CircularWavyPainter old) =>
      value != old.value || active != old.active || track != old.track || rotation != old.rotation;
}
