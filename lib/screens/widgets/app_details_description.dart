import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/extensions.dart';

class AppDetailsDescription extends StatelessWidget {
  const AppDetailsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.loc.stopWarning,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
    );
  }
}
