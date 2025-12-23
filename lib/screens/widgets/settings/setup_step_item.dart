import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/core/app_styles.dart';

class SetupStepItem extends StatelessWidget {
  final String number;
  final String text;

  const SetupStepItem({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme; // Cache theme
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(color: colorScheme.primary, borderRadius: BorderRadius.circular(12.rSafe)),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            child: Center(
              child: Text(
                number,
                style: AppStyles.subtitleStyle.copyWith(color: colorScheme.onPrimary, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          AppStyles.spacing10,
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: Text(text, style: AppStyles.bodyStyle),
            ),
          ),
        ],
      ),
    );
  }
}
