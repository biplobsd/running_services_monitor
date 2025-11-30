import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/core/constants.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'setup_step_item.dart';

enum ShizukuDialogType { setup, permission }

class ShizukuPermissionDialog extends StatelessWidget {
  final VoidCallback onRetry;
  final ShizukuDialogType type;

  const ShizukuPermissionDialog({
    super.key,
    required this.onRetry,
    this.type = ShizukuDialogType.permission,
  });

  Future<void> _openShizukuOrPlayStore() async {
    final marketUri = Uri.parse('market://details?id=${AppConstants.shizukuPackageName}');
    final playStoreUri = Uri.parse(AppConstants.shizukuPlayStoreUrl);

    try {
      final canLaunchMarket = await canLaunchUrl(marketUri);
      if (canLaunchMarket) {
        await launchUrl(marketUri, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(playStoreUri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      try {
        await launchUrl(playStoreUri, mode: LaunchMode.externalApplication);
      } catch (e) {
        debugPrint('Error opening Shizuku or Play Store: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isSetup = type == ShizukuDialogType.setup;
    
    return AlertDialog(
      title: Row(
        children: [
          Icon(
            isSetup ? Icons.warning_amber_rounded : Icons.lock_outlined,
            color: Colors.orange,
            size: 24.sp,
          ),
          SizedBox(width: 8.w),
          Text(
            isSetup ? context.loc.shizukuRequired : context.loc.permissionRequired,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isSetup ? context.loc.shizukuRequiredMessage : context.loc.permissionRequiredMessage,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
            ),
            SizedBox(height: 16.h),
            Text(
              isSetup ? context.loc.setupSteps : context.loc.permissionSteps,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
            SizedBox(height: 8.h),
            if (isSetup) ...[
              SetupStepItem(number: '1', text: context.loc.step1),
              SetupStepItem(number: '2', text: context.loc.step2),
              SetupStepItem(number: '3', text: context.loc.step3),
              SetupStepItem(number: '4', text: context.loc.step4),
              SetupStepItem(number: '5', text: context.loc.step5),
            ] else ...[
              SetupStepItem(number: '1', text: context.loc.permissionStep1),
              SetupStepItem(number: '2', text: context.loc.permissionStep2),
              SetupStepItem(number: '3', text: context.loc.permissionStep3),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => SystemNavigator.pop(),
          child: Text(context.loc.exitApp, style: TextStyle(fontSize: 14.sp)),
        ),
      
          FilledButton.icon(
            onPressed: _openShizukuOrPlayStore,
            icon: Icon(Icons.open_in_new, size: 18.sp),
            label: Text(context.loc.openShizuku, style: TextStyle(fontSize: 14.sp)),
          ),
        FilledButton.icon(
          onPressed: onRetry,
          icon: Icon(Icons.refresh, size: 18.sp),
          label: Text(context.loc.retry, style: TextStyle(fontSize: 14.sp)),
        ),
      ],
    );
  }
}
