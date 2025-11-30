import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';

class ServiceDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const ServiceDetailRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
        SizedBox(height: 2.h),
        SelectableText(value, style: TextStyle(fontSize: 14.sp)),
      ],
    );
  }
}
