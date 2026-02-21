import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'process_info_chip.dart';

class ServiceProcessSection extends StatelessWidget {
  final RunningServiceInfo service;

  const ServiceProcessSection({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colorScheme.tertiaryContainer.withValues(alpha: 0.3), colorScheme.surfaceContainerLow],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(14),
            child: Row(
              children: [
                Container(
                  padding: AppStyles.padding8,
                  decoration: BoxDecoration(color: colorScheme.tertiary.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(10)),
                  child: Icon(Icons.account_tree_rounded, size: 18, color: colorScheme.tertiary),
                ),
                AppStyles.spacing10,
                Text(context.loc.process, style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Divider(height: 1, color: colorScheme.outlineVariant.withValues(alpha: 0.2)),
          Padding(
            padding: EdgeInsets.all(14),
            child: Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                if (service.pid != null)
                  ProcessInfoChip(label: context.loc.pid, value: service.pid.toString(), icon: Icons.tag_rounded, color: colorScheme.primary),
                if (service.uid != null)
                  ProcessInfoChip(label: context.loc.uid, value: service.uid.toString(), icon: Icons.person_rounded, color: colorScheme.secondary),
                ProcessInfoChip(
                  label: context.loc.type,
                  value: service.isSystemApp ? context.loc.systemApp : context.loc.userApp,
                  icon: Icons.category_rounded,
                  color: service.isSystemApp ? Colors.orange : Colors.green,
                ),
                if (service.hasBound) ProcessInfoChip(label: context.loc.bound, value: context.loc.yes, icon: Icons.link_rounded, color: Colors.blue),
              ],
            ),
          ),
          if (service.appProcessRecord != null) ...[
            Divider(height: 1, color: colorScheme.outlineVariant.withValues(alpha: 0.2)),
            Padding(
              padding: EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.code_rounded, size: 14, color: colorScheme.tertiary),
                      AppStyles
                          .spacing4, // 6 in original, replacing with spacing4 (4) or spacing8. 6 is fine, using SizedBox(width: 6) via AppStyles.spacing4 is slightly less but consistent. Using spacing8 (8) is clearer. I'll use spacing4 (close to 6).
                      // Or just use AppStyles.spacing4 + spacing4? No. I'll use Sized(6) if needed or stick to 8 (spacing8). I'll use spacing8.
                      // Wait, I'll use AppStyles.spacing8.
                      Text(
                        context.loc.processRecord,
                        style: textTheme.bodySmall?.copyWith(fontSize: 11, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Container(
                    width: double.infinity,
                    padding: AppStyles.padding10,
                    decoration: BoxDecoration(color: colorScheme.surfaceContainerHighest, borderRadius: BorderRadius.circular(8)),
                    child: SelectableText(
                      service.appProcessRecord!,
                      style: TextStyle(fontSize: 11, fontFamily: 'monospace', color: colorScheme.onSurface),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
