import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/system_ram_info.dart';
import 'package:running_services_monitor/utils/format_utils.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'ram_legend_item.dart';
import '../common/constrained_wavy_progress.dart';
import 'ram_expanded_section.dart';
import '../common/linear_progress.dart';

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

  double get usedRatio => widget.ramInfo.totalRamKb > 0 ? widget.ramInfo.usedRamKb / (widget.ramInfo.totalRamKb + widget.ramInfo.zramTotalSwapKb) : 0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);

    if (widget.isLoading) {
      animation = Tween<double>(begin: 0, end: 0).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
      previousRatio = 0;
    } else {
      animation = Tween<double>(begin: usedRatio, end: usedRatio).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
      previousRatio = usedRatio;
      controller.forward();
    }
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
        animation = Tween<double>(begin: previousRatio, end: newRatio).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
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

    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => setState(() => isExpanded = !isExpanded),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(loc.deviceMemory, style: AppStyles.titleStyle.copyWith(fontWeight: FontWeight.w500)),
                        AnimatedRotation(
                          turns: isExpanded ? 0.5 : 0,
                          duration: const Duration(milliseconds: 200),
                          child: Icon(Icons.expand_more, size: 20),
                        ),
                      ],
                    ),
                    AppStyles.spacingH16, // Was 15, 16 is standard
                    widget.isLoading
                        ? Skeleton.shade(child: ConstrainedWavyProgress(value: previousRatio, animate: true))
                        : AnimatedBuilder(
                            animation: animation,
                            builder: (context, child) {
                              return LinearProgress(value: animation.value);
                            },
                          ),
                    AppStyles.spacingH16,
                    RamLegendItem(color: colorScheme.primary, label: loc.used, value: ram.usedRamKb.formatRam()),
                    AppStyles.spacingH8,
                    RamLegendItem(color: colorScheme.surfaceContainerHighest, label: loc.free, value: ram.freeRamKb.formatRam()),
                  ],
                ),
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: isExpanded ? RamExpandedSection(ram: ram) : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
