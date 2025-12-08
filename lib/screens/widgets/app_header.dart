import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/utils/format_utils.dart';
import 'app_icon.dart';
import 'ram_info_dialog.dart';

class AppHeader extends StatelessWidget {
  final AppProcessInfo appInfo;

  const AppHeader({super.key, required this.appInfo});

  @override
  Widget build(BuildContext context) {
    final processCount = appInfo.pids.length;
    final serviceCount = appInfo.services.length;

    return Row(
      children: [
        AppIcon(appInfo: appInfo),
        SizedBox(width: 16.w),
        Expanded(
          child: SelectionArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(appInfo.appName, style: Theme.of(context).textTheme.headlineSmall),
                SizedBox(height: 4.h),
                Text(
                  appInfo.packageName,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                ),
                SizedBox(height: 4.h),
                Text(
                  '$processCount process and $serviceCount services',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SelectionArea(child: Text(appInfo.totalRam, style: Theme.of(context).textTheme.titleMedium)),
            if (appInfo.cachedMemoryKb > 0) ...[
              SizedBox(height: 2.h),
              SelectionArea(
                child: Text(
                  'Cached: ${formatRam(appInfo.cachedMemoryKb)}',
                  style: TextStyle(fontSize: 11.sp, color: Colors.grey),
                ),
              ),
            ],
            SizedBox(height: 4.h),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => RamInfoDialog(appInfo: appInfo),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.info_outline, size: 14.sp, color: Theme.of(context).colorScheme.primary),
                  SizedBox(width: 4.w),
                  Text(
                    'Info',
                    style: TextStyle(fontSize: 11.sp, color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
