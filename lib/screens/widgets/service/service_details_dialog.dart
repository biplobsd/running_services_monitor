import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'service_header.dart';
import 'service_info_section.dart';
import 'service_process_section.dart';
import 'service_connections_section.dart';
import 'service_raw_output_section.dart';

class ServiceDetailsSheet extends StatelessWidget {
  final RunningServiceInfo service;

  const ServiceDetailsSheet({super.key, required this.service});

  static Future<void> show(BuildContext context, RunningServiceInfo service) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ServiceDetailsSheet(service: service),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      builder: (context, scrollController) => Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 12, bottom: 8),
              width: 40,
              height: 4,
              decoration: BoxDecoration(color: colorScheme.onSurfaceVariant.withValues(alpha: 0.4), borderRadius: BorderRadius.circular(2)),
            ),
            ServiceHeader(service: service),
            Expanded(
              child: ListView(
                controller: scrollController,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: [
                  ServiceInfoSection(service: service),
                  AppStyles.spacingH16,
                  if (service.pid != null || service.uid != null) ...[ServiceProcessSection(service: service), AppStyles.spacingH16],
                  if (service.connections.isNotEmpty) ...[ServiceConnectionsSection(service: service), AppStyles.spacingH16],
                  if (service.rawServiceRecord != null) ServiceRawOutputSection(service: service),
                  AppStyles.spacingH24,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
