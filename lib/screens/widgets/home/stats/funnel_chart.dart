import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'stats_chart_card.dart';

class FunnelChart extends StatelessWidget {
  const FunnelChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, List<AppProcessInfo>>(
      selector: (state) => state.value.allApps,
      builder: (context, apps) {
        if (apps.isEmpty) return const SizedBox.shrink();

        int tiny = 0;
        int small = 0;
        int medium = 0;
        int large = 0;
        int huge = 0;

        for (var app in apps) {
          final mb = app.totalRamInKb / 1024;
          if (mb < 10) {
            tiny++;
          } else if (mb < 50) {
            small++;
          } else if (mb < 100) {
            medium++;
          } else if (mb < 250) {
            large++;
          } else {
            huge++;
          }
        }

        final tiers = [
          (context.loc.statsTiny, tiny, Colors.green),
          (context.loc.statsSmall, small, Colors.teal),
          (context.loc.statsMedium, medium, Colors.blue),
          (context.loc.statsLarge, large, Colors.orange),
          (context.loc.statsHuge, huge, Colors.red),
        ];

        final maxCount = tiers.map((e) => e.$2).reduce((a, b) => a > b ? a : b);

        return StatsChartCard(
          title: context.loc.statsFunnelChart,
          subtitle: context.loc.statsFunnelSubtitle,
          height: 180,
          child: Column(
            children: tiers.asMap().entries.map((entry) {
              final index = entry.key;
              final tier = entry.value;
              final widthFactor = maxCount > 0 ? (tier.$2 / maxCount).clamp(0.2, 1.0) : 0.2;

              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    SizedBox(
                      width: 60,
                      child: Text(
                        tier.$1,
                        style: AppStyles.captionStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: FractionallySizedBox(
                          widthFactor: widthFactor,
                          child: Container(
                            height: 30 - (index * 2),
                            decoration: BoxDecoration(
                              color: tier.$3,
                              borderRadius: const BorderRadius.horizontal(left: Radius.circular(4), right: Radius.circular(15)),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '${tier.$2}',
                              style: AppStyles.bodyStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
