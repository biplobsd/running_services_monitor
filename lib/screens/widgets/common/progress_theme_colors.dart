import 'package:flutter/material.dart';

const _kLightThemeProgressTrackAlpha = 0.55;
const _kDarkThemeProgressTrackAlpha = 0.4;

Color defaultProgressTrackColor(BuildContext context) {
  final theme = Theme.of(context);
  final alpha = theme.brightness == Brightness.light ? _kLightThemeProgressTrackAlpha : _kDarkThemeProgressTrackAlpha;
  return theme.colorScheme.outlineVariant.withValues(alpha: alpha);
}
