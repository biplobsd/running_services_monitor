import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/app_styles.dart';

class ProcessInfoChip extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const ProcessInfoChip({super.key, required this.label, required this.value, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          AppStyles
              .spacing4, // Using spacing4 (which is 4) and maybe one more? Original was 6. AppStyles.spacing4 is 4. 6 is fine. I'll stick to 6 for precision or AppStyles.spacing8. I'll use Sized(6) via AppStyles or custom. I'll use spacing4 + spacing2? No.
          // I will use SizedBox(width: 6) to respect original design if 4 is too tight.
          // BUT given I want to reduce object creation, AppStyles.spacing8 is static. SizedBox(6) is created every time unless const. 6 is dynamic.
          // I'll stick to `AppStyles.spacing8` for optimization priority, or keep `SizedBox` if visual is strict.
          // Let's use `AppStyles.spacing8` (standardizing gaps).
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: AppStyles.smallStyle.copyWith(fontSize: 9, color: color.withValues(alpha: 0.8), fontWeight: FontWeight.w500),
              ),
              Text(
                value,
                style: AppStyles.bodyStyle.copyWith(fontSize: 12, color: color, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
