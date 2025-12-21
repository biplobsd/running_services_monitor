import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:material_new_shapes/material_new_shapes.dart';

class LoadingIndicator extends StatefulWidget {
  final Color? color;
  final BoxConstraints? constraints;

  const LoadingIndicator({super.key, this.color, this.constraints});

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> with TickerProviderStateMixin {
  static final List<RoundedPolygon> defaultPolygons = [
    MaterialShapes.softBurst,
    MaterialShapes.cookie9Sided,
    MaterialShapes.gem,
    MaterialShapes.flower,
    MaterialShapes.sunny,
    MaterialShapes.cookie4Sided,
    MaterialShapes.oval,
    MaterialShapes.cookie12Sided,
  ];

  static const int globalRotationDurationMs = 4666;
  static const int morphIntervalMs = 650;
  static const double fullRotation = 360.0;
  static const double quarterRotation = fullRotation / 4;

  late final List<Morph> morphSequence;
  late final AnimationController morphController;
  late final AnimationController globalRotationController;

  int currentMorphIndex = 0;
  double morphRotationTargetAngle = quarterRotation;
  Timer? morphTimer;

  final morphAnimationSpec = SpringSimulation(
    SpringDescription.withDampingRatio(ratio: 0.6, stiffness: 200.0, mass: 1.0),
    0.0,
    1.0,
    5.0,
    tolerance: const Tolerance(velocity: 0.1, distance: 0.1),
  );

  @override
  void initState() {
    super.initState();

    morphSequence = _createMorphSequence(defaultPolygons);

    morphController = AnimationController.unbounded(vsync: this);
    globalRotationController = AnimationController(
      duration: const Duration(milliseconds: globalRotationDurationMs),
      vsync: this,
    );

    _startAnimations();
  }

  @override
  void dispose() {
    morphTimer?.cancel();
    morphController.dispose();
    globalRotationController.dispose();
    super.dispose();
  }

  List<Morph> _createMorphSequence(List<RoundedPolygon> polygons) {
    final morphs = <Morph>[];
    for (int i = 0; i < polygons.length; i++) {
      if (i + 1 < polygons.length) {
        morphs.add(Morph(polygons[i], polygons[i + 1]));
      } else {
        morphs.add(Morph(polygons[i], polygons[0]));
      }
    }
    return morphs;
  }

  void _startAnimations() {
    globalRotationController.repeat();
    morphTimer = Timer.periodic(const Duration(milliseconds: morphIntervalMs), (_) => _startMorphCycle());
    _startMorphCycle();
  }

  void _startMorphCycle() {
    if (!mounted) return;

    currentMorphIndex = (currentMorphIndex + 1) % morphSequence.length;
    morphRotationTargetAngle = (morphRotationTargetAngle + quarterRotation) % fullRotation;

    morphController.reset();
    morphController.animateWith(morphAnimationSpec).then((_) {
      if (mounted && morphController.value != 1.0) {
        morphController.value = 1.0;
      }
    });
  }

  double _calculateScaleFactor(List<RoundedPolygon> polygons) {
    var scaleFactor = 1.0;
    for (final polygon in polygons) {
      final bounds = polygon.calculateBounds();
      final maxBounds = polygon.calculateMaxBounds();

      final boundsWidth = bounds[2] - bounds[0];
      final boundsHeight = bounds[3] - bounds[1];
      final maxBoundsWidth = maxBounds[2] - maxBounds[0];
      final maxBoundsHeight = maxBounds[3] - maxBounds[1];

      final scaleX = boundsWidth / maxBoundsWidth;
      final scaleY = boundsHeight / maxBoundsHeight;

      scaleFactor = math.min(scaleFactor, math.max(scaleX, scaleY));
    }
    return scaleFactor;
  }

  @override
  Widget build(BuildContext context) {
    final constraints =
        widget.constraints ?? const BoxConstraints(minWidth: 48.0, minHeight: 48.0, maxWidth: 48.0, maxHeight: 48.0);
    final activeIndicatorScale = 38.0 / math.min(constraints.maxWidth, constraints.maxHeight);
    final shapesScaleFactor = _calculateScaleFactor(defaultPolygons) * activeIndicatorScale;
    final color = widget.color ?? Theme.of(context).colorScheme.primary;

    return RepaintBoundary(
      child: ConstrainedBox(
        constraints: constraints,
        child: AspectRatio(
          aspectRatio: 1.0,
          child: AnimatedBuilder(
            animation: Listenable.merge([morphController, globalRotationController]),
            builder: (context, child) {
              final morphProgress = morphController.value.clamp(0.0, 1.0);
              final globalRotationDegrees = globalRotationController.value * fullRotation;

              final totalRotationDegrees = morphProgress * 90 + morphRotationTargetAngle + globalRotationDegrees;
              final totalRotationRadians = totalRotationDegrees * (math.pi / 180.0);

              return Transform.rotate(
                angle: totalRotationRadians,
                child: CustomPaint(
                  painter: _MorphPainter(
                    morph: morphSequence[currentMorphIndex],
                    progress: morphProgress,
                    color: color,
                    scaleFactor: shapesScaleFactor,
                  ),
                  child: const SizedBox.expand(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _MorphPainter extends CustomPainter {
  final Morph morph;
  final double progress;
  final Color color;
  final double scaleFactor;

  _MorphPainter({required this.morph, required this.progress, required this.color, this.scaleFactor = 1.0});

  @override
  void paint(Canvas canvas, Size size) {
    if (progress < 0.0 || color.a == 0.0) return;

    final clampedProgress = progress.clamp(0.0, 1.0);
    final path = morph.toPath(progress: clampedProgress);
    final processedPath = _processPath(path, size);

    canvas.drawPath(
      processedPath,
      Paint()
        ..style = PaintingStyle.fill
        ..color = color
        ..isAntiAlias = true,
    );
  }

  @override
  bool shouldRepaint(_MorphPainter oldDelegate) {
    return oldDelegate.morph != morph ||
        oldDelegate.progress != progress ||
        oldDelegate.color != color ||
        oldDelegate.scaleFactor != scaleFactor;
  }

  Path _processPath(Path path, Size size) {
    final Matrix4 scaleMatrix = Matrix4.diagonal3Values(size.width * scaleFactor, size.height * scaleFactor, 1);
    final Path scaledPath = path.transform(scaleMatrix.storage);

    final Rect bounds = scaledPath.getBounds();
    final Offset translation = Offset(size.width / 2, size.height / 2) - bounds.center;
    final Path finalPath = scaledPath.shift(translation);

    return finalPath;
  }
}
