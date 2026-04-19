import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/app_styles.dart';

class CommandLogSectionHeader extends StatelessWidget {
  final String title;

  const CommandLogSectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: AppStyles.captionStyle.copyWith(color: colorScheme.primary, fontWeight: FontWeight.w600),
      ),
    );
  }
}
