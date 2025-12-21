import 'package:flutter/material.dart';
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

  static List<MemorySegment> buildSegments(AppSummary? summary) {
    if (summary == null) return [];
    return [
      MemorySegment('Java Heap', summary.javaHeapPss.toDouble(), javaHeapColor),
      MemorySegment('Native Heap', summary.nativeHeapPss.toDouble(), nativeHeapColor),
      MemorySegment('Code', summary.codePss.toDouble(), codeColor),
      MemorySegment('Stack', summary.stackPss.toDouble(), stackColor),
      MemorySegment('Graphics', summary.graphicsPss.toDouble(), graphicsColor),
      MemorySegment('Private Other', summary.privateOther.toDouble(), otherColor),
      MemorySegment('System', summary.system.toDouble(), systemColor),
    ];
  }

  static double getSegmentsTotal(List<MemorySegment> segments) {
    return segments.fold(0.0, (sum, s) => sum + s.value);
  }

  static List<MemoryMetric> buildMetrics(AppSummary? current, AppSummary? compare) {
    return [
      MemoryMetric('Java', current?.javaHeapPss.toDouble() ?? 0, compare?.javaHeapPss.toDouble() ?? 0),
      MemoryMetric('Native', current?.nativeHeapPss.toDouble() ?? 0, compare?.nativeHeapPss.toDouble() ?? 0),
      MemoryMetric('Code', current?.codePss.toDouble() ?? 0, compare?.codePss.toDouble() ?? 0),
      MemoryMetric('Stack', current?.stackPss.toDouble() ?? 0, compare?.stackPss.toDouble() ?? 0),
      MemoryMetric('Graphics', current?.graphicsPss.toDouble() ?? 0, compare?.graphicsPss.toDouble() ?? 0),
      MemoryMetric('Other', current?.privateOther.toDouble() ?? 0, compare?.privateOther.toDouble() ?? 0),
    ];
  }

  static List<({String label, Color color})> legendItems = [
    (label: 'Java Heap', color: javaHeapColor),
    (label: 'Native Heap', color: nativeHeapColor),
    (label: 'Code', color: codeColor),
    (label: 'Stack', color: stackColor),
    (label: 'Graphics', color: graphicsColor),
    (label: 'Other', color: otherColor),
    (label: 'System', color: systemColor),
  ];
}
