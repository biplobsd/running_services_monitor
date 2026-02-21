import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/system_ram_info.dart';
import 'package:running_services_monitor/utils/format_utils.dart';
// import 'ram_legend_item.dart';
import 'stacked_ram_bar.dart';
import '../meminfo/legend_widgets.dart';

class RamExpandedSection extends StatelessWidget {
  final SystemRamInfo ram;

  const RamExpandedSection({super.key, required this.ram});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final loc = context.loc;

    final primaryColor = colorScheme.primary;
    final freeColor = colorScheme.primaryContainer;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0), // Consider adding to AppStyles if reused more
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppStyles.spacingH12,
          Divider(height: 1),
          AppStyles.spacingH16,
          Text(
            loc.usedBreakdown,
            style: AppStyles.bodyStyle.copyWith(fontWeight: FontWeight.w500, color: colorScheme.onSurfaceVariant),
          ),
          AppStyles.spacingH10,
          StackedRamBar(
            segments: [
              RamBarSegment(value: ram.usedPssKb, color: primaryColor, label: loc.usedPss, showLabel: true),
              RamBarSegment(value: ram.kernelKb, color: primaryColor.withValues(alpha: 0.6), label: loc.kernel, showLabel: true),
            ],
          ),
          AppStyles.spacingH8,
          Row(
            children: [
              LegendDot(color: primaryColor),
              Text(' ${loc.usedPss}: ${ram.usedPssKb.formatRam()}', style: AppStyles.smallStyle),
              AppStyles.spacing12,
              LegendDot(color: primaryColor.withValues(alpha: 0.6)),
              Text(' ${loc.kernel}: ${ram.kernelKb.formatRam()}', style: AppStyles.smallStyle),
            ],
          ),
          AppStyles.spacingH16,
          Text(
            loc.freeBreakdown,
            style: AppStyles.bodyStyle.copyWith(fontWeight: FontWeight.w500, color: colorScheme.onSurfaceVariant),
          ),
          AppStyles.spacingH10,
          StackedRamBar(
            segments: [
              RamBarSegment(value: ram.cachedPssKb, color: freeColor, label: loc.cachedPss, showLabel: true, labelColor: colorScheme.onPrimaryContainer),
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
          AppStyles.spacingH8,
          Wrap(
            spacing: 12,
            runSpacing: 4,
            children: [
              LegendLabel(color: freeColor, text: '${loc.cachedPss}: ${ram.cachedPssKb.formatRam()}'),
              LegendLabel(color: freeColor.withValues(alpha: 0.7), text: '${loc.cachedKernel}: ${ram.cachedKernelKb.formatRam()}'),
              LegendLabel(color: freeColor.withValues(alpha: 0.4), text: '${loc.actualFree}: ${ram.actualFreeKb.formatRam()}'),
            ],
          ),
          AppStyles.spacingH16,
          Text(
            loc.other,
            style: AppStyles.bodyStyle.copyWith(fontWeight: FontWeight.w500, color: colorScheme.onSurfaceVariant),
          ),
          AppStyles.spacingH10,
          if (ram.gpuKb > 0) ...[
            RamProgressRow(label: loc.gpu, value: ram.gpuKb.formatRam(), progress: ram.gpuKb / ram.totalRamKb, color: primaryColor),
            AppStyles.spacingH8,
          ],
          RamProgressRow(
            label: loc.lostRam,
            value: ram.lostRamKb.formatRam(),
            progress: ram.lostRamKb / ram.totalRamKb,
            color: primaryColor.withValues(alpha: 0.5),
          ),
          if (ram.zramPhysicalKb > 0) ...[
            AppStyles.spacingH12,
            Text(
              loc.zramSection,
              style: AppStyles.subtitleStyle.copyWith(fontWeight: FontWeight.w500, color: colorScheme.onSurfaceVariant),
            ),
            AppStyles.spacingH8,
            RamProgressRow(label: loc.zramPhysical, value: ram.zramPhysicalKb.formatRam(), progress: ram.zramPhysicalKb / ram.totalRamKb, color: primaryColor),
            AppStyles.spacingH6,
            RamProgressRow(
              label: loc.zramSwapUsed,
              value: '${ram.zramSwapKb.formatRam()} / ${ram.zramTotalSwapKb.formatRam()}',
              progress: ram.zramSwapKb / ram.zramTotalSwapKb,
              color: primaryColor.withValues(alpha: 0.6),
            ),
          ],
          if (ram.oomKb > 0) ...[
            AppStyles.spacingH12,
            Text(
              loc.memoryThresholds,
              style: AppStyles.subtitleStyle.copyWith(fontWeight: FontWeight.w500, color: colorScheme.onSurfaceVariant),
            ),
            AppStyles.spacingH8,
            RamProgressRow(
              label: loc.oomThreshold,
              value: ram.oomKb.formatRam(),
              progress: ram.oomKb / ram.totalRamKb,
              color: primaryColor.withValues(alpha: 0.8),
            ),
            AppStyles.spacingH6,
            RamProgressRow(
              label: loc.restoreLimit,
              value: ram.restoreLimitKb.formatRam(),
              progress: ram.restoreLimitKb / ram.totalRamKb,
              color: primaryColor.withValues(alpha: 0.5),
            ),
          ],
          AppStyles.spacingH8,
        ],
      ),
    );
  }
}
