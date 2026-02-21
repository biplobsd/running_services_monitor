import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'connection_card.dart';

class ServiceConnectionsSection extends StatelessWidget {
  final RunningServiceInfo service;

  const ServiceConnectionsSection({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.3)),
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 14),
        childrenPadding: EdgeInsets.only(left: 14, right: 14, bottom: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        leading: Container(
          padding: AppStyles.padding8, // Assuming/using padding8 (added or existing)
          decoration: BoxDecoration(color: colorScheme.primaryContainer.withValues(alpha: 0.5), borderRadius: BorderRadius.circular(10)),
          child: Icon(Icons.cable_rounded, size: 18, color: colorScheme.primary),
        ),
        title: Text(
          '${context.loc.connections} (${service.connections.length})',
          style: textTheme.titleSmall?.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        children: service.connections.map((conn) => ConnectionCard(conn: conn)).toList(),
      ),
    );
  }
}
