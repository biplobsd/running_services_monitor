import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'dismissible_app_list_item.dart';
import 'empty_list_state.dart';

class AppList extends StatelessWidget {
  final List<AppProcessInfo> apps;

  const AppList({super.key, required this.apps});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, String>(
      selector: (state) => state.value.searchQuery,
      builder: (context, searchQuery) {
        final filteredApps = apps.where((app) {
          if (searchQuery.isEmpty) return true;
          final name = app.appName.toLowerCase();
          final pkg = app.packageName.toLowerCase();
          return name.contains(searchQuery) || pkg.contains(searchQuery);
        }).toList();

        Widget content;
        if (filteredApps.isEmpty) {
          content = EmptyListState(isSearching: searchQuery.isNotEmpty);
        } else {
          content = CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return DismissibleAppListItem(appInfo: filteredApps[index]);
                }, childCount: filteredApps.length),
              ),
            ],
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            final homeBloc = context.read<HomeBloc>();
            final future = homeBloc.stream.firstWhere((state) => !state.value.isLoading);
            homeBloc.add(const HomeEvent.loadData());
            await future;
          },
          child: content,
        );
      },
    );
  }
}
