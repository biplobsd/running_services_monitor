import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/meminfo_data.dart';
import 'package:running_services_monitor/utils/format_utils.dart';

class MemInfoSummaryCard extends StatefulWidget {
  final AppSummary summary;

  const MemInfoSummaryCard({super.key, required this.summary});

  @override
  State<MemInfoSummaryCard> createState() => _MemInfoSummaryCardState();
}

class _MemInfoSummaryCardState extends State<MemInfoSummaryCard> {
  bool showPss = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final primary = colorScheme.primary;
    final secondaryContainer = colorScheme.secondaryContainer;

    final items = [
      _SummaryItem('Java Heap', widget.summary.javaHeapPss, widget.summary.javaHeapRss, Colors.green),
      _SummaryItem('Native Heap', widget.summary.nativeHeapPss, widget.summary.nativeHeapRss, Colors.orange),
      _SummaryItem('Code', widget.summary.codePss, widget.summary.codeRss, Colors.blue),
      _SummaryItem('Stack', widget.summary.stackPss, widget.summary.stackRss, Colors.purple),
      _SummaryItem('Graphics', widget.summary.graphicsPss, widget.summary.graphicsRss, Colors.pink),
      _SummaryItem('Private Other', widget.summary.privateOther, 0, Colors.teal),
      _SummaryItem('System', widget.summary.system, 0, Colors.indigo),
      if (widget.summary.unknownRss > 0) _SummaryItem('Unknown', 0, widget.summary.unknownRss, Colors.grey),
    ];

    return Container(
      padding: AppStyles.sectionPadding,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colorScheme.primaryContainer.withValues(alpha: 0.5), secondaryContainer.withValues(alpha: 0.3)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.rSafe),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.h,
        children: [
          Row(
            children: [
              Icon(Icons.analytics, size: 20.sp, color: primary),
              AppStyles.spacing8,
              Expanded(
                child: Text(context.loc.appSummary, style: AppStyles.titleStyle.copyWith(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Row(
            spacing: 12.w,
            children: [
              Expanded(child: _buildTotalCard(context, 'Total PSS', widget.summary.totalPss, Colors.blue, Icons.memory)),
              Expanded(child: _buildTotalCard(context, 'Total RSS', widget.summary.totalRss, Colors.purple, Icons.storage)),
            ],
          ),
          if (widget.summary.totalSwapPss > 0) _buildTotalCard(context, 'Swap PSS', widget.summary.totalSwapPss, Colors.orange, Icons.swap_horiz),
          _buildToggleButton(context),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: items.where((item) => item.pss > 0 || item.rss > 0).map((item) => _buildSummaryChip(context, item)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainerHigh, borderRadius: BorderRadius.circular(8.rSafe)),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => showPss = true),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  color: showPss ? Theme.of(context).colorScheme.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.rSafe),
                ),
                child: Text(
                  'PSS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: showPss ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => showPss = false),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  color: !showPss ? Theme.of(context).colorScheme.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.rSafe),
                ),
                child: Text(
                  'RSS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                    color: !showPss ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalCard(BuildContext context, String label, int value, Color color, IconData icon) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.rSafe),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 14.sp, color: color),
              SizedBox(width: 6.w),
              Text(
                label,
                style: TextStyle(fontSize: 11.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            value.formatRam(),
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: color),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryChip(BuildContext context, _SummaryItem item) {
    final primaryValue = showPss ? item.pss : item.rss;
    final secondaryValue = showPss ? item.rss : item.pss;
    final secondaryLabel = showPss ? 'RSS' : 'PSS';

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: item.color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20.rSafe),
        border: Border.all(color: item.color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8.w,
            height: 8.w,
            decoration: BoxDecoration(color: item.color, shape: BoxShape.circle),
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.label,
                style: TextStyle(fontSize: 10.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
              if (primaryValue > 0)
                Text(
                  primaryValue.formatRam(),
                  style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold, color: item.color),
                ),
              if (secondaryValue > 0)
                Text(
                  '$secondaryLabel: ${secondaryValue.formatRam()}',
                  style: TextStyle(fontSize: 9.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryItem {
  final String label;
  final int pss;
  final int rss;
  final Color color;

  _SummaryItem(this.label, this.pss, this.rss, this.color);
}
