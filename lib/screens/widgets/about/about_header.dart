import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';

class AboutHeader extends StatelessWidget {
  final String version;

  const AboutHeader({super.key, required this.version});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/logo.png', width: 64, height: 64, color: Theme.of(context).colorScheme.onSurface),
          AppStyles.spacingH16,
          Text(
            context.loc.appTitle,
            style: AppStyles.headerStyle.copyWith(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          AppStyles.spacingH8,
          Text(
            version,
            style: AppStyles.bodyStyle.copyWith(fontSize: 16, color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
