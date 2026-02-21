import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/extensions.dart';

class ErrorState extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;

  const ErrorState({super.key, required this.errorMessage, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Theme.of(context).colorScheme.error),
            SizedBox(height: 16),
            Text(errorMessage, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(height: 24),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: Text(context.loc.retry, style: TextStyle(fontSize: 14)),
            ),
          ],
        ),
      ),
    );
  }
}
