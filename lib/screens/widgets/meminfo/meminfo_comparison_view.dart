import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/bloc/home_bloc/home_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/meminfo_data.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'meminfo_comparison_row.dart';
import 'meminfo_compare_bar_chart.dart';
import 'meminfo_compare_pie_charts.dart';
import 'meminfo_compare_radar_chart.dart';

class MemInfoComparisonView extends StatelessWidget {
  final MemInfoData currentData;
  final MemInfoData comparisonData;
  final List<AppProcessInfo> otherApps;
  final String packageName;
  final VoidCallback? onCurrentAppTap;
  final VoidCallback? onCompareAppTap;

  const MemInfoComparisonView({
    super.key,
    required this.currentData,
    required this.comparisonData,
    required this.otherApps,
    required this.packageName,
    this.onCurrentAppTap,
    this.onCompareAppTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeBloc, HomeState, (AppProcessInfo?, AppProcessInfo?)>(
      bloc: getIt<HomeBloc>(),
      selector: (state) {
        final currentApp = state.value.allApps.firstWhereOrNull((a) => a.packageName == currentData.packageName);
        final compareApp = state.value.allApps.firstWhereOrNull((a) => a.packageName == comparisonData.packageName);
        return (currentApp, compareApp);
      },
      builder: (context, apps) {
        final (currentApp, compareApp) = apps;

        return Column(
          children: [
            MemInfoCompareBarChart(
              currentData: currentData,
              comparisonData: comparisonData,
              currentLabel: currentApp?.appName ?? 'Current',
              compareLabel: compareApp?.appName ?? 'Compare',
            ),
            SizedBox(height: 16.h),
            MemInfoComparePieCharts(
              currentData: currentData,
              comparisonData: comparisonData,
              currentLabel: currentApp?.appName ?? 'Current',
              compareLabel: compareApp?.appName ?? 'Compare',
            ),
            SizedBox(height: 16.h),
            MemInfoCompareRadarChart(
              currentData: currentData,
              comparisonData: comparisonData,
              currentLabel: currentApp?.appName ?? 'Current',
              compareLabel: compareApp?.appName ?? 'Compare',
            ),
            SizedBox(height: 16.h),
            MemInfoComparisonRow(
              label: context.loc.totalPss,
              currentValue: currentData.appSummary?.totalPss ?? 0,
              compareValue: comparisonData.appSummary?.totalPss ?? 0,
              icon: Icons.memory,
            ),
            MemInfoComparisonRow(
              label: context.loc.totalRss,
              currentValue: currentData.appSummary?.totalRss ?? 0,
              compareValue: comparisonData.appSummary?.totalRss ?? 0,
              icon: Icons.storage,
            ),
            MemInfoComparisonRow(
              label: context.loc.javaHeap,
              currentValue: currentData.appSummary?.javaHeapPss ?? 0,
              compareValue: comparisonData.appSummary?.javaHeapPss ?? 0,
              icon: Icons.android,
            ),
            MemInfoComparisonRow(
              label: context.loc.nativeHeap,
              currentValue: currentData.appSummary?.nativeHeapPss ?? 0,
              compareValue: comparisonData.appSummary?.nativeHeapPss ?? 0,
              icon: Icons.layers,
            ),
            MemInfoComparisonRow(
              label: context.loc.code,
              currentValue: currentData.appSummary?.codePss ?? 0,
              compareValue: comparisonData.appSummary?.codePss ?? 0,
              icon: Icons.code,
            ),
            MemInfoComparisonRow(
              label: context.loc.graphics,
              currentValue: currentData.appSummary?.graphicsPss ?? 0,
              compareValue: comparisonData.appSummary?.graphicsPss ?? 0,
              icon: Icons.brush,
            ),
          ],
        );
      },
    );
  }
}
