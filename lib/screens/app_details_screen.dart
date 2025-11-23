import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/service_info.dart';
import 'package:running_services_monitor/l10n/app_localizations.dart';
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
                      Text(AppLocalizations.of(context)!.loading),
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
                      Expanded(child: Text(AppLocalizations.of(context)!.allServicesStopped)),
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
                      Expanded(child: Text('${AppLocalizations.of(context)!.stopServiceError}: $message')),
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

            return SelectionArea(
              child: Scaffold(
                appBar: AppBar(title: Text(AppLocalizations.of(context)!.runningApp)),
                body: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.all(24.0),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          AppHeader(appInfo: currentAppInfo),
                          const SizedBox(height: 24),

                          // Description
                          const AppDetailsDescription(),

                          const SizedBox(height: 32),
                          const Divider(),
                          const SizedBox(height: 16),

                          // Service List
                          AppDetailsSectionTitle(title: AppLocalizations.of(context)!.activeServices),
                          const SizedBox(height: 8),
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
                        title: Text(AppLocalizations.of(context)!.stopAllServicesConfirm),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(currentAppInfo.appName, style: const TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            Text(AppLocalizations.of(context)!.stopServiceWarning),
                            if (currentAppInfo.isSystemApp) ...[
                              const SizedBox(height: 12),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.red[900]?.withValues(alpha: 0.3),
                                  border: Border.all(color: Colors.red, width: 2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  AppLocalizations.of(context)!.systemAppWarning,
                                  style: TextStyle(color: Colors.red[300], fontWeight: FontWeight.bold, fontSize: 13),
                                ),
                              ),
                            ],
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(dialogContext).pop(false),
                            child: Text(AppLocalizations.of(context)!.cancel),
                          ),
                          FilledButton(
                            onPressed: () => Navigator.of(dialogContext).pop(true),
                            style: FilledButton.styleFrom(backgroundColor: Colors.red),
                            child: Text(AppLocalizations.of(context)!.stop),
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
                  label: Text(AppLocalizations.of(context)!.stopAllServices),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
