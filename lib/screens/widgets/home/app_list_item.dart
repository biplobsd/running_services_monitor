import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:go_router/go_router.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/utils/format_utils.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../common/app_icon.dart';
import '../common/app_name_text.dart';
import '../common/status_badge.dart';

class AppListItem extends StatelessWidget {
  final AppProcessInfo appInfo;
  final int tabIndex;

  const AppListItem({super.key, required this.appInfo, required this.tabIndex});

  @override
  Widget build(BuildContext context) {
    final loc = context.loc;
    final processCount = appInfo.processCount;
    final serviceCount = appInfo.services.length;

    final subtitleText = _buildSubtitleText(loc, serviceCount, processCount);

    return ListTile(
      leading: Hero(
        tag: 'app-icon-$tabIndex-${appInfo.packageName}',
        child: AppIcon(appInfo: appInfo, size: 40.sp),
      ),
      title: AppNameText(packageName: appInfo.packageName, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppStyles.titleStyle),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subtitleText, style: Theme.of(context).textTheme.bodySmall),
          AppStyles.spacingH4,
          Wrap(
            spacing: 4.w,
            runSpacing: 2.h,
            children: [
              if (appInfo.isActive) StatusBadge(label: loc.active, color: Colors.green),
              if (appInfo.isCached) StatusBadge(label: loc.cached, color: Colors.grey),
              if (appInfo.hasServices) StatusBadge(label: loc.services, color: Colors.blue),
            ],
          ),
        ],
      ),
      trailing: BlocSelector<HomeBloc, HomeState, bool>(
        bloc: getIt<HomeBloc>(),
        selector: (state) => state.value.isLoadingRam && appInfo.totalRamInKb <= 0,
        builder: (context, showSkeleton) {
          return Skeletonizer(
            enabled: showSkeleton,
            child: Text(showSkeleton ? '00.0 MB' : appInfo.totalRamInKb.formatRam(), style: AppStyles.bodyStyle),
          );
        },
      ),
      onTap: () => _onTap(context),
    );
  }

  void _onTap(BuildContext context) {
    context.push('/app-details', extra: {'packageName': appInfo.packageName, 'tabIndex': tabIndex});
  }

  String _buildSubtitleText(dynamic loc, int serviceCount, int processCount) {
    final hasService = serviceCount > 0;
    final hasProcess = processCount > 0;
    if (hasService && hasProcess) {
      return loc.service_process_string(serviceCount, processCount);
    } else if (hasService) {
      return loc.service_string(serviceCount);
    } else if (hasProcess) {
      return loc.process_string(processCount);
    }
    return '';
  }
}
