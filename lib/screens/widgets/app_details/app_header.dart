import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/utils/format_utils.dart';
import '../common/app_icon.dart';
import '../common/app_name_text.dart';
import '../ram/ram_info_dialog.dart';

class AppHeader extends StatelessWidget {
  final AppProcessInfo appInfo;
  final int tabIndex;

  const AppHeader({super.key, required this.appInfo, required this.tabIndex});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Row(
      children: [
        Hero(
          tag: 'app-icon-$tabIndex-${appInfo.packageName}',
          child: AppIcon(appInfo: appInfo),
        ),
        AppStyles.spacing16,
        Expanded(
          child: SelectionArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppNameText(packageName: appInfo.packageName, style: textTheme.headlineSmall),
                AppStyles.spacingH4,
                Text(appInfo.packageName, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
              ],
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SelectionArea(child: Text(appInfo.totalRamInKb.formatRam(), style: textTheme.titleMedium)),
            if (appInfo.cachedMemoryKb > 0) ...[
              AppStyles.spacingH4, // Was 2.h, using H4 for consistency or spacingH4
              SelectionArea(
                child: Text('Cached: ${appInfo.cachedMemoryKb.formatRam()}', style: AppStyles.captionStyle.copyWith(color: Colors.grey)),
              ),
            ],
            AppStyles.spacingH4,
            GestureDetector(
              onTap: () => RamInfoBottomSheet.show(context, appInfo.packageName),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.info_outline, size: 14.sp, color: colorScheme.primary),
                  AppStyles.spacing4,
                  Text(context.loc.info, style: AppStyles.captionStyle.copyWith(color: colorScheme.primary)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
