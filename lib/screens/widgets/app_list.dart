import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/models/process_state_filter.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/models/system_ram_info.dart';
import 'app_list_item.dart';
import 'empty_list_state.dart';
import 'custom_scroll_provider.dart';
import 'ram_bar.dart';
import 'sliver_refresh_indicator.dart';

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

    return SliverRefreshIndicator(
      onRefresh: () async {
        final homeBloc = getIt<HomeBloc>();
        homeBloc.add(const HomeEvent.loadData(silent: true, notify: true));
        await Future.delayed(const Duration(milliseconds: 100));
        await homeBloc.stream.first;
      },
      child: BlocSelector<HomeBloc, HomeState, List<AppProcessInfo>>(
        selector: (state) {
          var filteredApps = widget.apps.where((app) {
            if (state.value.searchQuery.trim().isNotEmpty) {
              final name = app.appName.trim().toLowerCase();
              final pkg = app.packageName.trim().toLowerCase();
              if (!name.contains(state.value.searchQuery.trim().toLowerCase()) && !pkg.contains(state.value.searchQuery.trim().toLowerCase())) {
                return false;
              }
            }
            return state.value.selectedProcessFilter.matchesAppState(
              app.processState,
              app.hasServices,
              isCached: app.isCached,
            );
          }).toList();

          if (state.value.sortAscending) {
            filteredApps.sort((a, b) => a.totalRamInKb.compareTo(b.totalRamInKb));
          } else {
            filteredApps.sort((a, b) => b.totalRamInKb.compareTo(a.totalRamInKb));
          }
          return filteredApps;
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
              SliverToBoxAdapter(
                child: BlocSelector<HomeBloc, HomeState, ({SystemRamInfo ramInfo, bool isLoading})>(
                  selector: (state) =>
                      (ramInfo: state.value.systemRamInfo, isLoading: state.mapOrNull(loading: (_) => true) ?? false),
                  builder: (context, state) {
                    if (widget.tabIndex != 0 || state.ramInfo.totalRamKb <= 0) {
                      return const SizedBox.shrink();
                    }
                    return Column(
                      children: [
                        Container(
                          color: Theme.of(context).colorScheme.surface,
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: RamBar(ramInfo: state.ramInfo, isLoading: state.isLoading),
                        ),
                        Divider(height: 1.h),
                      ],
                    );
                  },
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return AppListItem(appInfo: filteredApps[index], tabIndex: widget.tabIndex);
                }, childCount: filteredApps.length),
              ),
            ],
          );
        },
      ),
    );
  }
}
