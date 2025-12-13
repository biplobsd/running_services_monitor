import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';

class StatusBadge extends StatelessWidget {
  final String label;
  final Color color;
  final double? fontSize;
  final EdgeInsets? padding;

  const StatusBadge({super.key, required this.label, required this.color, this.fontSize, this.padding});

  @override
  Widget build(BuildContext context) {
    final effectiveFontSize = fontSize ?? 10.sp;
    final effectivePadding = padding ?? EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h);

    return Container(
      padding: effectivePadding,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: color.withValues(alpha: 0.5), width: 1),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: effectiveFontSize, color: color, fontWeight: FontWeight.w500),
      ),
    );
  }
}
