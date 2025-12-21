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
          })
        >(
          selector: (state) {
            final (isLoading, loadingMessage) = state.mapOrNull(loading: (s) => (true, s.message)) ?? (false, null);
            final (isError, errorMessage) = state.mapOrNull(failure: (s) => (true, s.message)) ?? (false, null);

            final allApps = state.value.allApps;
            final userApps = allApps.where((a) => Helper.isSystemApp(a, cachedApps) == false).toList();
            final systemApps = allApps.where((a) => Helper.isSystemApp(a, cachedApps) == true).toList();

            return (
              isLoading: isLoading,
              loadingMessage: loadingMessage,
              isError: isError,
              errorMessage: errorMessage,
              hasApps: allApps.isNotEmpty,
              model: state.value,
              userApps: userApps,
              systemApps: systemApps,
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
