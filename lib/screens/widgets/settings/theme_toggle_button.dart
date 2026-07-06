import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/core/theme/theme_bloc.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  AppThemeMode getNextThemeMode(AppThemeMode themeMode) {
    switch (themeMode) {
      case AppThemeMode.system:
        return AppThemeMode.light;
      case AppThemeMode.light:
        return AppThemeMode.dark;
      case AppThemeMode.dark:
        return AppThemeMode.system;
    }
  }

  void onPressed(AppThemeMode themeMode) {
    final newThemeMode = getNextThemeMode(themeMode);
    getIt<ThemeBloc>().add(ThemeEvent.setTheme(mode: newThemeMode));
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ThemeBloc, AppThemeMode, AppThemeMode>(
      bloc: getIt<ThemeBloc>(),
      selector: (state) => state,
      builder: (context, themeMode) {
        final icon = switch (themeMode) {
          AppThemeMode.light => const Icon(Icons.light_mode),
          AppThemeMode.dark => const Icon(Icons.dark_mode),
          _ => const Icon(Icons.brightness_auto),
        };
        return IconButton(
          icon: icon,
          onPressed: () => onPressed(themeMode),
          tooltip: context.loc.toggleTheme,
        );
      },
    );
  }
}
