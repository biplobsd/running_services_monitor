import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/bloc/stats_bloc/stats_bloc.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/screens/widgets/common/sliver_refresh_indicator.dart';
import 'package:running_services_monitor/screens/widgets/common/custom_scroll_provider.dart';
import 'ram_distribution_pie_chart.dart';
import 'top_ram_consumers_bar_chart.dart';
import 'services_vs_ram_bubble_chart.dart';
import 'gauge_chart.dart';
import 'funnel_chart.dart';
import 'waterfall_chart.dart';
import 'polar_chart.dart';
import 'process_vs_ram_line_chart.dart';
import 'services_vs_processes_scatter_chart.dart';
import 'process_state_vs_ram_chart.dart';

class StatsTab extends StatefulWidget {
  final int tabIndex;

  const StatsTab({super.key, this.tabIndex = 3});

  @override
  State<StatsTab> createState() => _StatsTabState();
}

class _StatsTabState extends State<StatsTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final scrollProvider = CustomScrollProviderData.of(context);

    return BlocProvider<StatsBloc>(
      create: (context) => getIt<StatsBloc>(),
      child: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          final ramInfo = state.value.systemRamInfo;
          if (ramInfo.totalRamKb > 0) {
            getIt<StatsBloc>().add(StatsEvent.addRamHistoryPoint(ramInfo.usedRamKb));
          }
        },
        child: RefreshWrapper(
          onRefresh: () async {
            final homeBloc = getIt<HomeBloc>();
            homeBloc.add(const HomeEvent.loadData(silent: true, notify: true));
            await Future.delayed(const Duration(milliseconds: 100));
            await homeBloc.stream.first;
          },
          child: SafeArea(
            top: false,
            child: CustomScrollView(
              controller: scrollProvider.scrollControllers[widget.tabIndex],
              slivers: [
                const SliverRefreshHeader(),
                SliverPadding(
                  padding: AppStyles.sectionPadding,
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      const ServicesVsRamBubbleChart(),
                      AppStyles.spacingH24,
                      const ProcessVsRamLineChart(),
                      AppStyles.spacingH24,
                      const ServicesVsProcessesScatterChart(),
                      AppStyles.spacingH24,
                      const ProcessStateVsRamChart(),
                      AppStyles.spacingH24,
                      const FunnelChart(),
                      AppStyles.spacingH24,
                      const WaterfallChart(),
                      AppStyles.spacingH24,
                      const GaugeChart(),
                      AppStyles.spacingH24,
                      const RamDistributionPieChart(),
                      AppStyles.spacingH24,
                      const PolarChart(),
                      AppStyles.spacingH24,
                      const TopRamConsumersBarChart(),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
