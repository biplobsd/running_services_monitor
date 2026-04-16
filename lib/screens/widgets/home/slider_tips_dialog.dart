import 'package:flutter/material.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';
import '../support/support_slider.dart';

class SliderTipsDialog extends StatelessWidget {
  final VoidCallback onDismiss;

  const SliderTipsDialog({super.key, required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final loc = context.loc;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: AppStyles.padding16,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(Icons.tips_and_updates_rounded, color: colorScheme.primary, size: 22),
                AppStyles.spacing8,
                Text(loc.tipsAndSupport, style: AppStyles.headerStyle),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close, size: 20),
                  onPressed: onDismiss,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            AppStyles.spacingH16,
            const SupportSlider(),
          ],
        ),
      ),
    );
  }
}
