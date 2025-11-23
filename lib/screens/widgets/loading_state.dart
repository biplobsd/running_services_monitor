import 'package:flutter/material.dart';
import 'package:running_services_monitor/l10n/app_localizations.dart';

class LoadingState extends StatelessWidget {
  final String? status;

  const LoadingState({super.key, this.status});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(status ?? AppLocalizations.of(context)!.loadingServices),
        ],
      ),
    );
  }
}
