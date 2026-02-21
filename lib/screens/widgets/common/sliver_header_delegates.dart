import 'package:flutter/material.dart';

class RamBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget ramBar;

  RamBarDelegate({required this.ramBar});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Theme.of(context).colorScheme.surface, child: ramBar);
  }

  @override
  double get maxExtent => 150;

  @override
  double get minExtent => 150;

  @override
  bool shouldRebuild(covariant RamBarDelegate oldDelegate) {
    return ramBar != oldDelegate.ramBar;
  }
}

class FilterChipsDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;
  final double opacity;
  final double slideOffset;

  FilterChipsDelegate({required this.child, double? height, this.opacity = 1.0, this.slideOffset = 0.0})
    : height = height ?? 52;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: height,
      color: Theme.of(context).colorScheme.surface,
      child: Transform.translate(
        offset: Offset(0, -slideOffset), // Slide up visually
        child: Opacity(opacity: opacity, child: child),
      ),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant FilterChipsDelegate oldDelegate) {
    return child != oldDelegate.child ||
        height != oldDelegate.height ||
        opacity != oldDelegate.opacity ||
        slideOffset != oldDelegate.slideOffset;
  }
}

class AnimatedFilterChipsDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final bool isVisible;
  final double height;

  AnimatedFilterChipsDelegate({required this.child, required this.isVisible, double? height}) : height = height ?? 52;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ClipRect(
      child: AnimatedSlide(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        offset: isVisible ? Offset.zero : const Offset(0, -1),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: isVisible ? 1.0 : 0.0,
          child: Container(color: Theme.of(context).colorScheme.surface, child: child),
        ),
      ),
    );
  }

  @override
  double get maxExtent => isVisible ? height : 0;

  @override
  double get minExtent => isVisible ? height : 0;

  @override
  bool shouldRebuild(covariant AnimatedFilterChipsDelegate oldDelegate) {
    return child != oldDelegate.child || isVisible != oldDelegate.isVisible;
  }
}
