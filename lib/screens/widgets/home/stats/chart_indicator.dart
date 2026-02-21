import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/app_styles.dart';

class ChartIndicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSelected;

  const ChartIndicator({super.key, required this.color, required this.text, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? color.withValues(alpha: 0.2) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: isSelected ? Border.all(color: color, width: 2) : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
          AppStyles.spacing8,
          Text(
            text,
            style: TextStyle(fontSize: 13, fontWeight: isSelected ? FontWeight.bold : FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
