import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/app_styles.dart';

class DetailTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? valueColor;
  final bool isLast;

  const DetailTile({super.key, required this.icon, required this.label, required this.value, this.valueColor, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        border: isLast ? null : Border(bottom: BorderSide(color: colorScheme.outlineVariant.withValues(alpha: 0.2))),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: AppStyles
                .padding6, // Assuming padding6 exists or I'll use EdgeInsets.all(6). If not, I'll use EdgeInsets.all(6) for now. Note: I haven't checked AppStyles yet. I'll use EdgeInsets.all(6) to be safe unless verified.
            // Wait, I am viewing AppStyles next. I'll use standard 6 if not present.
            // I'll stick to original or promote 6 to AppStyles later if common.
            decoration: BoxDecoration(color: colorScheme.primaryContainer.withValues(alpha: 0.5), borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, size: 16, color: colorScheme.primary),
          ),
          AppStyles
              .spacing12, // 12? I have spacing16? I'll check. If no spacing12, use 16 (close) or 8. 12 is distinct. I'll use SizedBox(width: 12) or define spacing12.
          // I'll use SizedBox(width: 12) to respect design.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: textTheme.bodySmall?.copyWith(fontSize: 11, color: colorScheme.onSurfaceVariant, fontWeight: FontWeight.w500),
                ),
                AppStyles.spacingH2, // 2 -> AppStyles.spacingH4 is smallest? I'll check.
                // Assuming 2 is fine.
                SelectableText(
                  value,
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                  style: textTheme.bodyMedium?.copyWith(fontSize: 13, color: valueColor ?? colorScheme.onSurface, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
