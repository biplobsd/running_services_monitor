import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/bloc/app_info_bloc/app_info_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'status_badge.dart';

class StateBadges extends StatelessWidget {
  final AppProcessInfo appInfo;

  const StateBadges({super.key, required this.appInfo});

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;

    return BlocSelector<AppInfoBloc, AppInfoState, bool?>(
      bloc: getIt<AppInfoBloc>(),
      selector: (state) {
        final cached = state.value.cachedApps[appInfo.packageName];
        if (cached != null) {
          return cached.isSystemApp;
        }
        return appInfo.isSystemApp;
      },
      builder: (context, isSystemApp) {
        return Wrap(
          spacing: 8.w,
          runSpacing: 4.h,
          children: [
            if (isSystemApp == true)
              StatusBadge(
                label: loc.system,
                color: Colors.orange,
                fontSize: 12.sp,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              ),
            if (isSystemApp == false)
              StatusBadge(
                label: loc.user,
                color: Colors.teal,
                fontSize: 12.sp,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              ),
            if (appInfo.isActive)
              StatusBadge(
                label: loc.active,
                color: Colors.green,
                fontSize: 12.sp,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              ),
            if (appInfo.isCachedProcess)
              StatusBadge(
                label: loc.cached,
                color: Colors.grey,
                fontSize: 12.sp,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              ),
            if (appInfo.hasServices)
              StatusBadge(
                label: loc.services,
                color: Colors.blue,
                fontSize: 12.sp,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              ),
            for (final uid in appInfo.services.map((s) => s.uid).whereType<int>().toSet())
              StatusBadge(
                label: context.loc.uidLabel(uid),
                color: Colors.indigo,
                fontSize: 12.sp,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              ),
          ],
        );
      },
    );
  }
}
