import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/bloc/app_info_bloc/app_info_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/models/service_info.dart';
import '../common/app_icon.dart';

class MemInfoAppCard extends StatelessWidget {
  final AppProcessInfo? appInfo;

  const MemInfoAppCard({super.key, required this.appInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12.rSafe),
        border: Border.all(color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          if (appInfo != null) AppIcon(appInfo: appInfo!, size: 40.w) else Icon(Icons.android, size: 40.w),
          SizedBox(height: 8.h),
          if (appInfo != null)
            BlocSelector<AppInfoBloc, AppInfoState, String?>(
              bloc: getIt<AppInfoBloc>(),
              selector: (state) => state.value.cachedApps[appInfo!.packageName]?.appName,
              builder: (context, appName) {
                return Text(
                  appName ?? appInfo!.appName,
                  style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                );
              },
            )
          else
            Text(
              'Unknown',
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
