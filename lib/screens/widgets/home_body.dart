import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/home_state_model.dart';
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
    return BlocSelector<
      HomeBloc,
      HomeState,
      ({bool isLoading, String? loadingMessage, bool isError, String? errorMessage, bool hasApps, HomeStateModel model})
    >(
      selector: (state) {
        final (isLoading, loadingMessage) = state.mapOrNull(loading: (s) => (true, s.message)) ?? (false, null);

        final (isError, errorMessage) = state.mapOrNull(failure: (s) => (true, s.message)) ?? (false, null);

        return (
          isLoading: isLoading,
          loadingMessage: loadingMessage,
          isError: isError,
          errorMessage: errorMessage,
          hasApps: state.value.allApps.isNotEmpty,
          model: state.value,
        );
      },
      builder: (context, data) {
        if (data.isLoading && !data.hasApps) {
          return LoadingState(status: data.loadingMessage);
        }

        if (data.isError && !data.hasApps) {
          return ErrorState(
            errorMessage: data.errorMessage ?? context.loc.error,
            onRetry: () => context.read<HomeBloc>().add(const HomeEvent.initializeShizuku()),
          );
        }

        final ram = (total: data.model.totalRamKb, used: data.model.usedRamKb, free: data.model.freeRamKb);

        return NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverPersistentHeader(
                pinned: true,
                delegate: FilterChipsDelegate(
                  child: ProcessFilterChips(
                    selectedFilter: data.model.selectedProcessFilter,
                    apps: data.model.allApps,
                    sortAscending: data.model.sortAscending,
                  ),
                ),
              ),
              if (ram.total > 0)
                SliverPersistentHeader(
                  pinned: false,
                  delegate: RamBarDelegate(
                    ramBar: RamBar(totalRamKb: ram.total, usedRamKb: ram.used, freeRamKb: ram.free),
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
                    AppList(apps: data.model.userApps, tabIndex: 1),
                    AppList(apps: data.model.systemApps, tabIndex: 2),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
