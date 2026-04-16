import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/utils/url_launcher_helper.dart';

class TipSlideCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;
  final String actionLabel;
  final String url;
  final Widget? iconWidget;

  const TipSlideCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
    required this.actionLabel,
    required this.url,
    this.iconWidget,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Center(
        child: Padding(
          padding: AppStyles.padding16,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconWidget ?? Icon(icon, size: 40, color: iconColor),
                AppStyles.spacingH10,
                Text(title, style: AppStyles.titleStyle),
                AppStyles.spacingH6,
                Text(description, style: AppStyles.bodyStyle, textAlign: TextAlign.center),
                AppStyles.spacingH12,
                FilledButton.tonalIcon(
                  onPressed: () => UrlLauncherHelper.launchExternalUrl(url),
                  icon: const Icon(Icons.open_in_new, size: 16),
                  label: Text(actionLabel, style: AppStyles.bodyStyle),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
