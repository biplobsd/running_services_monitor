import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/app_styles.dart';

class UsefulCommandsSectionHeader extends StatelessWidget {
  final String title;

  const UsefulCommandsSectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: AppStyles.captionStyle.copyWith(
          color: colorScheme.primary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
