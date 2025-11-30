import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'app_list.dart';
import 'ram_bar.dart';
import 'loading_state.dart';
import 'error_state.dart';

class HomeBody extends StatelessWidget {
  final TabController tabController;

  const HomeBody({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final value = state.value;
        final homeBloc = context.read<HomeBloc>();


        if (value.isLoading && value.allApps.isEmpty) {
          return LoadingState(status: value.loadingStatus);
        }


        if (value.errorMessage != null && value.allApps.isEmpty) {
          return ErrorState(
            errorMessage: value.errorMessage!,
            onRetry: () => homeBloc.add(const HomeEvent.initializeShizuku()),
          );
        }


        return BlocSelector<HomeBloc, HomeState, ({double total, double used, double apps, double free})>(
          selector: (state) => (
            total: state.value.totalRamKb,
            used: state.value.usedRamKb,
            apps: state.value.appsRamKb,
            free: state.value.freeRamKb,
          ),
          builder: (context, ram) {
            return NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                if (ram.total <= 0) {
                  return [];
                }
                return [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: _RamBarDelegate(
                      ramBar: RamBar(
                        totalRamKb: ram.total,
                        usedRamKb: ram.used,
                        appsRamKb: ram.apps,
                        freeRamKb: ram.free,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: Divider(height: 1.h)),
                ];
              },
              body:
                  BlocSelector<
                    HomeBloc,
                    HomeState,
                    ({List<AppProcessInfo> all, List<AppProcessInfo> user, List<AppProcessInfo> system})
                  >(
                    selector: (state) =>
                        (all: state.value.allApps, user: state.value.userApps, system: state.value.systemApps),
                    builder: (context, apps) {
                      return TabBarView(
                        controller: tabController,
                        children: [
                          AppList(apps: apps.all),
                          AppList(apps: apps.user),
                          AppList(apps: apps.system),
                        ],
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

class _RamBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget ramBar;

  _RamBarDelegate({required this.ramBar});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Theme.of(context).colorScheme.surface, child: ramBar);
  }

  @override
  double get maxExtent => 190.h;

  @override
  double get minExtent => 190.h;

  @override
  bool shouldRebuild(covariant _RamBarDelegate oldDelegate) {
    return ramBar != oldDelegate.ramBar;
  }
}
