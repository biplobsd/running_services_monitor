import 'package:flutter/material.dart';
import 'package:running_services_monitor/l10n/app_localizations.dart';
import 'package:running_services_monitor/models/meminfo_data.dart';

class MemorySegment {
  final String label;
  final double value;
  final Color color;

  MemorySegment(this.label, this.value, this.color);
}

class MemoryMetric {
  final String label;
  final double currentValue;
  final double compareValue;

  MemoryMetric(this.label, this.currentValue, this.compareValue);
}

class MemInfoChartData {
  static const javaHeapColor = Colors.green;
  static const nativeHeapColor = Colors.orange;
  static const codeColor = Colors.blue;
  static const stackColor = Colors.purple;
  static const graphicsColor = Colors.pink;
  static const otherColor = Colors.teal;
  static const systemColor = Colors.indigo;

  static List<MemorySegment> buildSegments(AppSummary? summary, AppLocalizations l10n) {
    if (summary == null) return [];
    return [
      MemorySegment(l10n.javaHeap, summary.javaHeapPss.toDouble(), javaHeapColor),
      MemorySegment(l10n.nativeHeap, summary.nativeHeapPss.toDouble(), nativeHeapColor),
      MemorySegment(l10n.code, summary.codePss.toDouble(), codeColor),
      MemorySegment(l10n.stack, summary.stackPss.toDouble(), stackColor),
      MemorySegment(l10n.graphics, summary.graphicsPss.toDouble(), graphicsColor),
      MemorySegment(l10n.privateOther, summary.privateOther.toDouble(), otherColor),
      MemorySegment(l10n.system, summary.system.toDouble(), systemColor),
    ];
  }

  static double getSegmentsTotal(List<MemorySegment> segments) {
    return segments.fold(0.0, (sum, s) => sum + s.value);
  }

  static List<MemoryMetric> buildPssMetrics(AppSummary? current, AppSummary? compare, AppLocalizations l10n) {
    return [
      MemoryMetric(l10n.javaHeap, current?.javaHeapPss.toDouble() ?? 0, compare?.javaHeapPss.toDouble() ?? 0),
      MemoryMetric(l10n.nativeHeap, current?.nativeHeapPss.toDouble() ?? 0, compare?.nativeHeapPss.toDouble() ?? 0),
      MemoryMetric(l10n.code, current?.codePss.toDouble() ?? 0, compare?.codePss.toDouble() ?? 0),
      MemoryMetric(l10n.stack, current?.stackPss.toDouble() ?? 0, compare?.stackPss.toDouble() ?? 0),
      MemoryMetric(l10n.graphics, current?.graphicsPss.toDouble() ?? 0, compare?.graphicsPss.toDouble() ?? 0),
      MemoryMetric(l10n.other, current?.privateOther.toDouble() ?? 0, compare?.privateOther.toDouble() ?? 0),
    ];
  }

  static List<MemoryMetric> buildRssMetrics(AppSummary? current, AppSummary? compare, AppLocalizations l10n) {
    return [
      MemoryMetric(l10n.javaHeap, current?.javaHeapRss.toDouble() ?? 0, compare?.javaHeapRss.toDouble() ?? 0),
      MemoryMetric(l10n.nativeHeap, current?.nativeHeapRss.toDouble() ?? 0, compare?.nativeHeapRss.toDouble() ?? 0),
      MemoryMetric(l10n.code, current?.codeRss.toDouble() ?? 0, compare?.codeRss.toDouble() ?? 0),
      MemoryMetric(l10n.stack, current?.stackRss.toDouble() ?? 0, compare?.stackRss.toDouble() ?? 0),
      MemoryMetric(l10n.graphics, current?.graphicsRss.toDouble() ?? 0, compare?.graphicsRss.toDouble() ?? 0),
      MemoryMetric(l10n.unknown, current?.unknownRss.toDouble() ?? 0, compare?.unknownRss.toDouble() ?? 0),
    ];
  }

  static MemoryMetric getTotalPss(AppSummary? current, AppSummary? compare, AppLocalizations l10n) {
    return MemoryMetric(l10n.totalPss, current?.totalPss.toDouble() ?? 0, compare?.totalPss.toDouble() ?? 0);
  }

  static MemoryMetric getTotalRss(AppSummary? current, AppSummary? compare, AppLocalizations l10n) {
    return MemoryMetric(l10n.totalRss, current?.totalRss.toDouble() ?? 0, compare?.totalRss.toDouble() ?? 0);
  }

  static List<({String label, Color color})> getLegendItems(AppLocalizations l10n) => [
    (label: l10n.javaHeap, color: javaHeapColor),
    (label: l10n.nativeHeap, color: nativeHeapColor),
    (label: l10n.code, color: codeColor),
    (label: l10n.stack, color: stackColor),
    (label: l10n.graphics, color: graphicsColor),
    (label: l10n.other, color: otherColor),
    (label: l10n.system, color: systemColor),
  ];
}
