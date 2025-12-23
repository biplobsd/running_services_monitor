import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/screens/app_details_screen.dart';

class AppDetailsFilterChips extends StatelessWidget {
  final AppProcessInfo appInfo;
  final AppDetailsFilter selectedFilter;
  final ValueChanged<AppDetailsFilter> onFilterChanged;

  const AppDetailsFilterChips({super.key, required this.appInfo, required this.selectedFilter, required this.onFilterChanged});

  @override
  Widget build(BuildContext context) {
    final serviceCount = appInfo.services.length;
    final processCount = appInfo.processes.length;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          if (!appInfo.isCoreApp) ...[
            FilterChip(
              label: Text('${context.loc.services} ($serviceCount)'),
              selected: selectedFilter == AppDetailsFilter.services,
              onSelected: (_) => onFilterChanged(AppDetailsFilter.services),
            ),
            AppStyles.spacing8,
          ],
          FilterChip(
            label: Text('${context.loc.processes} ($processCount)'),
            selected: selectedFilter == AppDetailsFilter.processes,
            onSelected: (_) => onFilterChanged(AppDetailsFilter.processes),
          ),
          if (!appInfo.isCoreApp) ...[
            AppStyles.spacing8,
            FilterChip(
              label: Text(context.loc.memoryInfo),
              selected: selectedFilter == AppDetailsFilter.meminfo,
              onSelected: (_) => onFilterChanged(AppDetailsFilter.meminfo),
            ),
          ],
        ],
      ),
    );
  }
}
