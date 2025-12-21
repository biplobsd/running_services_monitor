import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/utils/format_utils.dart';

class MemInfoComparisonRow extends StatelessWidget {
  final String label;
  final int currentValue;
  final int compareValue;
  final IconData icon;

  const MemInfoComparisonRow({
    super.key,
    required this.label,
    required this.currentValue,
    required this.compareValue,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final diff = currentValue - compareValue;
    final diffPercent = compareValue > 0 ? ((diff / compareValue) * 100).abs() : 0.0;
    final isLower = diff < 0;
    final isEqual = diff == 0;

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12.rSafe),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon, size: 16.sp, color: Theme.of(context).colorScheme.primary),
              SizedBox(width: 8.w),
              Text(
                label,
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      formatRam(currentValue.toDouble()),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: isEqual
                      ? Colors.grey.withValues(alpha: 0.2)
                      : isLower
                      ? Colors.green.withValues(alpha: 0.2)
                      : Colors.red.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8.rSafe),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!isEqual)
                      Icon(
                        isLower ? Icons.arrow_downward : Icons.arrow_upward,
                        size: 12.sp,
                        color: isLower ? Colors.green : Colors.red,
                      ),
                    SizedBox(width: 4.w),
                    Text(
                      isEqual ? '=' : '${diffPercent.toStringAsFixed(0)}%',
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                        color: isEqual ? Colors.grey : (isLower ? Colors.green : Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      formatRam(compareValue.toDouble()),
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
