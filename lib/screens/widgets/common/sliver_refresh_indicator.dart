import 'package:flutter/material.dart' hide RefreshIndicatorState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/refresh_indicator_bloc/refresh_indicator_bloc.dart';
import 'circular_progress.dart';

class RefreshWrapper extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;

  const RefreshWrapper({super.key, required this.child, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RefreshIndicatorBloc(),
      child: _RefreshWrapperBody(onRefresh: onRefresh, child: child),
    );
  }
}

class _RefreshWrapperBody extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;

  const _RefreshWrapperBody({required this.child, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RefreshIndicatorBloc, RefreshIndicatorState>(
      listenWhen: (prev, curr) => !prev.shouldTriggerRefresh && curr.shouldTriggerRefresh,
      listener: (context, state) async {
        await onRefresh();
        if (context.mounted) {
          context.read<RefreshIndicatorBloc>().add(const RefreshIndicatorEvent.refreshComplete());
          await Future.delayed(const Duration(milliseconds: 300));
          if (context.mounted) {
            context.read<RefreshIndicatorBloc>().add(const RefreshIndicatorEvent.dismissComplete());
          }
        }
      },
      child: NotificationListener<ScrollNotification>(onNotification: (notification) => _handleScrollNotification(context, notification), child: child),
    );
  }

  bool _handleScrollNotification(BuildContext context, ScrollNotification notification) {
    final bloc = context.read<RefreshIndicatorBloc>();
    final state = bloc.state;

    if (state.isRefreshing || state.isDismissing) return false;

    if (notification is ScrollStartNotification) {
      if (notification.metrics.extentBefore == 0 && notification.dragDetails != null) {
        bloc.add(const RefreshIndicatorEvent.startDrag());
      }
    }

    if (notification is ScrollUpdateNotification) {
      final isUserDrag = notification.dragDetails != null;

      if (state.isDragging && isUserDrag) {
        if (notification.metrics.extentBefore == 0 && notification.scrollDelta != null && notification.scrollDelta! < 0) {
          bloc.add(RefreshIndicatorEvent.updateDrag(-notification.scrollDelta!));
          return true;
        } else if (notification.scrollDelta != null && notification.scrollDelta! > 0 && state.dragOffset > 0) {
          bloc.add(RefreshIndicatorEvent.updateDrag(-notification.scrollDelta!));
        }
      }

      if (state.isDragging && !isUserDrag) {
        bloc.add(const RefreshIndicatorEvent.endDrag());
      }
    }

    if (notification is OverscrollNotification) {
      if (notification.overscroll < 0 && notification.dragDetails != null) {
        bloc.add(RefreshIndicatorEvent.overscroll(-notification.overscroll));
      }
    }

    return false;
  }
}

class SliverRefreshHeader extends StatelessWidget {
  const SliverRefreshHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      RefreshIndicatorBloc,
      RefreshIndicatorState,
      ({bool showIndicator, double currentHeight, bool isDragging, bool isRefreshing, double progress})
    >(
      selector: (state) => (
        showIndicator: state.showIndicator,
        currentHeight: state.currentHeight,
        isDragging: state.isDragging,
        isRefreshing: state.isRefreshing,
        progress: state.progress,
      ),
      builder: (context, state) {
        final colorScheme = Theme.of(context).colorScheme;
        final isVisible = state.showIndicator && state.currentHeight > 0;

        return SliverToBoxAdapter(
          child: ClipRect(
            child: AnimatedContainer(
              duration: state.isDragging ? Duration.zero : const Duration(milliseconds: 200),
              height: state.currentHeight,
              color: colorScheme.surface,
              child: AnimatedSlide(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOutCubic,
                offset: isVisible ? Offset.zero : const Offset(0, -1),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isVisible ? 1.0 : 0.0,
                  child: Center(
                    child: state.currentHeight > 20
                        ? SizedBox(
                            width: 32,
                            height: 32,
                            child: state.isRefreshing
                                ? CircularProgress(activeColor: colorScheme.primary)
                                : CircularProgress(value: state.progress, activeColor: colorScheme.primary),
                          )
                        : const SizedBox(),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
