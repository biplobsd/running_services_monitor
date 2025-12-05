import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import '../models/service_info.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'widgets/app_header.dart';
import 'widgets/service_list.dart';
import 'widgets/app_details_description.dart';
import 'widgets/app_details_section_title.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/app_details_bloc/app_details_bloc.dart';
import 'package:running_services_monitor/bloc/stop_service_bloc/stop_service_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';

class AppDetailsScreen extends StatelessWidget {
  final AppProcessInfo appInfo;

  const AppDetailsScreen({super.key, required this.appInfo});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AppDetailsBloc>()..add(AppDetailsEvent.loadDetails(appInfo))),
        BlocProvider(create: (context) => getIt<StopServiceBloc>()),
      ],
      child: BlocListener<StopServiceBloc, StopServiceState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            stopping: (_) {
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
            success: (packageName, servicePid) {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      const Icon(Icons.check_circle, color: Colors.white),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(context.loc.allServicesStopped, style: TextStyle(fontSize: 14.sp)),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.green[700],
                  duration: const Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                ),
              );

              if (packageName != null) {
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
                        child: Text('${context.loc.stopServiceError}: $message', style: TextStyle(fontSize: 14.sp)),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.red[700],
                  duration: const Duration(seconds: 4),
                  behavior: SnackBarBehavior.floating,
                  action: SnackBarAction(label: 'OK', textColor: Colors.white, onPressed: () {}),
                ),
              );
            },
          );
        },
        child: BlocBuilder<AppDetailsBloc, AppDetailsState>(
          builder: (context, state) {
            final currentAppInfo = state.maybeWhen(
              success: (info) => info,
              loading: (info) => info,
              failure: (info, _) => info,
              orElse: () => appInfo,
            );

            return Scaffold(
              appBar: AppBar(
                title: Text(context.loc.runningApp, style: TextStyle(fontSize: 20.sp)),
              ),
              body: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.all(24.0.w),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        AppHeader(appInfo: currentAppInfo),
                        SizedBox(height: 24.h),

                        const AppDetailsDescription(),

                        SizedBox(height: 32.h),
                        const Divider(),
                        SizedBox(height: 16.h),

                        AppDetailsSectionTitle(title: context.loc.activeServices),
                        SizedBox(height: 8.h),
                      ]),
                    ),
                  ),
                  SliverFillRemaining(hasScrollBody: true, child: ServiceList(services: currentAppInfo.services)),
                ],
              ),
              floatingActionButton: FloatingActionButton.extended(
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
                          if (currentAppInfo.isSystemApp) ...[
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
            );
          },
        ),
      ),
    );
  }
}
