import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/utils/format_utils.dart';
import '../common/detail_tile.dart';

class ServiceInfoSection extends StatelessWidget {
  final RunningServiceInfo service;

  const ServiceInfoSection({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          DetailTile(icon: Icons.inventory_2_rounded, label: context.loc.package, value: service.packageName),
          DetailTile(icon: Icons.settings_rounded, label: context.loc.service, value: service.serviceName),
          DetailTile(icon: Icons.memory_rounded, label: context.loc.process, value: service.processName),
          if (service.pid != null) DetailTile(icon: Icons.tag_rounded, label: context.loc.pid, value: service.pid.toString()),
          if (service.uid != null) DetailTile(icon: Icons.person_rounded, label: context.loc.uid, value: service.uid.toString()),
          if (service.recentCallingUid != null)
            DetailTile(icon: Icons.call_made_rounded, label: context.loc.recentCallingUid, value: service.recentCallingUid.toString()),
          if (service.ramInKb != null)
            DetailTile(icon: Icons.storage_rounded, label: context.loc.ramUsage, value: service.ramInKb.formatRam(), valueColor: colorScheme.primary),
          if (service.intent != null) DetailTile(icon: Icons.link_rounded, label: context.loc.intent, value: service.intent!),
          if (service.isForeground != null)
            DetailTile(
              icon: Icons.visibility_rounded,
              label: context.loc.foreground,
              value: service.isForeground! ? context.loc.yes : context.loc.no,
              valueColor: service.isForeground! ? Colors.green : null,
            ),
          if (service.foregroundId != null && service.foregroundId != 0)
            DetailTile(icon: Icons.notifications_rounded, label: context.loc.foregroundId, value: service.foregroundId.toString()),
          if (service.startRequested != null)
            DetailTile(icon: Icons.play_circle_rounded, label: context.loc.startRequested, value: service.startRequested! ? context.loc.yes : context.loc.no),
          if (service.createdFromFg != null)
            DetailTile(icon: Icons.add_circle_rounded, label: context.loc.createdFromFg, value: service.createdFromFg! ? context.loc.yes : context.loc.no),
          if (service.createTime != null) DetailTile(icon: Icons.schedule_rounded, label: context.loc.createTime, value: service.createTime!),
          if (service.lastActivityTime != null) DetailTile(icon: Icons.update_rounded, label: context.loc.lastActivity, value: service.lastActivityTime!),
          if (service.baseDir != null) DetailTile(icon: Icons.folder_rounded, label: context.loc.baseDir, value: service.baseDir!),
          if (service.dataDir != null) DetailTile(icon: Icons.folder_open_rounded, label: context.loc.dataDir, value: service.dataDir!, isLast: true),
        ],
      ),
    );
  }
}
