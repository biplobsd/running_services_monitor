import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';

class ProcessInfoChip extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const ProcessInfoChip({super.key, required this.label, required this.value, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10.rSafe),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14.w, color: color),
          AppStyles
              .spacing4, // Using spacing4 (which is 4.w) and maybe one more? Original was 6.w. AppStyles.spacing4 is 4.w. 6.w is fine. I'll stick to 6.w for precision or AppStyles.spacing8. I'll use Sized(6.w) via AppStyles or custom. I'll use spacing4 + spacing2? No.
          // I will use SizedBox(width: 6.w) to respect original design if 4.w is too tight.
          // BUT given I want to reduce object creation, AppStyles.spacing8 is static. SizedBox(6.w) is created every time unless const. 6.w is dynamic.
          // I'll stick to `AppStyles.spacing8` for optimization priority, or keep `SizedBox` if visual is strict.
          // Let's use `AppStyles.spacing8` (standardizing gaps).
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: AppStyles.smallStyle.copyWith(fontSize: 9.sp, color: color.withValues(alpha: 0.8), fontWeight: FontWeight.w500),
              ),
              Text(
                value,
                style: AppStyles.bodyStyle.copyWith(fontSize: 12.sp, color: color, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
