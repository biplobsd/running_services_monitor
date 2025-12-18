import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:progress_indicator_m3e/progress_indicator_m3e.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/system_ram_info.dart';
import 'package:running_services_monitor/utils/format_utils.dart';
import 'ram_legend_item.dart';
import 'constrained_wavy_progress.dart';
import 'stacked_ram_bar.dart';
import 'legend_widgets.dart';

class RamBar extends StatefulWidget {
  final SystemRamInfo ramInfo;
  final bool isLoading;

  const RamBar({super.key, required this.ramInfo, this.isLoading = false});

  @override
  State<RamBar> createState() => _RamBarState();
}

class _RamBarState extends State<RamBar> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late double previousRatio;
  bool isExpanded = false;

  double get usedRatio => widget.ramInfo.totalRamKb > 0 ? widget.ramInfo.usedRamKb / widget.ramInfo.totalRamKb : 0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    animation = Tween<double>(begin: 0, end: usedRatio).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    if (!widget.isLoading) {
      controller.forward();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        previousRatio = usedRatio;
      });
    });
  }

  @override
  void didUpdateWidget(RamBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.isLoading && widget.isLoading) {
      previousRatio = animation.value;
    } else if (oldWidget.isLoading && !widget.isLoading) {
      animation = Tween<double>(begin: previousRatio, end: usedRatio).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
      controller.forward(from: 0);
      previousRatio = usedRatio;
    } else if (!widget.isLoading) {
      final newRatio = usedRatio;
      if (newRatio != previousRatio) {
        animation = Tween<double>(
          begin: previousRatio,
          end: newRatio,
        ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
        controller.forward(from: 0);
        previousRatio = newRatio;
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.ramInfo.totalRamKb <= 0) {
      return const SizedBox.shrink();
    }

    final colorScheme = Theme.of(context).colorScheme;
    final loc = context.loc;
    final ram = widget.ramInfo;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                loc.deviceMemory,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              if (ram.totalRamStatus.isNotEmpty) ...[
                SizedBox(width: 8.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  decoration: BoxDecoration(color: colorScheme.primaryContainer, borderRadius: BorderRadius.circular(4.r)),
                  child: Text(
                    ram.totalRamStatus.capitalize(),
                    style: TextStyle(fontSize: 10.sp, color: colorScheme.onPrimaryContainer),
                  ),
                ),
              ],
              const Spacer(),
              IconButton(
                onPressed: () => setState(() => isExpanded = !isExpanded),
                icon: AnimatedRotation(
                  turns: isExpanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(Icons.expand_more, size: 20.sp),
                ),
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          widget.isLoading
              ? ConstrainedWavyProgress(value: previousRatio, animate: true)
              : AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    return LinearProgressIndicatorM3E(value: animation.value);
                  },
                ),
          SizedBox(height: 16.h),
          RamLegendItem(color: colorScheme.primary, label: loc.used, value: formatRam(ram.usedRamKb)),
          SizedBox(height: 8.h),
          RamLegendItem(color: colorScheme.surfaceContainerHighest, label: loc.free, value: formatRam(ram.freeRamKb)),
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: isExpanded ? RamExpandedSection(ram: ram) : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class RamExpandedSection extends StatelessWidget {
  final SystemRamInfo ram;

  const RamExpandedSection({super.key, required this.ram});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final loc = context.loc;

    final primaryColor = colorScheme.primary;
    final freeColor = colorScheme.primaryContainer;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            RamBarSegment(value: ram.kernelKb, color: primaryColor.withValues(alpha: 0.6), label: loc.kernel, showLabel: true),
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
            LegendLabel(color: freeColor.withValues(alpha: 0.7), text: '${loc.cachedKernel}: ${formatRam(ram.cachedKernelKb)}'),
            LegendLabel(color: freeColor.withValues(alpha: 0.4), text: '${loc.actualFree}: ${formatRam(ram.actualFreeKb)}'),
          ],
        ),
        SizedBox(height: 16.h),
        Text(
          loc.other,
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500, color: colorScheme.onSurfaceVariant),
        ),
        SizedBox(height: 10.h),
        if (ram.gpuKb > 0) ...[
          RamProgressRow(label: loc.gpu, value: formatRam(ram.gpuKb), progress: ram.gpuKb / ram.totalRamKb, color: primaryColor),
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
    );
  }
}
