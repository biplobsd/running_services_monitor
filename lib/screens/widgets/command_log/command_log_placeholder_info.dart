import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';

class CommandLogPlaceholderInfo extends StatelessWidget {
  const CommandLogPlaceholderInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final placeholders = [
      MapEntry('%p', 'Package name (e.g., com.example.app)'),
      MapEntry('%pid', 'Process ID'),
      MapEntry('%pids', 'All PIDs (comma-separated)'),
      MapEntry('%ram', 'Total RAM (formatted)'),
      MapEntry('%ramKb', 'Total RAM in KB'),
      MapEntry('%state', 'Process state'),
      MapEntry('%cached', 'Cached memory in KB'),
      MapEntry('%svcCount', 'Services count'),
      MapEntry('%procCount', 'Process count'),
    ];

    return ExpansionTile(
      title: Text(context.loc.placeholders, style: AppStyles.bodyStyle.copyWith(fontSize: 14)),
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
                context.loc.placeholdersNoAutoFill,
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
