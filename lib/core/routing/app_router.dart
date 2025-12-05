import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:running_services_monitor/l10n/app_localizations.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/screens/home_screen.dart';
import 'package:running_services_monitor/screens/about_screen.dart';
import 'package:running_services_monitor/screens/app_details_screen.dart';

GoRouter createAppRouter() {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', name: 'home', builder: (context, state) => HomeScreen()),
      GoRoute(path: '/about', name: 'about', builder: (context, state) => const AboutScreen()),
      GoRoute(
        path: '/app-details',
        name: 'app-details',
        builder: (context, state) {
          final appInfo = state.extra as AppProcessInfo?;

          if (appInfo == null) {
            final l10n = AppLocalizations.of(context)!;
            return Scaffold(
              appBar: AppBar(title: Text(l10n.error)),
              body: Center(child: Text(l10n.appInfoNotFound)),
            );
          }

          return AppDetailsScreen(appInfo: appInfo);
        },
      ),
    ],
    errorBuilder: (context, state) {
      final l10n = AppLocalizations.of(context)!;
      return Scaffold(
        appBar: AppBar(title: Text(l10n.error)),
        body: Center(child: Text(l10n.pageNotFound(state.matchedLocation))),
      );
    },
  );
}
