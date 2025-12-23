import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/service_info.dart';
import '../common/status_chip.dart';

class ServiceHeader extends StatelessWidget {
  final RunningServiceInfo service;

  const ServiceHeader({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: colorScheme.outlineVariant.withValues(alpha: 0.3))),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorScheme.primaryContainer, colorScheme.tertiaryContainer],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12.rSafe),
            ),
            child: Icon(Icons.miscellaneous_services_rounded, color: colorScheme.onPrimaryContainer, size: 24.w),
          ),
          AppStyles.spacing16,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(service.serviceName, style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                AppStyles.spacingH4,
                Text(
                  service.packageName,
                  style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Wrap(
            spacing: 4.w,
            children: [
              if (service.isForeground == true) StatusChip(label: 'FGS', color: Colors.green.shade400, icon: Icons.visibility_rounded),
              if (service.isSystemApp) StatusChip(label: context.loc.systemApp, color: Colors.orange.shade400, icon: Icons.android_rounded),
            ],
          ),
        ],
      ),
    );
  }
}
