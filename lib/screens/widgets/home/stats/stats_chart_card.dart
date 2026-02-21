import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/app_styles.dart';

class StatsChartCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget child;
  final double? height;

  const StatsChartCard({super.key, required this.title, this.subtitle, required this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Theme.of(context).shadowColor.withValues(alpha: 0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(title, style: AppStyles.titleStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
            if (subtitle != null) ...[AppStyles.spacingH8, Text(subtitle!, style: AppStyles.captionStyle)],
            SizedBox(height: 24),
            SizedBox(
              height: height ?? 250,
              width: double.infinity,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
