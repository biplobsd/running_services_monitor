import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';

class MemInfoErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const MemInfoErrorView({super.key, required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppStyles.padding24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48, color: Theme.of(context).colorScheme.error),
            AppStyles.spacingH16,
            Text(context.loc.error, style: AppStyles.titleStyle.copyWith(fontWeight: FontWeight.bold)),
            AppStyles.spacingH8,
            Text(message, style: AppStyles.bodyStyle, textAlign: TextAlign.center),
            AppStyles.spacingH16,
            FilledButton.icon(onPressed: onRetry, icon: AppStyles.refreshIcon, label: Text(context.loc.retry)),
          ],
        ),
      ),
    );
  }
}
