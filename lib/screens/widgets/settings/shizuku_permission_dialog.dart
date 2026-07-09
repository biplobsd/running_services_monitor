import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

    return DefaultTabController(
      length: 2,
      child: AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(isSetup ? Icons.warning_amber_rounded : Icons.lock_outlined, color: Colors.orange, size: 24),
                AppStyles.spacing8,
                Expanded(
                  child: Text(
                    isSetup ? loc.shizukuRequired : loc.permissionRequired,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ],
            ),
            AppStyles.spacingH16,
            TabBar(
              labelStyle: AppStyles.bodyStyle.copyWith(fontWeight: FontWeight.bold),
              unselectedLabelStyle: AppStyles.bodyStyle,
              tabs: [
                Tab(text: loc.shizukuMode),
                Tab(text: loc.rootMode),
              ],
            ),
          ],
        ),
        content: SizedBox(
          width: double.maxFinite,
          height: 280,
          child: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isSetup ? loc.shizukuRequiredMessage : loc.permissionRequiredMessage,
                      style: AppStyles.bodyStyle.copyWith(fontWeight: FontWeight.w500),
                    ),
                    AppStyles.spacingH16,
                    Text(
                      isSetup ? loc.setupSteps : loc.permissionSteps,
                      style: AppStyles.bodyStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
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
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      loc.rootRequiredMessage,
                      style: AppStyles.bodyStyle.copyWith(fontWeight: FontWeight.w500),
                    ),
                    AppStyles.spacingH16,
                    Text(
                      loc.rootSetupSteps,
                      style: AppStyles.bodyStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                    AppStyles.spacingH8,
                    SetupStepItem(number: '1', text: loc.rootStep1),
                    SetupStepItem(number: '2', text: loc.rootStep2),
                    SetupStepItem(number: '3', text: loc.rootStep3),
                    SetupStepItem(number: '4', text: loc.rootStep4),
                  ],
                ),
              ),
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
            icon: const Icon(Icons.open_in_new, size: 18),
            label: Text(loc.openShizuku, style: AppStyles.bodyStyle),
          ),
          FilledButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh, size: 18),
            label: Text(loc.retry, style: AppStyles.bodyStyle),
          ),
        ],
      ),
    );
  }
}
