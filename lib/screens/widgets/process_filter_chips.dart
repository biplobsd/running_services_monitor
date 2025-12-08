import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/process_state_filter.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'filter_chip_widget.dart';

class ProcessFilterChips extends StatelessWidget {
  final ProcessStateFilter selectedFilter;
  final List<AppProcessInfo> apps;
  final bool sortAscending;

  const ProcessFilterChips({super.key, required this.selectedFilter, required this.apps, required this.sortAscending});

  @override
  Widget build(BuildContext context) {
    final activeCount = apps.where((a) => isActiveState(a.processState, hasServices: a.hasServices)).length;
    final cachedCount = apps.where((a) => isCachedState(a.processState) || a.isCached).length;
    final servicesCount = apps.where((a) => a.hasServices).length;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Row(
        children: [
          FilterChipWidget(
            label: context.loc.all,
            isSelected: selectedFilter == ProcessStateFilter.all,
            onSelected: () => context.read<HomeBloc>().add(const HomeEvent.setProcessFilter(ProcessStateFilter.all)),
            sortAscending: selectedFilter == ProcessStateFilter.all ? sortAscending : null,
          ),
          SizedBox(width: 8.w),
          FilterChipWidget(
            label: '${context.loc.active} ($activeCount)',
            isSelected: selectedFilter == ProcessStateFilter.active,
            onSelected: () => context.read<HomeBloc>().add(const HomeEvent.setProcessFilter(ProcessStateFilter.active)),
            color: Colors.green,
            sortAscending: selectedFilter == ProcessStateFilter.active ? sortAscending : null,
          ),
          SizedBox(width: 8.w),
          FilterChipWidget(
            label: '${context.loc.cached} ($cachedCount)',
            isSelected: selectedFilter == ProcessStateFilter.cached,
            onSelected: () => context.read<HomeBloc>().add(const HomeEvent.setProcessFilter(ProcessStateFilter.cached)),
            color: Colors.grey,
            sortAscending: selectedFilter == ProcessStateFilter.cached ? sortAscending : null,
          ),
          SizedBox(width: 8.w),
          FilterChipWidget(
            label: '${context.loc.services} ($servicesCount)',
            isSelected: selectedFilter == ProcessStateFilter.withServices,
            onSelected: () =>
                context.read<HomeBloc>().add(const HomeEvent.setProcessFilter(ProcessStateFilter.withServices)),
            color: Colors.blue,
            sortAscending: selectedFilter == ProcessStateFilter.withServices ? sortAscending : null,
          ),
        ],
      ),
    );
  }
}
