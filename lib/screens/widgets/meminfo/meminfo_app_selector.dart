import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/bloc/app_info_bloc/app_info_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/service_info.dart';
import '../common/app_icon.dart';

enum AppFilterType { all, user, system }

class MemInfoAppSelector extends StatefulWidget {
  final List<AppProcessInfo> otherApps;
  final String? selectedPackage;
  final ValueChanged<String> onSelected;

  const MemInfoAppSelector({
    super.key,
    required this.otherApps,
    required this.selectedPackage,
    required this.onSelected,
  });

  @override
  State<MemInfoAppSelector> createState() => _MemInfoAppSelectorState();
}

class _MemInfoAppSelectorState extends State<MemInfoAppSelector> {
  AppFilterType filterType = AppFilterType.all;

  List<AppProcessInfo> get filteredApps {
    if (filterType == AppFilterType.all) return widget.otherApps;
    return widget.otherApps.where((app) {
      final isSystem =
          app.packageName.startsWith('com.android') ||
          app.packageName.startsWith('com.google') ||
          app.packageName.startsWith('android') ||
          app.packageName.startsWith('com.miui') ||
          app.packageName.startsWith('com.xiaomi') ||
          app.packageName.startsWith('com.qualcomm') ||
          app.packageName.startsWith('com.sec') ||
          app.packageName.startsWith('com.samsung');
      return filterType == AppFilterType.system ? isSystem : !isSystem;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: SegmentedButton<AppFilterType>(
                segments: [
                  ButtonSegment(
                    value: AppFilterType.all,
                    label: Text(context.loc.allApps, style: TextStyle(fontSize: 11.sp)),
                  ),
                  ButtonSegment(
                    value: AppFilterType.user,
                    label: Text(context.loc.userApps, style: TextStyle(fontSize: 11.sp)),
                  ),
                  ButtonSegment(
                    value: AppFilterType.system,
                    label: Text(context.loc.systemApps, style: TextStyle(fontSize: 11.sp)),
                  ),
                ],
                selected: {filterType},
                onSelectionChanged: (set) => setState(() => filterType = set.first),
                style: ButtonStyle(
                  visualDensity: VisualDensity.compact,
                  padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 8.w)),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12.rSafe),
            border: Border.all(color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: filteredApps.any((app) => app.packageName == widget.selectedPackage)
                  ? widget.selectedPackage
                  : null,
              hint: Text('${context.loc.selectApp} (${filteredApps.length})'),
              items: filteredApps.map((app) {
                return DropdownMenuItem(
                  value: app.packageName,
                  child: Row(
                    children: [
                      AppIcon(appInfo: app, size: 24.w),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: BlocSelector<AppInfoBloc, AppInfoState, String?>(
                          bloc: getIt<AppInfoBloc>(),
                          selector: (state) => state.value.cachedApps[app.packageName]?.appName,
                          builder: (context, appName) {
                            return Text(appName ?? app.appName, overflow: TextOverflow.ellipsis);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  widget.onSelected(value);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
