import 'package:flutter/material.dart';
import '../models/service_info.dart';
import 'package:running_services_monitor/l10n/app_localizations.dart';
import 'widgets/app_header.dart';
import 'widgets/service_list.dart';

class AppDetailsScreen extends StatelessWidget {
  final AppProcessInfo appInfo;

  const AppDetailsScreen({super.key, required this.appInfo});

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.runningApp)),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(24.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  // Header
                  AppHeader(appInfo: appInfo),
                  const SizedBox(height: 24),

                  // Description
                  Text(
                    AppLocalizations.of(context)!.stopWarning,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey[400]),
                  ),

                  const SizedBox(height: 32),
                  const Divider(),
                  const SizedBox(height: 16),

                  // Service List
                  Text(AppLocalizations.of(context)!.activeServices, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                ]),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ServiceList(services: appInfo.services),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
