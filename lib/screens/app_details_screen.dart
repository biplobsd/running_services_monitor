import 'package:collection/collection.dart';
import 'package:expressive_refresh/expressive_refresh.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/l10n/l10n_keys.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/utils/snackbar_helper.dart';
import 'widgets/app_header.dart';
import 'widgets/service_list.dart';
import 'widgets/process_list.dart';
import 'widgets/app_details_description.dart';
import 'widgets/state_badges.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/stop_service_bloc/stop_service_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';

enum AppDetailsFilter { services, processes }

class AppDetailsScreen extends StatefulWidget {
  final String packageId;
  final int tabIndex;

  const AppDetailsScreen({super.key, required this.packageId, required this.tabIndex});

  @override
  State<AppDetailsScreen> createState() => _AppDetailsScreenState();
}

class _AppDetailsScreenState extends State<AppDetailsScreen> {
  AppDetailsFilter selectedFilter = AppDetailsFilter.services;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StopServiceBloc>(),
      child: BlocSelector<HomeBloc, HomeState, AppProcessInfo?>(
        bloc: getIt<HomeBloc>(),
        selector: (state) => state.value.allApps.firstWhereOrNull((app) => app.packageName == widget.packageId),
        builder: (context, currentAppInfo) {
          if (currentAppInfo == null) {
            return const SizedBox.shrink();
          }
      
          return BlocListener<StopServiceBloc, StopServiceState>(
            listener: (context, state) {
              state.when(
                initial: () {},
                stopping: (_, _) {
                  SnackBarHelper.showLoading(context, context.loc.loading);
                },
                success: (packageName, serviceName, pid) {
                  final homeBloc = getIt<HomeBloc>();
                  final message = serviceName != null
                      ? '${context.loc.serviceStopped}: $serviceName'
                      : context.loc.allServicesStopped;
                  SnackBarHelper.showSuccess(context, message);
      
                  if (packageName != null) {
                    if (serviceName != null) {
                      homeBloc.add(HomeEvent.removeService(packageName: packageName, serviceName: serviceName));
                    } else if (pid != null) {
                      homeBloc.add(HomeEvent.removeByPid(packageName: packageName, pid: pid));
      
                    } else {
                      homeBloc.add(HomeEvent.removeApp(packageName));
                      context.pop();
                    }
                  }
                },
                error: (message) {
                  SnackBarHelper.showError(
                    context,
                    '${context.loc.stopServiceError}: ${context.loc.resolve(message)}',
                    actionLabel: context.loc.ok,
                  );
                },
              );
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text(context.loc.appDetails, style: TextStyle(fontSize: 20.sp)),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.info_outline),
                    tooltip: context.loc.appInfoTooltip,
                    onPressed: () {
                      InstalledApps.openSettings(currentAppInfo.packageName);
                    },
                  ),
                ],
              ),
              body: ExpressiveRefreshIndicator.contained(
                onRefresh: () async {
                  final homeBloc = getIt<HomeBloc>();
                  homeBloc.add(const HomeEvent.loadData(silent: true, notify: true));
                  await Future.delayed(const Duration(milliseconds: 100));
                  await homeBloc.stream.first;
                },
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.only(left: 24.0.w, right: 24.0.w, top: 24.0.w, bottom: 5.0.w),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          AppHeader(appInfo: currentAppInfo, tabIndex: widget.tabIndex),
                          SizedBox(height: 16.h),
                          StateBadges(appInfo: currentAppInfo),
                          SizedBox(height: 16.h),
                          const AppDetailsDescription(),
                          SizedBox(height: 24.h),
                          const Divider(),
                          SizedBox(height: 8.h),
                          _buildFilterChips(context, currentAppInfo),
                          SizedBox(height: 8.h),
                        ]),
                      ),
                    ),
                    if (selectedFilter == AppDetailsFilter.services) ...[
                      if (currentAppInfo.services.isEmpty)
                        SliverPadding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          sliver: SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 24.h),
                              child: Center(
                                child: Text(
                                  context.loc.noServicesFound,
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      else
                        ServiceList(services: currentAppInfo.services),
                    ] else ...[
                      if (currentAppInfo.processes.isEmpty)
                        SliverPadding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          sliver: SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 24.h),
                              child: Center(
                                child: Text(
                                  context.loc.noProcessesFound,
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      else
                        ProcessList(processes: currentAppInfo.processes, packageName: currentAppInfo.packageName),
                    ],
                  ],
                ),
              ),
              floatingActionButton: currentAppInfo.pids.isEmpty
                  ? null
                  : FloatingActionButton.extended(
                      onPressed: () async {
                        final confirmed = await showDialog<bool>(
                          context: context,
                          builder: (dialogContext) => AlertDialog(
                            title: Text(context.loc.stopAllServicesConfirm, style: TextStyle(fontSize: 18.sp)),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentAppInfo.appName,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                                ),
                                SizedBox(height: 8.h),
                                Text(context.loc.stopServiceWarning, style: TextStyle(fontSize: 14.sp)),
                                if (currentAppInfo.isSystemApp ?? false) ...[
                                  SizedBox(height: 12.h),
                                  Container(
                                    padding: EdgeInsets.all(12.w),
                                    decoration: BoxDecoration(
                                      color: Colors.red[900]?.withValues(alpha: 0.3),
                                      border: Border.all(color: Colors.red, width: 2.w),
                                      borderRadius: BorderRadius.circular(8.rSafe),
                                    ),
                                    child: Text(
                                      context.loc.systemAppWarning,
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.error,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(dialogContext).pop(false),
                                child: Text(context.loc.cancel, style: TextStyle(fontSize: 14.sp)),
                              ),
                              FilledButton(
                                onPressed: () => Navigator.of(dialogContext).pop(true),
                                style: FilledButton.styleFrom(backgroundColor: Colors.red),
                                child: Text(context.loc.stop, style: TextStyle(fontSize: 14.sp)),
                              ),
                            ],
                          ),
                        );
      
                        if (confirmed == true) {
                          if (context.mounted) {
                            context.read<StopServiceBloc>().add(
                              StopServiceEvent.stopAllServices(packageName: currentAppInfo.packageName),
                            );
                          }
                        }
                      },
                      icon: const Icon(Icons.stop_circle),
                      label: Text(context.loc.stopAllServices, style: TextStyle(fontSize: 14.sp)),
                    ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFilterChips(BuildContext context, AppProcessInfo appInfo) {
    final serviceCount = appInfo.services.length;
    final processCount = appInfo.processes.length;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8.w,
        children: [
          FilterChip(
            label: Text('${context.loc.services} ($serviceCount)'),
            selected: selectedFilter == AppDetailsFilter.services,
            onSelected: (_) => setState(() => selectedFilter = AppDetailsFilter.services),
          ),
          FilterChip(
            label: Text('${context.loc.processes} ($processCount)'),
            selected: selectedFilter == AppDetailsFilter.processes,
            onSelected: (_) => setState(() => selectedFilter = AppDetailsFilter.processes),
          ),
        ],
      ),
    );
  }
}
