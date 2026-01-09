import 'package:flutter/material.dart';
import 'package:running_services_monitor/bloc/language_bloc/language_bloc.dart';
import 'package:running_services_monitor/core/constants.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/l10n/l10n_keys.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final crtLocale = getIt<LanguageBloc>().state.locale;
    final loc = context.loc;
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
        ...AppConstants.languages.map(
          (lang) => CheckedPopupMenuItem(
            checked: crtLocale == lang.locale,
            value: lang.locale,
            child: Text(lang.nativeName, style: AppStyles.bodyStyle),
          ),
        ),
      ],
    );
  }
}
