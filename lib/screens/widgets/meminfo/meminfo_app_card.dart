import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/models/service_info.dart';
import '../common/app_icon.dart';
import '../common/app_name_text.dart';

class MemInfoAppCard extends StatelessWidget {
  final AppProcessInfo? appInfo;

  const MemInfoAppCard({super.key, required this.appInfo});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final secondaryContainer = colorScheme.secondaryContainer;
    final secondary = colorScheme.secondary;

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: secondaryContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12.rSafe),
        border: Border.all(color: secondary.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          if (appInfo != null) AppIcon(appInfo: appInfo!, size: 40.w) else Icon(Icons.android, size: 40.w),
          AppStyles.spacingH8,
          if (appInfo != null)
            AppNameText(
              packageName: appInfo!.packageName,
              style: AppStyles.subtitleStyle.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          else
            Text(
              'Unknown',
              style: AppStyles.subtitleStyle.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
