import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:installed_apps/installed_apps.dart';
import '../models/service_info.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/l10n/l10n_keys.dart';
import 'widgets/app_header.dart';
import 'widgets/service_list.dart';
import 'widgets/app_details_description.dart';
import 'widgets/app_details_section_title.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/stop_service_bloc/stop_service_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/bloc/app_info_bloc/app_info_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';

class AppDetailsScreen extends StatelessWidget {
  final String packageId;

  const AppDetailsScreen({super.key, required this.packageId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StopServiceBloc>(),
      child: BlocListener<HomeBloc, HomeState>(
        bloc: getIt<HomeBloc>(),
        listenWhen: (previous, current) {
          final prevApp = previous.value.allApps.any((app) => app.packageName == packageId);
          final currApp = current.value.allApps.any((app) => app.packageName == packageId);
          return prevApp && !currApp;
        },
        listener: (context, state) {
          if (context.mounted) {
            context.pop();
          }
        },
        child: BlocSelector<HomeBloc, HomeState, AppProcessInfo?>(
          bloc: getIt<HomeBloc>(),
          selector: (state) => state.value.allApps.firstWhereOrNull((app) => app.packageName == packageId),
          builder: (context, currentAppInfo) {
            if (currentAppInfo == null) {
              return const SizedBox.shrink();
            }

            return BlocListener<StopServiceBloc, StopServiceState>(
              listener: (context, state) {
                state.when(
                  initial: () {},
                  stopping: (_, _) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                            ),
                            const SizedBox(width: 16),
                            Text(context.loc.loading, style: TextStyle(fontSize: 14.sp)),
                          ],
                        ),
                        duration: const Duration(seconds: 10),
                        backgroundColor: Colors.blue[700],
                      ),
                    );
                  },
                  success: (packageName, serviceName, servicePid) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            const Icon(Icons.check_circle, color: Colors.white),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                serviceName != null
                                    ? '${context.loc.serviceStopped}: $serviceName'
                                    : context.loc.allServicesStopped,
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                          ],
                        ),
                        backgroundColor: Colors.green[700],
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );

                    if (serviceName != null && packageName != null) {
                      getIt<HomeBloc>().add(
                        HomeEvent.removeService(packageName: packageName, serviceName: serviceName),
                      );
                    } else if (packageName != null) {
                      getIt<HomeBloc>().add(HomeEvent.removeApp(packageName));
                      Future.delayed(const Duration(milliseconds: 500), () {
                        if (context.mounted) {
                          context.pop();
                        }
                      });
                    }
                  },
                  error: (message) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            const Icon(Icons.error, color: Colors.white),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                '${context.loc.stopServiceError}: ${context.loc.resolve(message)}',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                          ],
                        ),
                        backgroundColor: Colors.red[700],
                        duration: const Duration(seconds: 4),
                        behavior: SnackBarBehavior.floating,
                        action: SnackBarAction(label: context.loc.ok, textColor: Colors.white, onPressed: () {}),
                      ),
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
                body: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.only(left: 24.0.w, right: 24.0.w, top: 24.0.w, bottom: 5.0.w),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          AppHeader(appInfo: currentAppInfo),
                          SizedBox(height: 16.h),

                          _StateBadges(appInfo: currentAppInfo),
                          SizedBox(height: 16.h),

                          const AppDetailsDescription(),

                          SizedBox(height: 32.h),
                          const Divider(),
                          SizedBox(height: 16.h),

                          AppDetailsSectionTitle(title: context.loc.activeServices),
                          SizedBox(height: 5.h),
                          if (currentAppInfo.services.isEmpty)
                            Padding(
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
                        ]),
                      ),
                    ),
                    if (currentAppInfo.services.isNotEmpty) ServiceList(services: currentAppInfo.services),
                  ],
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
                                StopServiceEvent.stopAllServices(
                                  packageName: currentAppInfo.packageName,
                                  pids: currentAppInfo.pids,
                                ),
                              );
                            }
                          }
                        },
                        backgroundColor: Colors.red,
                        icon: const Icon(Icons.stop_circle),
                        label: Text(context.loc.stopAllServices, style: TextStyle(fontSize: 14.sp)),
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _StateBadges extends StatelessWidget {
  final AppProcessInfo appInfo;

  const _StateBadges({required this.appInfo});

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
            if (isSystemApp == true) _Badge(label: loc.system, color: Colors.orange),
            if (isSystemApp == false) _Badge(label: loc.user, color: Colors.teal),
            if (appInfo.isActive) _Badge(label: loc.active, color: Colors.green),
            if (appInfo.isCachedProcess) _Badge(label: loc.cached, color: Colors.grey),
            if (appInfo.hasServices) _Badge(label: loc.services, color: Colors.blue),
            for (final uid in appInfo.services.map((s) => s.uid).whereType<int>().toSet())
              _Badge(label: context.loc.uidLabel(uid), color: Colors.indigo),
          ],
        );
      },
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final Color color;

  const _Badge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: color.withValues(alpha: 0.5), width: 1),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 12.sp, color: color, fontWeight: FontWeight.w500),
      ),
    );
  }
}
