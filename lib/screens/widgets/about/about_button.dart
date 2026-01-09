import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:running_services_monitor/bloc/working_mode_bloc/working_mode_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/bloc/language_bloc/language_bloc.dart';
import 'package:running_services_monitor/core/constants.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/utils/android_settings_helper.dart';
import 'package:running_services_monitor/models/working_mode.dart';
import '../settings/working_mode_selector.dart';
import '../settings/language_option_tile.dart';

enum AboutMenuItem { runningServices, mode, language, showCore, logs, compare, about }

class AboutButton extends StatelessWidget {
  const AboutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<WorkingModeBloc, WorkingModeState, WorkingMode?>(
      bloc: getIt<WorkingModeBloc>(),
      selector: (state) => state.value.currentMode,
      builder: (context, currentMode) {
        return BlocSelector<HomeBloc, HomeState, bool>(
          bloc: getIt<HomeBloc>(),
          selector: (state) => state.value.showCoreApps,
          builder: (context, showCoreApps) {
            return BlocSelector<LanguageBloc, LanguageState, Locale?>(
              bloc: getIt<LanguageBloc>(),
              selector: (state) => state.locale,
              builder: (context, currentLocale) {
                return PopupMenuButton<AboutMenuItem>(
                  icon: const Icon(Icons.info_outline),
                  tooltip: context.loc.about,
                  onSelected: (value) {
                    switch (value) {
                      case AboutMenuItem.about:
                        context.push('/about');
                      case AboutMenuItem.mode:
                        showModalBottomSheet(context: context, builder: (context) => const WorkingModeSelector());
                      case AboutMenuItem.logs:
                        context.push('/command-logs');
                      case AboutMenuItem.compare:
                        context.push('/meminfo-compare');
                      case AboutMenuItem.showCore:
                        getIt<HomeBloc>().add(const HomeEvent.toggleShowCoreApps());
                      case AboutMenuItem.runningServices:
                        AndroidSettingsHelper.tryOpenSystemRunningServices();
                      case AboutMenuItem.language:
                        _showLanguageDialog(context, currentLocale);
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem<AboutMenuItem>(
                      value: AboutMenuItem.runningServices,
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(Icons.security, size: 20.sp),
                        title: Text(context.loc.runningServicesTitle, style: AppStyles.bodyStyle),
                      ),
                    ),
                    PopupMenuItem<AboutMenuItem>(
                      value: AboutMenuItem.mode,
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(Icons.settings, size: 20.sp),
                        title: Text(context.loc.workingMode, style: AppStyles.bodyStyle),
                        subtitle: currentMode != null ? Text(_getModeDisplayName(context, currentMode), style: AppStyles.subtitleStyle) : null,
                      ),
                    ),
                    PopupMenuItem<AboutMenuItem>(
                      value: AboutMenuItem.language,
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(Icons.language, size: 20.sp),
                        title: Text(context.loc.language, style: AppStyles.bodyStyle),
                        subtitle: Text(_getLanguageDisplayName(context, currentLocale), style: AppStyles.subtitleStyle),
                      ),
                    ),
                    PopupMenuItem<AboutMenuItem>(
                      value: AboutMenuItem.showCore,
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: IgnorePointer(
                          child: Transform.scale(
                            scale: 0.50,
                            child: SizedBox(
                              width: 15.sp,
                              child: Padding(
                                padding: EdgeInsets.only(left: 15.sp),
                                child: Switch(value: showCoreApps, onChanged: (_) {}, materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
                              ),
                            ),
                          ),
                        ),
                        title: Text(context.loc.showCoreApps, style: AppStyles.bodyStyle),
                      ),
                    ),
                    PopupMenuItem<AboutMenuItem>(
                      value: AboutMenuItem.logs,
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(Icons.terminal, size: 20.sp),
                        title: Text(context.loc.commandLogs, style: AppStyles.bodyStyle),
                      ),
                    ),
                    PopupMenuItem<AboutMenuItem>(
                      value: AboutMenuItem.compare,
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(Icons.compare_arrows, size: 20.sp),
                        title: Text(context.loc.compareWithOther, style: AppStyles.bodyStyle),
                      ),
                    ),
                    PopupMenuItem<AboutMenuItem>(
                      value: AboutMenuItem.about,
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(Icons.info_outline, size: 20.sp),
                        title: Text(context.loc.about, style: AppStyles.bodyStyle),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  String _getModeDisplayName(BuildContext context, WorkingMode mode) {
    return switch (mode) {
      WorkingMode.root => context.loc.rootMode,
      WorkingMode.shizuku => context.loc.shizukuMode,
    };
  }

  String _getLanguageDisplayName(BuildContext context, Locale? locale) {
    if (locale == null) return context.loc.followSystem;
    final lang = AppConstants.languages.where((l) => l.locale == locale).firstOrNull;
    return lang?.nativeName ?? context.loc.followSystem;
  }

  void _showLanguageDialog(BuildContext context, Locale? currentLocale) {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text(context.loc.language, style: AppStyles.titleStyle),
        children: [
          LanguageOptionTile(locale: null, label: context.loc.followSystem, currentLocale: currentLocale),
          ...AppConstants.languages.map((lang) => LanguageOptionTile(locale: lang.locale, label: lang.nativeName, currentLocale: currentLocale)),
        ],
      ),
    );
  }
}
