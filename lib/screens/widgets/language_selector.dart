import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/bloc/language_bloc/language_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/l10n/app_localizations.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final crtLocale = getIt<LanguageBloc>().state.locale;
    final loc = AppLocalizations.of(context)!;
    return PopupMenuButton<Locale>(
      icon: const Icon(Icons.language),
      tooltip: 'Language',
      onSelected: (Locale? locale) {
        if (locale?.languageCode == '_') locale = null;
        getIt<LanguageBloc>().add(LanguageEvent.changeLanguage(locale));
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Locale>>[
        CheckedPopupMenuItem (
          checked: crtLocale == null,
          value: Locale('_'),
          child: Text(loc.followSystem, style: TextStyle(fontSize: 14.sp)),
        ),
        CheckedPopupMenuItem (
          checked: crtLocale == const Locale('en'),
          value: const Locale('en'),
          child: Text('English', style: TextStyle(fontSize: 14.sp)),
        ),
        CheckedPopupMenuItem (
          checked: crtLocale == const Locale('bn'),
          value: const Locale('bn'),
          child: Text('বাংলা', style: TextStyle(fontSize: 14.sp)),
        ),
        CheckedPopupMenuItem (
          checked: crtLocale == const Locale('zh'),
          value: const Locale('zh'),
          child: Text('简体中文', style: TextStyle(fontSize: 14.sp)),
        ),
      ],
    );
  }
}
