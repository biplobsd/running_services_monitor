import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/core/app_styles.dart';

class LegendDot extends StatelessWidget {
  final Color color;
  final double? size;

  const LegendDot({super.key, required this.color, this.size});

  @override
  Widget build(BuildContext context) {
    final dotSize = size ?? 8.w;
    return Container(
      width: dotSize,
      height: dotSize,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class LegendLabel extends StatelessWidget {
  final Color color;
  final String text;
  final double? fontSize;

  const LegendLabel({super.key, required this.color, required this.text, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        LegendDot(color: color),
        AppStyles.spacing4,
        Text(text, style: TextStyle(fontSize: fontSize ?? 11.sp)),
      ],
    );
  }
}
