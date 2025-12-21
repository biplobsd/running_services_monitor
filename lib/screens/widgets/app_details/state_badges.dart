import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/bloc/app_info_bloc/app_info_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/service_info.dart';
import '../common/status_badge.dart';

import 'package:running_services_monitor/l10n/app_localizations.dart';

String getProcessStateDescription(String state, AppLocalizations loc) {
  final lower = state.toLowerCase();
  if (lower.startsWith('fg')) return loc.processStateFg;
  if (lower.startsWith('vis')) return loc.processStateVis;
  if (lower.startsWith('prev')) return loc.processStatePrev;
  if (lower.startsWith('prcp')) return loc.processStatePrcp;
  if (lower.startsWith('svcb')) return loc.processStateSvcb;
  if (lower.startsWith('home')) return loc.processStateHome;
  if (lower.startsWith('hvy')) return loc.processStateHvy;
  if (lower.startsWith('psvc')) return loc.processStatePsvc;
  if (lower.startsWith('pers')) return loc.processStatePers;
  if (lower.startsWith('cch-empty')) return loc.processStateCchEmpty;
  if (lower.startsWith('cch-act')) return loc.processStateCchAct;
  if (lower.startsWith('cch-client')) return loc.processStateCchClient;
  if (lower.startsWith('cch')) return loc.processStateCch;
  if (lower.startsWith('bfgs')) return loc.processStateBfgs;
  if (lower.startsWith('rcvr')) return loc.processStateRcvr;
  if (lower.startsWith('top')) return loc.processStateTop;
  if (lower.startsWith('btop')) return loc.processStateBtop;
  if (lower.startsWith('impf')) return loc.processStateImpf;
  if (lower.startsWith('impb')) return loc.processStateImpb;
  return loc.processStateUnknown(state);
}

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
            if (appInfo.isCached)
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
            if (appInfo.processState != null)
              StatusBadge(
                label: appInfo.processState!,
                color: Colors.deepPurple,
                fontSize: 12.sp,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text(loc.processStateTitle, style: TextStyle(fontSize: 18.sp)),
                      content: Text(
                        getProcessStateDescription(appInfo.processState!, loc),
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(ctx).pop(),
                          child: Text(loc.ok, style: TextStyle(fontSize: 14.sp)),
                        ),
                      ],
                    ),
                  );
                },
              ),
          ],
        );
      },
    );
  }
}
