import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RamLegendItem extends StatelessWidget {
  final Color? color;
  final String label;
  final String value;

  const RamLegendItem({super.key, this.color, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (color != null) ...[
          Skeleton.shade(
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
            ),
          ),
          AppStyles.spacing12,
        ],
        Text(
          label,
          style: const TextStyle().copyWith(fontSize: 14),
        ), // or use a predefined style and override fontSize if needed, 14 is close to bodyStyle (14)
        const Spacer(),
        Text(value, style: const TextStyle().copyWith(fontSize: 14)),
      ],
    );
  }
}
