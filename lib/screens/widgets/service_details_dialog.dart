import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'service_detail_row.dart';

class ServiceDetailsDialog extends StatelessWidget {
  final RunningServiceInfo service;

  const ServiceDetailsDialog({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(service.appName ?? service.packageName),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ServiceDetailRow(label: 'Package', value: service.packageName),
            SizedBox(height: 8.h),
            ServiceDetailRow(label: 'Process', value: service.processName),
            SizedBox(height: 8.h),
            ServiceDetailRow(label: 'PID', value: service.pid.toString()),
            if (service.ramUsage != null) ...[
              SizedBox(height: 8.h),
              ServiceDetailRow(label: 'RAM Usage', value: service.ramUsage!),
            ],
            if (service.serviceClass != null) ...[
              SizedBox(height: 8.h),
              ServiceDetailRow(label: 'Service Class', value: service.serviceClass!),
            ],
            SizedBox(height: 8.h),
            ServiceDetailRow(label: 'Type', value: service.isSystemApp ? 'System App' : 'User App'),
          ],
        ),
      ),
      actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))],
    );
  }
}
