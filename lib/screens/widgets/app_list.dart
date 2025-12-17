import 'package:expressive_refresh/expressive_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/models/process_state_filter.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'app_list_item.dart';
import 'empty_list_state.dart';
import 'custom_scroll_provider.dart';

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

    return BlocSelector<HomeBloc, HomeState, ({String searchQuery, ProcessStateFilter processFilter, bool sortAscending})>(
      selector: (state) => (
        searchQuery: state.value.searchQuery,
        processFilter: state.value.selectedProcessFilter,
        sortAscending: state.value.sortAscending,
      ),
      builder: (context, data) {
        var filteredApps = widget.apps.where((app) {
          if (data.searchQuery.isNotEmpty) {
            final name = app.appName.toLowerCase();
            final pkg = app.packageName.toLowerCase();
            if (!name.contains(data.searchQuery) && !pkg.contains(data.searchQuery)) {
              return false;
            }
          }

          return data.processFilter.matchesAppState(app.processState, app.hasServices, isCached: app.isCached);
        }).toList();

        if (data.sortAscending) {
          filteredApps.sort((a, b) => a.totalRamInKb.compareTo(b.totalRamInKb));
        } else {
          filteredApps.sort((a, b) => b.totalRamInKb.compareTo(a.totalRamInKb));
        }

        Widget content;
        if (filteredApps.isEmpty) {
          content = EmptyListState(isSearching: data.searchQuery.isNotEmpty);
        } else {
          content = CustomScrollView(
            controller: scrollProvider.scrollControllers[widget.tabIndex],
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return AppListItem(appInfo: filteredApps[index], tabIndex: widget.tabIndex);
                }, childCount: filteredApps.length),
              ),
            ],
          );
        }

        return ExpressiveRefreshIndicator.contained(
          edgeOffset: 15.h,
          onRefresh: () async {
            final homeBloc = getIt<HomeBloc>();
            homeBloc.add(const HomeEvent.loadData(silent: true, notify: true));
            await Future.delayed(const Duration(milliseconds: 100));
            await homeBloc.stream.first;
          },
          child: content,
        );
      },
    );
  }
}
