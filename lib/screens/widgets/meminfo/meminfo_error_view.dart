import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/core/extensions.dart';

class MemInfoErrorView extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const MemInfoErrorView({super.key, required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48.sp, color: Theme.of(context).colorScheme.error),
            SizedBox(height: 16.h),
            Text(
              context.loc.error,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              message,
              style: TextStyle(fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            FilledButton.icon(onPressed: onRetry, icon: Icon(Icons.refresh), label: Text(context.loc.retry)),
          ],
        ),
      ),
    );
  }
}
