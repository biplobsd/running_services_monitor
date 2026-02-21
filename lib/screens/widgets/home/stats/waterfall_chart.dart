import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/system_ram_info.dart';
import 'stats_chart_card.dart';

class WaterfallChart extends StatelessWidget {
  const WaterfallChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, SystemRamInfo>(
      selector: (state) => state.value.systemRamInfo,
      builder: (context, ramInfo) {
        if (ramInfo.totalRamKb == 0) return const SizedBox.shrink();

        final total = ramInfo.totalRamKb;
        final usedPss = ramInfo.usedPssKb;
        final kernel = ramInfo.kernelKb;
        final cached = ramInfo.cachedPssKb;
        final free = ramInfo.freeRamKb;

        final items = [
          (context.loc.totalRam, total, Colors.blue, true),
          (context.loc.usedPss, usedPss, Colors.red, false),
          (context.loc.kernel, kernel, Colors.orange, false),
          (context.loc.cachedPss, cached, Colors.amber, false),
          (context.loc.free, free, Colors.green, false),
        ];

        return StatsChartCard(
          title: context.loc.statsWaterfallChart,
          subtitle: context.loc.statsWaterfallSubtitle,
          child: Column(
            children: items.asMap().entries.map((entry) {
              final item = entry.value;
              final widthFactor = total > 0 ? (item.$2 / total).clamp(0.05, 1.0) : 0.05;

              return Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(item.$1, style: AppStyles.captionStyle, overflow: TextOverflow.ellipsis),
                    ),
                    AppStyles.spacing8,
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            height: 20,
                            decoration: BoxDecoration(color: Theme.of(context).dividerColor.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(4)),
                          ),
                          FractionallySizedBox(
                            widthFactor: widthFactor,
                            child: Container(
                              height: 20,
                              decoration: BoxDecoration(color: item.$3, borderRadius: BorderRadius.circular(4)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppStyles.spacing8,
                    SizedBox(
                      width: 50,
                      child: Text(
                        '${(item.$2 / 1024 / 1024).toStringAsFixed(1)}G',
                        style: AppStyles.captionStyle.copyWith(fontSize: 10, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.end,
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
