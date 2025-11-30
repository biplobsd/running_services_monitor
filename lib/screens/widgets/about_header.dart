import 'package:flutter/material.dart';
import 'package:running_services_monitor/l10n/app_localizations.dart';

class AboutHeader extends StatelessWidget {
  final String version;

  const AboutHeader({super.key, required this.version});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/logo.png', width: 64, height: 64, color: Theme.of(context).colorScheme.onSurface),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.appTitle,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(version, style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.onSurfaceVariant)),
        ],
      ),
    );
  }
}
