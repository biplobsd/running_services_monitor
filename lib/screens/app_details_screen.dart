import 'package:collection/collection.dart';
import 'package:expressive_refresh/expressive_refresh.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/l10n/l10n_keys.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/utils/snackbar_helper.dart';
import 'widgets/app_details/app_header.dart';
import 'widgets/service/service_list.dart';
import 'widgets/service/process_list.dart';
import 'widgets/app_details/app_details_description.dart';
import 'widgets/app_details/state_badges.dart';
import 'widgets/meminfo/meminfo_details_widget.dart';
import 'widgets/app_details/app_details_filter_chips.dart';
import 'widgets/app_details/useful_commands_bottom_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/stop_service_bloc/stop_service_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/core/utils/android_settings_helper.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';

enum AppDetailsFilter { services, processes, meminfo }

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
          final loc = context.loc;
          if (currentAppInfo == null) {
            return Scaffold(
              appBar: AppBar(title: Text(loc.appDetails, style: AppStyles.headlineStyle)),
              body: Center(child: Text(loc.noOutput)),
            );
          }

          return BlocListener<StopServiceBloc, StopServiceState>(
            listener: (context, state) {
              state.when(
                initial: () {},
                stopping: (_, _) {
                  SnackBarHelper.showLoading(context, loc.loading);
                },
                success: (packageName, serviceName, pid) {
                  final homeBloc = getIt<HomeBloc>();
                  final message = serviceName != null ? '${loc.serviceStopped}: $serviceName' : loc.allServicesStopped;
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
                  SnackBarHelper.showError(context, '${loc.stopServiceError}: ${context.loc.resolve(message)}', actionLabel: loc.ok);
                },
              );
            },
            child: Scaffold(
              extendBody: true,
              appBar: AppBar(
                title: Text(loc.appDetails, style: AppStyles.headlineStyle),
                actions: [
                  IconButton(
                    icon: AppStyles.playIcon,
                    tooltip: loc.commands,
                    onPressed: () => UsefulCommandsBottomSheet.show(context, currentAppInfo.packageName, appInfo: currentAppInfo),
                  ),
                  IconButton(
                    icon: AppStyles.infoIcon,
                    tooltip: loc.appInfoTooltip,
                    onPressed: () {
                      AndroidSettingsHelper.openAppInfo(currentAppInfo.packageName);
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
                      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 24.0, bottom: 5.0),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate([
                          AppHeader(appInfo: currentAppInfo, tabIndex: widget.tabIndex),
                          AppStyles.spacingH16,
                          StateBadges(appInfo: currentAppInfo),
                          AppStyles.spacingH16,
                          const AppDetailsDescription(),
                          SizedBox(height: 24),
                          const Divider(),
                        ]),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Builder(
                        builder: (context) {
                          if (currentAppInfo.isCoreApp && selectedFilter == AppDetailsFilter.services) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              if (mounted) setState(() => selectedFilter = AppDetailsFilter.processes);
                            });
                          }
                          return AppDetailsFilterChips(
                            appInfo: currentAppInfo,
                            selectedFilter: selectedFilter,
                            onFilterChanged: (filter) => setState(() => selectedFilter = filter),
                          );
                        },
                      ),
                    ),
                    if (selectedFilter == AppDetailsFilter.services) ...[
                      if (currentAppInfo.services.isEmpty)
                        SliverPadding(
                          padding: AppStyles.listPadding,
                          sliver: SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 24),
                              child: Center(
                                child: Text(
                                  loc.noServicesFound,
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                                ),
                              ),
                            ),
                          ),
                        )
                      else
                        ServiceList(services: currentAppInfo.services),
                    ] else if (selectedFilter == AppDetailsFilter.meminfo) ...[
                      SliverPadding(
                        padding: AppStyles.listPadding,
                        sliver: SliverToBoxAdapter(child: MemInfoDetailsWidget(packageName: currentAppInfo.packageName)),
                      ),
                    ] else ...[
                      if (currentAppInfo.processes.isEmpty)
                        SliverPadding(
                          padding: AppStyles.listPadding,
                          sliver: SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 24),
                              child: Center(
                                child: Text(
                                  loc.noProcessesFound,
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
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
              floatingActionButton: currentAppInfo.isCoreApp || currentAppInfo.pids.isEmpty
                  ? null
                  : FloatingActionButton.extended(
                      onPressed: () async {
                        final confirmed = await showDialog<bool>(
                          context: context,
                          builder: (dialogContext) => AlertDialog(
                            title: Text(loc.stopAllServicesConfirm, style: TextStyle(fontSize: 18)),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(currentAppInfo.packageName, style: AppStyles.titleStyle.copyWith(fontWeight: FontWeight.bold)),
                                AppStyles.spacingH8,
                                Text(loc.stopServiceWarning, style: AppStyles.bodyStyle),
                                if (currentAppInfo.isSystemApp ?? false) ...[
                                  SizedBox(height: 12),
                                  Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.red[900]?.withValues(alpha: 0.3),
                                      border: Border.all(color: Colors.red, width: 2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      loc.systemAppWarning,
                                      style: TextStyle(color: Theme.of(context).colorScheme.error, fontWeight: FontWeight.bold, fontSize: 13),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(dialogContext).pop(false),
                                child: Text(loc.cancel, style: AppStyles.bodyStyle),
                              ),
                              FilledButton(
                                onPressed: () => Navigator.of(dialogContext).pop(true),
                                child: Text(loc.stop, style: AppStyles.bodyStyle),
                              ),
                            ],
                          ),
                        );

                        if (confirmed == true) {
                          if (context.mounted) {
                            context.read<StopServiceBloc>().add(StopServiceEvent.stopAllServices(packageName: currentAppInfo.packageName));
                          }
                        }
                      },
                      icon: AppStyles.stopIcon,
                      label: Text(loc.stopAllServices, style: AppStyles.bodyStyle),
                    ),
            ),
          );
        },
      ),
    );
  }
}
