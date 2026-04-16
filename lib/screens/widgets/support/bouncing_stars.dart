import 'package:flutter/material.dart';

class BouncingStars extends StatefulWidget {
  const BouncingStars({super.key});

  @override
  State<BouncingStars> createState() => _BouncingStarsState();
}

class _BouncingStarsState extends State<BouncingStars> with TickerProviderStateMixin {
  late final List<AnimationController> controllers;
  late final List<Animation<double>> animations;

  final List<int> durations = [1000, 800, 600, 400, 600];

  @override
  void initState() {
    super.initState();
    controllers = List.generate(5, (index) {
      return AnimationController(
        vsync: this,
        duration: Duration(milliseconds: durations[index]),
      )..repeat(reverse: true);
    });
    animations = controllers.map((c) {
      return Tween<double>(begin: 0, end: -8).animate(
        CurvedAnimation(parent: c, curve: Curves.easeInOut),
      );
    }).toList();
  }

  @override
  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return AnimatedBuilder(
          animation: animations[index],
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, animations[index].value),
              child: child,
            );
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: Icon(Icons.star_rounded, size: 28, color: Colors.amber),
          ),
        );
      }),
    );
  }
}
