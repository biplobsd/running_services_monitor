import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/core/theme/theme_bloc.dart';

class ThemeToggleButton extends StatefulWidget {
  const ThemeToggleButton({super.key});

  @override
  State<ThemeToggleButton> createState() => _ThemeToggleButtonState();
}

class _ThemeToggleButtonState extends State<ThemeToggleButton> {
  AppThemeMode getNextThemeMode(AppThemeMode themeMode, Brightness brightness) {
    switch (themeMode) {
      case AppThemeMode.light:
        return brightness == Brightness.light
            ? AppThemeMode.dark
            : AppThemeMode.system;
      case AppThemeMode.dark:
        return brightness == Brightness.light
            ? AppThemeMode.system
            : AppThemeMode.light;
      case AppThemeMode.system:
        return brightness == Brightness.light
            ? AppThemeMode.light
            : AppThemeMode.dark;
    }
  }

  void onPressed(Brightness brightness) {
    setState(() {
      final themeMode = getIt<ThemeBloc>().state;
      final newThemeMode = getNextThemeMode(themeMode, brightness);
      getIt<ThemeBloc>().add(ThemeEvent.setTheme(mode: newThemeMode));
    });
  }

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    final themeMode = getIt<ThemeBloc>().state;
    final icon = switch (themeMode) {
      AppThemeMode.light => const Icon(Icons.light_mode),
      AppThemeMode.dark => const Icon(Icons.dark_mode),
      _ => const Icon(Icons.brightness_auto),
    };
    return IconButton(
      icon: icon,
      onPressed: () => onPressed(brightness),
      tooltip: context.loc.toggleTheme,
    );
  }
}
