import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:progress_indicator_m3e/progress_indicator_m3e.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/utils/format_utils.dart';
import 'ram_legend_item.dart';
import 'constrained_wavy_progress.dart';

class RamBar extends StatefulWidget {
  final double totalRamKb;
  final double usedRamKb;
  final double freeRamKb;
  final bool isLoading;

  const RamBar({
    super.key,
    required this.totalRamKb,
    required this.usedRamKb,
    required this.freeRamKb,
    this.isLoading = false,
  });

  @override
  State<RamBar> createState() => _RamBarState();
}

class _RamBarState extends State<RamBar> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  double previousRatio = 0;

  double get usedRatio => widget.totalRamKb > 0 ? widget.usedRamKb / widget.totalRamKb : 0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    animation = Tween<double>(
      begin: 0,
      end: usedRatio,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    if (!widget.isLoading) {
      controller.forward();
    }
    previousRatio = usedRatio;
  }

  @override
  void didUpdateWidget(RamBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.isLoading && widget.isLoading) {
      previousRatio = animation.value;
    } else if (oldWidget.isLoading && !widget.isLoading) {
      animation = Tween<double>(
        begin: previousRatio,
        end: usedRatio,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
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
    if (widget.totalRamKb <= 0) {
      return const SizedBox.shrink();
    }

    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            context.loc.deviceMemory,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
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
          RamLegendItem(color: colorScheme.primary, label: context.loc.used, value: formatRam(widget.usedRamKb)),
          SizedBox(height: 8.h),
          RamLegendItem(
            color: colorScheme.surfaceContainerHighest,
            label: context.loc.free,
            value: formatRam(widget.freeRamKb),
          ),
        ],
      ),
    );
  }
}
