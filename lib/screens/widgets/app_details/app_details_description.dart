import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/extensions.dart';

class AppDetailsDescription extends StatelessWidget {
  const AppDetailsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(context.loc.stopWarning, style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurfaceVariant));
  }
}
