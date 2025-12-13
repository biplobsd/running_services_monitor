import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/core/extensions.dart';

class RamLegendItem extends StatelessWidget {
  final Color color;
  final String label;
  final String value;

  const RamLegendItem({super.key, required this.color, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 16.w,
          height: 16.h,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4.rSafe)),
        ),
        SizedBox(width: 12.w),
        Text(label, style: TextStyle(fontSize: 14.sp)),
        const Spacer(),
        Text('$value ${context.loc.ofRam}', style: TextStyle(fontSize: 14.sp)),
      ],
    );
  }
}
