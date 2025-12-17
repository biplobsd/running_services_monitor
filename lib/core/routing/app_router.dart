import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/screens/home_screen.dart';
import 'package:running_services_monitor/screens/about_screen.dart';
import 'package:running_services_monitor/screens/app_details_screen.dart';
import 'package:running_services_monitor/screens/command_log_screen.dart';
import 'package:running_services_monitor/screens/command_output_screen.dart';

GoRouter createAppRouter() {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', name: 'home', builder: (context, state) => HomeScreen()),
      GoRoute(path: '/about', name: 'about', builder: (context, state) => const AboutScreen()),
      GoRoute(path: '/command-logs', name: 'command-logs', builder: (context, state) => const CommandLogScreen()),
      GoRoute(
        path: '/command-output',
        name: 'command-output',
        builder: (context, state) {
          final entryId = state.extra as String?;
          if (entryId == null) {
            return Scaffold(
              appBar: AppBar(title: Text(context.loc.error)),
              body: Center(child: Text(context.loc.error)),
            );
          }
          return CommandOutputScreen(entryId: entryId);
        },
      ),
      GoRoute(
        path: '/app-details',
        name: 'app-details',
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          final packageId = extra?['packageName'] as String?;
          final tabIndex = extra?['tabIndex'] as int? ?? 0;

          if (packageId == null) {
            final l10n = context.loc;
            return Scaffold(
              appBar: AppBar(title: Text(l10n.error)),
              body: Center(child: Text(l10n.appInfoNotFound)),
            );
          }

          return AppDetailsScreen(packageId: packageId, tabIndex: tabIndex);
        },
      ),
    ],
    errorBuilder: (context, state) {
      final l10n = context.loc;
      return Scaffold(
        appBar: AppBar(title: Text(l10n.error)),
        body: Center(child: Text(l10n.pageNotFound(state.matchedLocation))),
      );
    },
  );
}
