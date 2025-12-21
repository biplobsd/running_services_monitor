import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';

class CodeOutputBox extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? textColor;
  final Color? backgroundColor;
  final bool horizontalScroll;
  final bool hasBorder;

  const CodeOutputBox({
    super.key,
    required this.text,
    this.fontSize,
    this.textColor,
    this.backgroundColor,
    this.horizontalScroll = false,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveFontSize = fontSize ?? 12.sp;
    final effectiveTextColor = textColor ?? Theme.of(context).colorScheme.onSurface;
    final effectiveBackgroundColor = backgroundColor ?? Theme.of(context).colorScheme.surfaceContainerHighest;

    final selectableText = SelectableText(
      text,
      scrollPhysics: NeverScrollableScrollPhysics(),
      style: TextStyle(fontSize: effectiveFontSize, fontFamily: 'monospace', height: 1.5, color: effectiveTextColor),
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(horizontalScroll ? 12.w : 8.w),
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: BorderRadius.circular(8.r),
        border: hasBorder ? Border.all(color: Theme.of(context).colorScheme.outlineVariant) : null,
      ),
      child: horizontalScroll
          ? SingleChildScrollView(scrollDirection: Axis.horizontal, child: selectableText)
          : selectableText,
    );
  }
}
