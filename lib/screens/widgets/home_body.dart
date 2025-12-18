import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/bloc/app_info_bloc/app_info_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/l10n/l10n_keys.dart';
import 'package:running_services_monitor/models/home_state_model.dart';
import 'package:running_services_monitor/models/app_info_state_model.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'app_list.dart';
import 'ram_bar.dart';
import 'loading_state.dart';
import 'error_state.dart';
import 'process_filter_chips.dart';
import 'sliver_header_delegates.dart';
import 'custom_scroll_provider.dart';

class HomeBody extends StatelessWidget {
  final TabController tabController;

  const HomeBody({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppInfoBloc, AppInfoState, Map<String, CachedAppInfo>>(
      bloc: getIt<AppInfoBloc>(),
      selector: (state) => state.value.cachedApps,
      builder: (context, cachedApps) {
        return BlocSelector<
          HomeBloc,
          HomeState,
          ({
            bool isLoading,
            String? loadingMessage,
            bool isError,
            String? errorMessage,
            bool hasApps,
            HomeStateModel model,
            List<AppProcessInfo> userApps,
            List<AppProcessInfo> systemApps,
            double appsRam,
          })
        >(
          selector: (state) {
            final (isLoading, loadingMessage) = state.mapOrNull(loading: (s) => (true, s.message)) ?? (false, null);
            final (isError, errorMessage) = state.mapOrNull(failure: (s) => (true, s.message)) ?? (false, null);

            final allApps = state.value.allApps;

            bool? isSystemApp(AppProcessInfo app) {
              final cached = cachedApps[app.packageName];
              if (cached != null) {
                return cached.isSystemApp;
              }
              return app.isSystemApp;
            }

            final userApps = allApps.where((a) => isSystemApp(a) == false).toList()
              ..sort((a, b) => b.totalRamInKb.compareTo(a.totalRamInKb));
            final systemApps = allApps.where((a) => isSystemApp(a) == true).toList()
              ..sort((a, b) => b.totalRamInKb.compareTo(a.totalRamInKb));
            final appsRam = allApps.fold(0.0, (sum, a) => sum + a.totalRamInKb);

            return (
              isLoading: isLoading,
              loadingMessage: loadingMessage,
              isError: isError,
              errorMessage: errorMessage,
              hasApps: allApps.isNotEmpty,
              model: state.value,
              userApps: userApps,
              systemApps: systemApps,
              appsRam: appsRam,
            );
          },
          builder: (context, data) {
            if (data.isLoading && !data.hasApps) {
              return LoadingState(status: data.loadingMessage);
            }

            if (data.isError && !data.hasApps) {
              return ErrorState(
                errorMessage: context.loc.resolve(data.errorMessage),
                onRetry: () => context.read<HomeBloc>().add(const HomeEvent.initializeShizuku()),
              );
            }

            final ramInfo = data.model.systemRamInfo;

            return NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  ListenableBuilder(
                    listenable: tabController,
                    builder: (context, child) {
                      return SliverPersistentHeader(
                        pinned: true,
                        delegate: FilterChipsDelegate(
                          child: ProcessFilterChips(
                            selectedFilter: data.model.selectedProcessFilter,
                            apps: switch (tabController.index) {
                              0 => data.model.allApps,
                              1 => data.userApps,
                              2 => data.systemApps,
                              _ => data.model.allApps,
                            },
                            sortAscending: data.model.sortAscending,
                          ),
                        ),
                      );
                    },
                  ),
                  if (ramInfo.totalRamKb > 0)
                    SliverToBoxAdapter(
                      child: Container(
                        color: Theme.of(context).colorScheme.surface,
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: RamBar(ramInfo: ramInfo, isLoading: data.isLoading),
                      ),
                    ),
                  SliverToBoxAdapter(child: Divider(height: 1.h)),
                ];
              },
              body: Builder(
                builder: (context) {
                  return CustomScrollProvider(
                    tabController: tabController,
                    parent: PrimaryScrollController.of(context),
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        AppList(apps: data.model.allApps, tabIndex: 0),
                        AppList(apps: data.userApps, tabIndex: 1),
                        AppList(apps: data.systemApps, tabIndex: 2),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
