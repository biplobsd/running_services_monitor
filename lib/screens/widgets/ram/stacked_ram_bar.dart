import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/app_styles.dart';

class StackedRamBar extends StatelessWidget {
  final List<RamBarSegment> segments;
  final double? height;
  final double? borderRadius;

  const StackedRamBar({super.key, required this.segments, this.height, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    final total = segments.fold<double>(0, (sum, s) => sum + s.value);
    if (total <= 0) return const SizedBox.shrink();

    final barHeight = height ?? 14;
    final radius = borderRadius ?? 6;

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: SizedBox(
        height: barHeight,
        child: Row(
          children: segments.asMap().entries.map((entry) {
            final segment = entry.value;
            final ratio = segment.value / total;
            if (ratio <= 0) return const SizedBox.shrink();

            return Expanded(
              flex: (ratio * 1000).toInt(),
              child: Container(
                color: segment.color,
                child: segment.showLabel && ratio > 0.08
                    ? Center(
                        child: Text(
                          segment.label ?? '',
                          style: TextStyle(fontSize: 9, color: segment.labelColor ?? Colors.white, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    : null,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class RamBarSegment {
  final double value;
  final Color color;
  final String? label;
  final Color? labelColor;
  final bool showLabel;

  const RamBarSegment({required this.value, required this.color, this.label, this.labelColor, this.showLabel = false});
}

class RamProgressRow extends StatelessWidget {
  final String label;
  final String value;
  final double progress;
  final Color color;
  final Color? backgroundColor;

  const RamProgressRow({super.key, required this.label, required this.value, required this.progress, required this.color, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bgColor = backgroundColor ?? colorScheme.surfaceContainerHighest.withValues(alpha: 0.3);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(label, style: AppStyles.captionStyle.copyWith(color: colorScheme.onSurfaceVariant)),
            const Spacer(),
            Text(value, style: AppStyles.captionStyle.copyWith(fontWeight: FontWeight.w500)),
          ],
        ),
        AppStyles.spacingH4,
        ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: SizedBox(
            height: 6,
            child: Stack(
              children: [
                Container(color: bgColor),
                FractionallySizedBox(
                  widthFactor: progress.clamp(0.0, 1.0),
                  child: Container(color: color),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
