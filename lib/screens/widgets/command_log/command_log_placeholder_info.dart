import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';

class CommandLogPlaceholderInfo extends StatelessWidget {
  const CommandLogPlaceholderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final loc = context.loc;
    final placeholders = [
      MapEntry('%p', loc.placeholderPackageName),
      MapEntry('%pid', loc.placeholderProcessId),
      MapEntry('%pids', loc.placeholderAllPids),
      MapEntry('%ram', loc.placeholderTotalRamFormatted),
      MapEntry('%ramKb', loc.placeholderTotalRamKb),
      MapEntry('%state', loc.placeholderProcessState),
      MapEntry('%cached', loc.placeholderCachedMemoryKb),
      MapEntry('%svcCount', loc.placeholderServicesCount),
      MapEntry('%procCount', loc.placeholderProcessCount),
    ];

    return ExpansionTile(
      title: Text(loc.placeholders, style: AppStyles.bodyStyle.copyWith(fontSize: 14)),
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.only(bottom: 8),
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                loc.placeholdersNoAutoFill,
                style: AppStyles.smallStyle.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontStyle: FontStyle.italic,
                ),
              ),
              AppStyles.spacingH8,
              ...placeholders.map(
                (entry) => Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
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
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
