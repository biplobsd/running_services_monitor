import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/l10n/l10n_keys.dart';
import 'loading_indicator.dart';

class LoadingState extends StatelessWidget {
  final String? status;

  const LoadingState({super.key, this.status});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 80, width: 80, child: const LoadingIndicator()),
          SizedBox(height: 16),
          Text(context.loc.resolve(status), style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
