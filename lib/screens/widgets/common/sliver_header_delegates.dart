import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';

class RamBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget ramBar;

  RamBarDelegate({required this.ramBar});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Theme.of(context).colorScheme.surface, child: ramBar);
  }

  @override
  double get maxExtent => 150.h;

  @override
  double get minExtent => 150.h;

  @override
  bool shouldRebuild(covariant RamBarDelegate oldDelegate) {
    return ramBar != oldDelegate.ramBar;
  }
}

class FilterChipsDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  FilterChipsDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Theme.of(context).colorScheme.surface, child: child);
  }

  @override
  double get maxExtent => 52.h;

  @override
  double get minExtent => 52.h;

  @override
  bool shouldRebuild(covariant FilterChipsDelegate oldDelegate) {
    return child != oldDelegate.child;
  }
}
