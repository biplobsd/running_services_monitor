import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'circular_progress.dart';

class SliverRefreshIndicator extends StatefulWidget {
  final Future<void> Function() onRefresh;
  final Widget child;

  const SliverRefreshIndicator({super.key, required this.onRefresh, required this.child});

  @override
  State<SliverRefreshIndicator> createState() => SliverRefreshIndicatorState();
}

class SliverRefreshIndicatorState extends State<SliverRefreshIndicator> with SingleTickerProviderStateMixin {
  bool isRefreshing = false;
  bool isDismissing = false;
  double dragOffset = 0.0;
  bool isDragging = false;
  bool wasUserDragging = false;
  late AnimationController dismissController;
  late Animation<double> dismissAnimation;

  static const double triggerThreshold = 80.0;
  static const double indicatorHeight = 60.0;

  @override
  void initState() {
    super.initState();
    dismissController = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);
    dismissAnimation = CurvedAnimation(parent: dismissController, curve: Curves.easeOut);
    dismissController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isDismissing = false;
          dragOffset = 0.0;
        });
        dismissController.reset();
      }
    });
  }

  @override
  void dispose() {
    dismissController.dispose();
    super.dispose();
  }

  bool handleScrollNotification(ScrollNotification notification) {
    if (isRefreshing || isDismissing) return false;

    if (notification is ScrollStartNotification) {
      if (notification.metrics.extentBefore == 0 && notification.dragDetails != null) {
        isDragging = true;
        wasUserDragging = true;
      }
    }

    if (notification is ScrollUpdateNotification) {
      final isUserDrag = notification.dragDetails != null;

      if (isDragging && isUserDrag) {
        if (notification.metrics.extentBefore == 0 &&
            notification.scrollDelta != null &&
            notification.scrollDelta! < 0) {
          setState(() {
            dragOffset += -notification.scrollDelta!;
          });
          if (dragOffset >= triggerThreshold && !isRefreshing) {
            triggerRefresh();
            return true;
          }
        } else if (notification.scrollDelta != null && notification.scrollDelta! > 0 && dragOffset > 0) {
          setState(() {
            dragOffset = (dragOffset - notification.scrollDelta!).clamp(0.0, double.infinity);
          });
        }
      }

      if (wasUserDragging && !isUserDrag) {
        wasUserDragging = false;
        isDragging = false;
        if (dragOffset >= triggerThreshold && !isRefreshing) {
          triggerRefresh();
          return true;
        } else if (dragOffset > 0) {
          setState(() {
            dragOffset = 0;
          });
        }
      }
    }

    if (notification is OverscrollNotification) {
      if (notification.overscroll < 0 && notification.dragDetails != null) {
        isDragging = true;
        wasUserDragging = true;
        setState(() {
          dragOffset += -notification.overscroll;
        });
      }
    }

    return false;
  }

  void triggerRefresh() async {
    setState(() {
      isRefreshing = true;
      dragOffset = indicatorHeight;
    });

    await widget.onRefresh();

    if (mounted) {
      setState(() {
        isRefreshing = false;
        isDismissing = true;
      });
      dismissController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final showIndicator = dragOffset > 0 || isRefreshing || isDismissing;

    double currentHeight = dragOffset.clamp(0.0, indicatorHeight);
    if (isDismissing) {
      currentHeight = indicatorHeight * (1 - dismissAnimation.value);
    }

    return NotificationListener<ScrollNotification>(
      onNotification: handleScrollNotification,
      child: Column(
        children: [
          AnimatedBuilder(
            animation: dismissAnimation,
            builder: (context, child) {
              return AnimatedContainer(
                duration: isRefreshing || isDismissing ? Duration.zero : const Duration(milliseconds: 100),
                height: currentHeight,
                color: colorScheme.surface,
                child: Center(
                  child: showIndicator && currentHeight > 20
                      ? SizedBox(
                          width: 32.w,
                          height: 32.w,
                          child: isRefreshing
                              ? CircularProgress(activeColor: colorScheme.primary)
                              : CircularProgress(
                                  value: (dragOffset / triggerThreshold).clamp(0.0, 1.0),
                                  activeColor: colorScheme.primary,
                                ),
                        )
                      : const SizedBox.shrink(),
                ),
              );
            },
          ),
          Expanded(child: widget.child),
        ],
      ),
    );
  }
}
