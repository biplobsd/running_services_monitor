import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/app_styles.dart';
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
        AppStyles.spacingH2, // Replacing 2.h with spacingH2
        SelectableText(
          scrollPhysics: const NeverScrollableScrollPhysics(),
          value,
          style: AppStyles.bodyStyle.copyWith(fontSize: 14.sp),
        ),
      ],
    );
  }
}
