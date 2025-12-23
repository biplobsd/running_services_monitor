import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/core/utils/android_settings_helper.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/utils/url_launcher_helper.dart';
import 'setup_step_item.dart';

enum ShizukuDialogType { setup, permission }

class ShizukuPermissionDialog extends StatelessWidget {
  final VoidCallback onRetry;
  final ShizukuDialogType type;

  const ShizukuPermissionDialog({super.key, required this.onRetry, this.type = ShizukuDialogType.permission});

  @override
  Widget build(BuildContext context) {
    final isSetup = type == ShizukuDialogType.setup;

    final loc = context.loc;
    return AlertDialog(
      title: Row(
        children: [
          Icon(isSetup ? Icons.warning_amber_rounded : Icons.lock_outlined, color: Colors.orange, size: 24.sp),
          AppStyles.spacing8,
          Text(
            isSetup ? loc.shizukuRequired : loc.permissionRequired,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp), // Consider AppStyles.headerStyle
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(isSetup ? loc.shizukuRequiredMessage : loc.permissionRequiredMessage, style: AppStyles.bodyStyle.copyWith(fontWeight: FontWeight.w500)),
            AppStyles.spacingH16,
            Text(isSetup ? loc.setupSteps : loc.permissionSteps, style: AppStyles.bodyStyle.copyWith(fontWeight: FontWeight.bold)),
            AppStyles.spacingH8,
            if (isSetup) ...[
              SetupStepItem(number: '1', text: loc.step1),
              SetupStepItem(number: '2', text: loc.step2),
              SetupStepItem(number: '3', text: loc.step3),
              SetupStepItem(number: '4', text: loc.step4),
              SetupStepItem(number: '5', text: loc.step5),
            ] else ...[
              SetupStepItem(number: '1', text: loc.permissionStep1),
              SetupStepItem(number: '2', text: loc.permissionStep2),
              SetupStepItem(number: '3', text: loc.permissionStep3),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => SystemNavigator.pop(),
          child: Text(loc.exitApp, style: AppStyles.bodyStyle),
        ),
        TextButton(
          onPressed: AndroidSettingsHelper.tryOpenSystemRunningServices,
          child: Text(loc.runningServicesTitle, style: AppStyles.bodyStyle),
        ),
        FilledButton.icon(
          onPressed: UrlLauncherHelper.openShizukuOrPlayStore,
          icon: Icon(Icons.open_in_new, size: 18.sp),
          label: Text(loc.openShizuku, style: AppStyles.bodyStyle),
        ),
        FilledButton.icon(
          onPressed: onRetry,
          icon: Icon(Icons.refresh, size: 18.sp),
          label: Text(loc.retry, style: AppStyles.bodyStyle),
        ),
      ],
    );
  }
}
