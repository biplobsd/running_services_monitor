import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/core/theme/theme_bloc.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness; // Already cached effectively
    final isDark = brightness == Brightness.dark;
    return IconButton(
      icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
      onPressed: () {
        getIt<ThemeBloc>().add(ThemeEvent.toggleTheme(isDark: isDark));
      },
      tooltip: context.loc.toggleTheme,
    );
  }
}
