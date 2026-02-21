import 'package:flutter/material.dart';
import 'package:running_services_monitor/bloc/language_bloc/language_bloc.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';

class LanguageOptionTile extends StatelessWidget {
  final Locale? locale;
  final String label;
  final Locale? currentLocale;

  const LanguageOptionTile({super.key, required this.locale, required this.label, required this.currentLocale});

  @override
  Widget build(BuildContext context) {
    final isSelected = locale == currentLocale;
    return SimpleDialogOption(
      onPressed: () {
        getIt<LanguageBloc>().add(LanguageEvent.changeLanguage(locale));
        Navigator.of(context).pop();
      },
      child: Row(
        children: [
          if (isSelected) Icon(Icons.check, size: 20, color: Theme.of(context).colorScheme.primary),
          if (!isSelected) SizedBox(width: 20),
          SizedBox(width: 12),
          Text(label, style: AppStyles.bodyStyle),
        ],
      ),
    );
  }
}
