import 'package:flutter/material.dart';
import 'package:running_services_monitor/bloc/language_bloc/language_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/l10n/l10n_keys.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final crtLocale = getIt<LanguageBloc>().state.locale;
    final loc = context.loc; // Cached
    return PopupMenuButton<Locale>(
      icon: const Icon(Icons.language),
      tooltip: loc.resolve(L10nKeys.language),
      onSelected: (Locale? locale) {
        if (locale?.languageCode == '_') locale = null;
        getIt<LanguageBloc>().add(LanguageEvent.changeLanguage(locale));
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Locale>>[
        CheckedPopupMenuItem(
          checked: crtLocale == null,
          value: Locale('_'),
          child: Text(loc.followSystem, style: AppStyles.bodyStyle),
        ),
        CheckedPopupMenuItem(
          checked: crtLocale == const Locale('en'),
          value: const Locale('en'),
          child: Text('English', style: AppStyles.bodyStyle),
        ),
        CheckedPopupMenuItem(
          checked: crtLocale == const Locale('bn'),
          value: const Locale('bn'),
          child: Text('বাংলা', style: AppStyles.bodyStyle),
        ),
        CheckedPopupMenuItem(
          checked: crtLocale == const Locale('zh'),
          value: const Locale('zh'),
          child: Text('简体中文', style: AppStyles.bodyStyle),
        ),
      ],
    );
  }
}
