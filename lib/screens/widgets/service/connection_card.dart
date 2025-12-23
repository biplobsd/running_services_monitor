import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/service_info.dart';
import '../common/status_badge.dart';

class ConnectionCard extends StatelessWidget {
  final ConnectionRecord conn;

  const ConnectionCard({super.key, required this.conn});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colorScheme.surfaceContainerHigh, colorScheme.surfaceContainer],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12.rSafe),
        border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.link_rounded, size: 14.w, color: colorScheme.primary),
              AppStyles.spacing8,
              Expanded(
                child: Text(
                  '${conn.packageName}/${conn.serviceName}',
                  style: textTheme.bodyMedium?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600, color: colorScheme.onSurface),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          if (conn.flags != null) ...[
            SizedBox(height: 6.h), // Keeping 6.h
            Text(
              '${context.loc.flags}: ${conn.flags}',
              style: textTheme.bodySmall?.copyWith(fontSize: 10.sp, color: colorScheme.onSurfaceVariant),
            ),
          ],
          AppStyles.spacingH8,
          Wrap(
            spacing: 6.w,
            runSpacing: 4.h,
            children: [
              if (conn.isForeground == true) StatusBadge(label: 'FGS', color: Colors.green, fontSize: 9.sp),
              if (conn.isVisible == true) StatusBadge(label: 'VIS', color: Colors.blue, fontSize: 9.sp),
              if (conn.hasCapabilities == true) StatusBadge(label: 'CAPS', color: Colors.orange, fontSize: 9.sp),
            ],
          ),
        ],
      ),
    );
  }
}
