import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/bloc/app_info_bloc/app_info_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
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
    final loc = context.loc;

    String builDescText() {
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

    return Row(
      children: [
        Hero(
          tag: 'app-icon-${appInfo.packageName}',
          child: AppIcon(appInfo: appInfo),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: SelectionArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocSelector<AppInfoBloc, AppInfoState, String?>(
                  bloc: getIt<AppInfoBloc>(),
                  selector: (state) {
                    return state.value.cachedApps[appInfo.packageName]?.appName;
                  },
                  builder: (context, appName) {
                    return Text(appName ?? appInfo.appName, style: Theme.of(context).textTheme.headlineSmall);
                  },
                ),
                SizedBox(height: 4.h),
                Text(
                  appInfo.packageName,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                ),
                SizedBox(height: 4.h),
                Text(
                  builDescText(),
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
                    loc.info,
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
