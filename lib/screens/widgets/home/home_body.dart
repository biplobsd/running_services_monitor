import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/bloc/app_info_bloc/app_info_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/core/utils/helper.dart';
import 'package:running_services_monitor/l10n/l10n_keys.dart';
import 'package:running_services_monitor/models/home_state_model.dart';
import 'package:running_services_monitor/models/app_info_state_model.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/screens/widgets/home/stats/stats_tab.dart';
import 'app_list.dart';

import '../common/loading_state.dart';
import '../common/error_state.dart';
import '../service/process_filter_chips.dart';
import '../common/sliver_header_delegates.dart';
import '../common/custom_scroll_provider.dart';

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
            List<AppProcessInfo> coreApps,
            List<AppProcessInfo> filteredAllApps,
          })
        >(
          selector: (state) {
            final (isLoading, loadingMessage) = state.mapOrNull(loading: (s) => (true, s.message)) ?? (false, null);
            final (isError, errorMessage) = state.mapOrNull(failure: (s) => (true, s.message)) ?? (false, null);

            final showCoreApps = state.value.showCoreApps;
            final searchQuery = state.value.searchQuery;
            final rawApps = state.value.allApps;
            final allApps = showCoreApps ? rawApps : rawApps.where((a) => !a.isCoreApp).toList();

            final filteredAllApps = allApps.where((a) => Helper.matchesSearch(a, searchQuery, cachedApps)).toList();
            final userApps = filteredAllApps.where((a) => Helper.isSystemApp(a, cachedApps) == false && !a.isCoreApp).toList();
            final systemApps = filteredAllApps.where((a) => Helper.isSystemApp(a, cachedApps) == true && !a.isCoreApp).toList();
            final coreApps = showCoreApps ? rawApps.where((a) => a.isCoreApp && Helper.matchesSearch(a, searchQuery, cachedApps)).toList() : <AppProcessInfo>[];

            return (
              isLoading: isLoading,
              loadingMessage: loadingMessage,
              isError: isError,
              errorMessage: errorMessage,
              hasApps: allApps.isNotEmpty,
              model: state.value,
              userApps: userApps,
              systemApps: systemApps,
              coreApps: coreApps,
              filteredAllApps: filteredAllApps,
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

            return NestedScrollView(
              key: ValueKey(data.model.showCoreApps),
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  ListenableBuilder(
                    listenable: tabController.animation ?? const AlwaysStoppedAnimation(0.0),
                    builder: (context, child) {
                      final animation = tabController.animation;
                      if (animation == null) return const SizedBox.shrink();

                      final animValue = animation.value;
                      final progress = (animValue - 2.0).clamp(0.0, 1.0);

                      final defaultHeight = 52;
                      final currentHeight = defaultHeight * (1.0 - progress);
                      final slideOffset = defaultHeight * progress;
                      final opacity = (1.0 - progress).clamp(0.0, 1.0);

                      return SliverPersistentHeader(
                        pinned: true,
                        delegate: FilterChipsDelegate(
                          height: currentHeight,
                          opacity: opacity,
                          slideOffset: slideOffset,
                          child: ProcessFilterChips(
                            selectedFilter: data.model.selectedProcessFilter,
                            apps: switch (tabController.index) {
                              0 => data.filteredAllApps,
                              1 => data.userApps,
                              2 => data.systemApps,
                              3 => data.model.showCoreApps ? data.coreApps : [],
                              _ => data.filteredAllApps,
                            },
                            sortAscending: data.model.sortAscending,
                          ),
                        ),
                      );
                    },
                  ),
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
                        AppList(apps: data.filteredAllApps, tabIndex: 0),
                        AppList(apps: data.userApps, tabIndex: 1),
                        AppList(apps: data.systemApps, tabIndex: 2),
                        if (data.model.showCoreApps) AppList(apps: data.coreApps, tabIndex: 3),
                        StatsTab(tabIndex: data.model.showCoreApps ? 4 : 3),
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
