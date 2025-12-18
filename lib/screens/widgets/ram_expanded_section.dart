import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/system_ram_info.dart';
import 'package:running_services_monitor/utils/format_utils.dart';
// import 'ram_legend_item.dart';
import 'stacked_ram_bar.dart';
import 'legend_widgets.dart';

class RamExpandedSection extends StatelessWidget {
  final SystemRamInfo ram;

  const RamExpandedSection({super.key, required this.ram});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final loc = context.loc;

    final primaryColor = colorScheme.primary;
    final freeColor = colorScheme.primaryContainer;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // RamLegendItem(label: loc.totalRam, value: '${formatRam(ram.totalRamKb)} + ${formatRam(ram.zramTotalSwapKb)}'),
          SizedBox(height: 12.h),
          Divider(height: 1.h),
          SizedBox(height: 16.h),
          Text(
            loc.usedBreakdown,
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, color: colorScheme.onSurfaceVariant),
          ),
          SizedBox(height: 10.h),
          StackedRamBar(
            segments: [
              RamBarSegment(value: ram.usedPssKb, color: primaryColor, label: loc.usedPss, showLabel: true),
              RamBarSegment(
                value: ram.kernelKb,
                color: primaryColor.withValues(alpha: 0.6),
                label: loc.kernel,
                showLabel: true,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              LegendDot(color: primaryColor),
              Text(' ${loc.usedPss}: ${formatRam(ram.usedPssKb)}', style: TextStyle(fontSize: 11.sp)),
              SizedBox(width: 12.w),
              LegendDot(color: primaryColor.withValues(alpha: 0.6)),
              Text(' ${loc.kernel}: ${formatRam(ram.kernelKb)}', style: TextStyle(fontSize: 11.sp)),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            loc.freeBreakdown,
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, color: colorScheme.onSurfaceVariant),
          ),
          SizedBox(height: 10.h),
          StackedRamBar(
            segments: [
              RamBarSegment(
                value: ram.cachedPssKb,
                color: freeColor,
                label: loc.cachedPss,
                showLabel: true,
                labelColor: colorScheme.onPrimaryContainer,
              ),
              RamBarSegment(
                value: ram.cachedKernelKb,
                color: freeColor.withValues(alpha: 0.7),
                label: loc.cachedKernel,
                showLabel: true,
                labelColor: colorScheme.onPrimaryContainer,
              ),
              RamBarSegment(
                value: ram.actualFreeKb,
                color: freeColor.withValues(alpha: 0.4),
                label: loc.actualFree,
                showLabel: true,
                labelColor: colorScheme.onPrimaryContainer,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Wrap(
            spacing: 12.w,
            runSpacing: 4.h,
            children: [
              LegendLabel(color: freeColor, text: '${loc.cachedPss}: ${formatRam(ram.cachedPssKb)}'),
              LegendLabel(
                color: freeColor.withValues(alpha: 0.7),
                text: '${loc.cachedKernel}: ${formatRam(ram.cachedKernelKb)}',
              ),
              LegendLabel(
                color: freeColor.withValues(alpha: 0.4),
                text: '${loc.actualFree}: ${formatRam(ram.actualFreeKb)}',
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Text(
            loc.other,
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, color: colorScheme.onSurfaceVariant),
          ),
          SizedBox(height: 10.h),
          if (ram.gpuKb > 0) ...[
            RamProgressRow(
              label: loc.gpu,
              value: formatRam(ram.gpuKb),
              progress: ram.gpuKb / ram.totalRamKb,
              color: primaryColor,
            ),
            SizedBox(height: 8.h),
          ],
          RamProgressRow(
            label: loc.lostRam,
            value: formatRam(ram.lostRamKb),
            progress: ram.lostRamKb / ram.totalRamKb,
            color: primaryColor.withValues(alpha: 0.5),
          ),
          if (ram.zramPhysicalKb > 0) ...[
            SizedBox(height: 12.h),
            Text(
              loc.zramSection,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: colorScheme.onSurfaceVariant),
            ),
            SizedBox(height: 8.h),
            RamProgressRow(
              label: loc.zramPhysical,
              value: formatRam(ram.zramPhysicalKb),
              progress: ram.zramPhysicalKb / ram.totalRamKb,
              color: primaryColor,
            ),
            SizedBox(height: 6.h),
            RamProgressRow(
              label: loc.zramSwapUsed,
              value: '${formatRam(ram.zramSwapKb)} / ${formatRam(ram.zramTotalSwapKb)}',
              progress: ram.zramSwapKb / ram.zramTotalSwapKb,
              color: primaryColor.withValues(alpha: 0.6),
            ),
          ],
          if (ram.oomKb > 0) ...[
            SizedBox(height: 12.h),
            Text(
              loc.memoryThresholds,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500, color: colorScheme.onSurfaceVariant),
            ),
            SizedBox(height: 8.h),
            RamProgressRow(
              label: loc.oomThreshold,
              value: formatRam(ram.oomKb),
              progress: ram.oomKb / ram.totalRamKb,
              color: primaryColor.withValues(alpha: 0.8),
            ),
            SizedBox(height: 6.h),
            RamProgressRow(
              label: loc.restoreLimit,
              value: formatRam(ram.restoreLimitKb),
              progress: ram.restoreLimitKb / ram.totalRamKb,
              color: primaryColor.withValues(alpha: 0.5),
            ),
          ],
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
