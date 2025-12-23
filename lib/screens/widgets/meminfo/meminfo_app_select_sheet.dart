import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/bloc/app_info_bloc/app_info_bloc.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/app_info_state_model.dart';
import 'package:running_services_monitor/models/service_info.dart';
import '../common/app_icon.dart';
import 'meminfo_app_selector.dart';

class MemInfoAppSelectSheet extends StatefulWidget {
  final List<AppProcessInfo> otherApps;
  final ValueChanged<String> onSelected;

  const MemInfoAppSelectSheet({super.key, required this.otherApps, required this.onSelected});

  static void show(BuildContext context, List<AppProcessInfo> otherApps, ValueChanged<String> onSelected) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => MemInfoAppSelectSheet(otherApps: otherApps, onSelected: onSelected),
    );
  }

  @override
  State<MemInfoAppSelectSheet> createState() => _MemInfoAppSelectSheetState();
}

class _MemInfoAppSelectSheetState extends State<MemInfoAppSelectSheet> {
  AppFilterType filterType = AppFilterType.all;

  List<AppProcessInfo> getFilteredApps(Map<String, CachedAppInfo> cachedApps) {
    if (filterType == AppFilterType.all) return widget.otherApps;
    return widget.otherApps.where((app) {
      final cached = cachedApps[app.packageName];
      bool isSystem;
      if (cached != null) {
        isSystem = cached.isSystemApp;
      } else {
        isSystem = app.isSystemApp == true;
      }
      return filterType == AppFilterType.system ? isSystem : !isSystem;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppInfoBloc, AppInfoState, Map<String, CachedAppInfo>>(
      bloc: getIt<AppInfoBloc>(),
      selector: (state) => state.value.cachedApps,
      builder: (context, cachedApps) {
        final filteredApps = getFilteredApps(cachedApps);
        final theme = Theme.of(context);
        final colorScheme = theme.colorScheme;

        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(context.loc.selectApp, style: AppStyles.titleStyle.copyWith(fontWeight: FontWeight.bold)),
                      IconButton(icon: AppStyles.closeIcon, onPressed: () => Navigator.of(context).pop()),
                    ],
                  ),
                ),
                Divider(height: 1, color: colorScheme.outlineVariant),
                Padding(
                  padding: AppStyles.paddingH16V8,
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
                SizedBox(height: 4.h),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    itemCount: filteredApps.length,
                    itemBuilder: (context, index) {
                      final app = filteredApps[index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 4.h),
                        child: ListTile(
                          leading: AppIcon(appInfo: app, size: 40.w),
                          title: BlocSelector<AppInfoBloc, AppInfoState, String?>(
                            bloc: getIt<AppInfoBloc>(),
                            selector: (state) => state.value.cachedApps[app.packageName]?.appName,
                            builder: (context, appName) {
                              return Text(
                                appName ?? app.packageName,
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                                overflow: TextOverflow.ellipsis,
                              );
                            },
                          ),
                          subtitle: Text(
                            app.packageName,
                            style: TextStyle(fontSize: 11.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                            widget.onSelected(app.packageName);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
