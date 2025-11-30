import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/l10n/app_localizations.dart';

class AboutHeader extends StatelessWidget {
  final String version;

  const AboutHeader({super.key, required this.version});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/logo.png', width: 64.w, height: 64.h, color: Theme.of(context).colorScheme.onSurface),
          SizedBox(height: 16.h),
          Text(
            AppLocalizations.of(context)!.appTitle,
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(version, style: TextStyle(fontSize: 16.sp, color: Theme.of(context).colorScheme.onSurfaceVariant)),
        ],
      ),
    );
  }
}
