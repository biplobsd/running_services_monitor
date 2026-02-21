import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/app_info_bloc/app_info_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/utils/helper.dart';
import 'package:running_services_monitor/models/app_info_state_model.dart';
import 'package:running_services_monitor/models/process_state_filter.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/models/system_ram_info.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'app_list_item.dart';
import '../common/empty_list_state.dart';
import '../common/custom_scroll_provider.dart';
import '../ram/ram_bar.dart';
import '../common/sliver_refresh_indicator.dart';

class AppList extends StatefulWidget {
  final List<AppProcessInfo> apps;
  final int tabIndex;

  const AppList({super.key, required this.apps, required this.tabIndex});

  @override
  State<AppList> createState() => _AppListState();
}

class _AppListState extends State<AppList> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final scrollProvider = CustomScrollProviderData.of(context);

    return RefreshWrapper(
      onRefresh: () async {
        final homeBloc = getIt<HomeBloc>();
        homeBloc.add(const HomeEvent.loadData(silent: true, notify: true));
        await Future.delayed(const Duration(milliseconds: 100));
        await homeBloc.stream.first;
      },
      child: BlocSelector<AppInfoBloc, AppInfoState, Map<String, CachedAppInfo>>(
        bloc: getIt<AppInfoBloc>(),
        selector: (state) => state.value.cachedApps,
        builder: (context, cachedApps) {
          return BlocSelector<HomeBloc, HomeState, List<AppProcessInfo>>(
            selector: (state) {
              final filteredApps = widget.apps.where((app) => state.value.selectedProcessFilter.matches(app)).toList();
              return Helper.sortApps(filteredApps, state.value.sortAscending);
            },
            builder: (context, filteredApps) {
              if (filteredApps.isEmpty) {
                return BlocSelector<HomeBloc, HomeState, bool>(
                  selector: (state) => state.value.searchQuery.isNotEmpty,
                  builder: (context, isSearching) => EmptyListState(isSearching: isSearching),
                );
              }
              return CustomScrollView(
                controller: scrollProvider.scrollControllers[widget.tabIndex],
                slivers: [
                  const SliverRefreshHeader(),
                  SliverToBoxAdapter(
                    child: widget.tabIndex != 0
                        ? const SizedBox.shrink()
                        : BlocSelector<HomeBloc, HomeState, ({SystemRamInfo ramInfo, bool showSkeleton, bool isLoadingRam})>(
                            selector: (state) {
                              final rawRamInfo = state.value.systemRamInfo;
                              final showSkeleton = state.value.isLoadingRam && rawRamInfo.totalRamKb <= 0;
                              final ramInfo = rawRamInfo.totalRamKb > 0
                                  ? rawRamInfo
                                  : const SystemRamInfo(totalRamKb: 8000000, usedRamKb: 4000000, freeRamKb: 4000000);
                              return (ramInfo: ramInfo, showSkeleton: showSkeleton, isLoadingRam: state.value.isLoadingRam);
                            },
                            builder: (context, state) {
                              return Column(
                                children: [
                                  Skeletonizer(
                                    enabled: state.showSkeleton,
                                    child: Container(
                                      color: Theme.of(context).colorScheme.surface,
                                      padding: EdgeInsets.only(bottom: 10),
                                      child: RamBar(ramInfo: state.ramInfo, isLoading: state.isLoadingRam),
                                    ),
                                  ),
                                  Divider(height: 1),
                                ],
                              );
                            },
                          ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return AppListItem(key: ValueKey(filteredApps[index].packageName), appInfo: filteredApps[index], tabIndex: widget.tabIndex);
                    }, childCount: filteredApps.length),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
