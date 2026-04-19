import 'package:flutter/material.dart';

class CommandOutputHighlightedText extends StatefulWidget {
  final String text;
  final String searchQuery;
  final List<int> searchMatches;
  final int currentMatchIndex;
  final double fontSize;
  final Color textColor;
  final Color backgroundColor;
  final ScrollController scrollController;
  final double scrollTopPadding;
  final double scrollLeftPadding;

  const CommandOutputHighlightedText({super.key, required this.text, required this.searchQuery, required this.searchMatches, required this.currentMatchIndex, required this.fontSize, required this.textColor, required this.backgroundColor, required this.scrollController, this.scrollTopPadding = 32, this.scrollLeftPadding = 24});

  @override
  State<CommandOutputHighlightedText> createState() => CommandOutputHighlightedTextState();
}

class CommandOutputHighlightedTextState extends State<CommandOutputHighlightedText> {
  final ScrollController horizontalScrollController = ScrollController();

  @override
  void dispose() {
    horizontalScrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CommandOutputHighlightedText oldWidget) {
    super.didUpdateWidget(oldWidget);
    final didChangeIndex = oldWidget.currentMatchIndex != widget.currentMatchIndex;
    final didChangeQuery = oldWidget.searchQuery != widget.searchQuery;
    final didChangeMatches = oldWidget.searchMatches.length != widget.searchMatches.length;
    final didChangeText = oldWidget.text != widget.text;
    if (didChangeIndex || didChangeQuery || didChangeMatches || didChangeText) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        scrollToCurrentMatch(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: SingleChildScrollView(
        controller: horizontalScrollController,
        scrollDirection: Axis.horizontal,
        child: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: widget.fontSize, fontFamily: 'monospace', height: 1.5, color: widget.textColor),
            children: buildTextSpans(),
          ),
        ),
      ),
    );
  }

  List<TextSpan> buildTextSpans() {
    if (widget.searchQuery.isEmpty || widget.searchMatches.isEmpty) {
      return [TextSpan(text: widget.text)];
    }
    final spans = <TextSpan>[];
    var currentPosition = 0;
    final queryLength = widget.searchQuery.length;
    for (var i = 0; i < widget.searchMatches.length; i++) {
      final matchStart = widget.searchMatches[i];
      if (matchStart > currentPosition) {
        spans.add(TextSpan(text: widget.text.substring(currentPosition, matchStart)));
      }
      final matchEnd = (matchStart + queryLength).clamp(0, widget.text.length);
      final isCurrent = i == widget.currentMatchIndex;
      spans.add(
        TextSpan(
          text: widget.text.substring(matchStart, matchEnd),
          style: TextStyle(backgroundColor: isCurrent ? Colors.orangeAccent : Colors.yellowAccent, color: Colors.black, fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w600),
        ),
      );
      currentPosition = matchEnd;
    }
    if (currentPosition < widget.text.length) {
      spans.add(TextSpan(text: widget.text.substring(currentPosition)));
    }
    return spans;
  }

  void scrollToCurrentMatch(BuildContext context) {
    if (!widget.scrollController.hasClients) {
      return;
    }
    if (widget.currentMatchIndex < 0 || widget.currentMatchIndex >= widget.searchMatches.length) {
      return;
    }
    final matchStart = widget.searchMatches[widget.currentMatchIndex];
    final textBeforeMatch = widget.text.substring(0, matchStart);
    final lineCountBefore = '\n'.allMatches(textBeforeMatch).length;
    final lineOffset = lineCountBefore * widget.fontSize * 1.5;
    final headerHeight = 100.0;
    final targetOffset = lineOffset + headerHeight - widget.scrollTopPadding;
    final clampedOffset = targetOffset.clamp(0, widget.scrollController.position.maxScrollExtent);
    widget.scrollController.animateTo(clampedOffset.toDouble(), duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);

    if (!horizontalScrollController.hasClients) {
      return;
    }
    final lineStart = widget.text.lastIndexOf('\n', matchStart) + 1;
    final textBeforeMatchInLine = widget.text.substring(lineStart, matchStart);
    final textPainter = TextPainter(
      text: TextSpan(
        text: textBeforeMatchInLine,
        style: TextStyle(fontSize: widget.fontSize, fontFamily: 'monospace', height: 1.5),
      ),
      textDirection: Directionality.of(context),
      maxLines: 1,
    )..layout();
    final horizontalTargetOffset = textPainter.width - widget.scrollLeftPadding;
    final horizontalClampedOffset = horizontalTargetOffset.clamp(0, horizontalScrollController.position.maxScrollExtent);
    horizontalScrollController.animateTo(horizontalClampedOffset.toDouble(), duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
