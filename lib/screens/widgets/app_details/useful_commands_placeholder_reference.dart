import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/utils/format_utils.dart';

class UsefulCommandsPlaceholderReference extends StatelessWidget {
  final String packageName;
  final AppProcessInfo? appInfo;

  const UsefulCommandsPlaceholderReference({
    super.key,
    required this.packageName,
    this.appInfo,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final placeholders = <MapEntry<String, String>>[
      MapEntry('%p', 'packageName → $packageName'),
      if (appInfo != null) ...[
        MapEntry('%pid', 'First PID → ${appInfo!.pids.isNotEmpty ? appInfo!.pids.first : "N/A"}'),
        MapEntry('%pids', 'All PIDs → ${appInfo!.pids.join(",")}'),
        MapEntry('%ram', 'Total RAM → ${appInfo!.totalRamInKb.formatRam()}'),
        MapEntry('%ramKb', 'RAM in KB → ${appInfo!.totalRamInKb.toStringAsFixed(0)}'),
        MapEntry('%state', 'Process State → ${appInfo!.processState ?? "N/A"}'),
        MapEntry('%cached', 'Cached Memory KB → ${appInfo!.cachedMemoryKb.toStringAsFixed(0)}'),
        MapEntry('%svcCount', 'Services Count → ${appInfo!.services.length}'),
        MapEntry('%procCount', 'Process Count → ${appInfo!.processCount}'),
      ],
    ];

    return ExpansionTile(
      title: Text(context.loc.placeholders, style: AppStyles.bodyStyle.copyWith(fontSize: 14)),
      tilePadding: EdgeInsets.zero,
      childrenPadding: const EdgeInsets.only(bottom: 8),
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: placeholders.map((entry) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        entry.key,
                        style: AppStyles.smallStyle.copyWith(
                          fontFamily: 'monospace',
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ),
                    AppStyles.spacing8,
                    Expanded(
                      child: Text(
                        entry.value,
                        style: AppStyles.smallStyle.copyWith(fontSize: 11),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
