import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:running_services_monitor/bloc/app_info_bloc/app_info_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'app_icon.dart';
import 'status_badge.dart';

class AppListItem extends StatelessWidget {
  final AppProcessInfo appInfo;

  const AppListItem({super.key, required this.appInfo});

  @override
  Widget build(BuildContext context) {
    final processCount = appInfo.pids.length;
    final serviceCount = appInfo.services.length;
    final loc = context.loc;

    String buildSubtitleText() {
      final hasService = serviceCount > 0;
      final hasProcess = processCount > 0;
      if (hasService && hasProcess) {
        return loc.service_process_string(serviceCount, processCount);
      } else if (hasService) {
        return loc.service_string(serviceCount);
      } else if (hasProcess) {
        return loc.process_string(processCount);
      } else {
        return '';
      }
    }

    return ListTile(
      leading: Hero(
        tag: 'app-icon-${appInfo.packageName}',
        child: AppIcon(appInfo: appInfo, size: 40.sp),
      ),
      title: BlocSelector<AppInfoBloc, AppInfoState, String?>(
        bloc: getIt<AppInfoBloc>(),
        selector: (state) {
          return state.value.cachedApps[appInfo.packageName]?.appName;
        },
        builder: (context, appName) {
          return Text(
            appName ?? appInfo.appName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16.sp),
          );
        },
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(buildSubtitleText(), style: Theme.of(context).textTheme.bodySmall),
          SizedBox(height: 4.h),
          Wrap(
            spacing: 4.w,
            runSpacing: 2.h,
            children: [
              if (appInfo.isActive) StatusBadge(label: loc.active, color: Colors.green),
              if (appInfo.isCachedProcess) StatusBadge(label: loc.cached, color: Colors.grey),
              if (appInfo.hasServices) StatusBadge(label: loc.services, color: Colors.blue),
            ],
          ),
        ],
      ),
      trailing: Text(appInfo.totalRam, style: TextStyle(fontSize: 14.sp)),
      onTap: () {
        context.push('/app-details', extra: appInfo.packageName);
      },
    );
  }
}
