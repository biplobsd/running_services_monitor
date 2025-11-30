import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/l10n/app_localizations.dart';
import 'app_icon.dart';

class AppListItem extends StatelessWidget {
  final AppProcessInfo appInfo;

  const AppListItem({super.key, required this.appInfo});

  @override
  Widget build(BuildContext context) {
    final processCount = appInfo.pids.length;
    final serviceCount = appInfo.services.length;

    return ListTile(
      leading: AppIcon(appInfo: appInfo, size: 40.sp),
      title: Text(appInfo.appName, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 16.sp)),
      subtitle: Text(
        '$processCount ${AppLocalizations.of(context)!.processAnd} $serviceCount ${AppLocalizations.of(context)!.services}',
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: Text(appInfo.totalRam, style: TextStyle(fontSize: 14.sp)),
      onTap: () {
        context.push('/app-details', extra: appInfo);
      },
    );
  }
}
