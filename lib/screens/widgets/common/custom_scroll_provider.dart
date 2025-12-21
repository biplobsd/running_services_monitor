import 'package:flutter/material.dart';

class CustomScrollProvider extends StatefulWidget {
  const CustomScrollProvider({super.key, required this.tabController, required this.parent, required this.child});

  final TabController tabController;
  final ScrollController parent;
  final Widget child;

  @override
  State<CustomScrollProvider> createState() => CustomScrollProviderState();
}

class CustomScrollProviderState extends State<CustomScrollProvider> {
  late final List<CustomScrollController> scrollControllers;

  @override
  void initState() {
    super.initState();

    final activeIndex = widget.tabController.index;

    scrollControllers = List.generate(
      widget.tabController.length,
      (index) => CustomScrollController(
        isActive: index == activeIndex,
        parent: widget.parent,
        debugLabel: 'CustomScrollController/$index',
      ),
    );

    widget.tabController.addListener(_onTabChanged);
  }

  @override
  void dispose() {
    widget.tabController.removeListener(_onTabChanged);
    for (final scrollController in scrollControllers) {
      scrollController.dispose();
    }
    super.dispose();
  }

  void _onTabChanged() {
    changeActiveIndex(widget.tabController.index);
  }

  void changeActiveIndex(int value) {
    for (var i = 0; i < scrollControllers.length; i++) {
      final scrollController = scrollControllers[i];
      final isActive = i == value;
      scrollController.isActive = isActive;

      if (isActive) {
        scrollController.forceAttach();
      } else {
        scrollController.forceDetach();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollProviderData(scrollControllers: scrollControllers, child: widget.child);
  }
}

class CustomScrollProviderData extends InheritedWidget {
  const CustomScrollProviderData({super.key, required super.child, required this.scrollControllers});

  static CustomScrollProviderData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CustomScrollProviderData>()!;
  }

  final List<CustomScrollController> scrollControllers;

  @override
  bool updateShouldNotify(CustomScrollProviderData oldWidget) {
    return scrollControllers != oldWidget.scrollControllers;
  }
}

class CustomScrollController extends ScrollController {
  CustomScrollController({required this.isActive, required this.parent, String debugLabel = 'CustomScrollController'})
    : super(
        debugLabel: parent.debugLabel == null ? null : '${parent.debugLabel}/$debugLabel',
        initialScrollOffset: parent.initialScrollOffset,
        keepScrollOffset: parent.keepScrollOffset,
      );

  bool isActive;
  final ScrollController parent;

  @override
  ScrollPosition createScrollPosition(ScrollPhysics physics, ScrollContext context, ScrollPosition? oldPosition) {
    return parent.createScrollPosition(physics, context, oldPosition);
  }

  @override
  void attach(ScrollPosition position) {
    super.attach(position);
    if (isActive && !parent.positions.contains(position)) {
      parent.attach(position);
    }
  }

  @override
  void detach(ScrollPosition position) {
    if (parent.positions.contains(position)) {
      parent.detach(position);
    }
    super.detach(position);
  }

  void forceDetach() {
    for (final position in positions) {
      if (parent.positions.contains(position)) {
        parent.detach(position);
      }
    }
  }

  void forceAttach() {
    for (final position in positions) {
      if (!parent.positions.contains(position)) {
        parent.attach(position);
      }
    }
  }

  @override
  void dispose() {
    forceDetach();
    super.dispose();
  }
}
