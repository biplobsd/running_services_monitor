import 'package:flutter/material.dart';
import 'package:running_services_monitor/l10n/gen/app_localizations.dart';

extension BuildContextExtensions on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;
}

extension StringCasingExtension on String {
  String capitalize() {
    if (isEmpty) return "";
    return this[0].toUpperCase() + substring(1);
  }
}
