import 'package:flutter/material.dart';
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
            const SizedBox(height: 8),
            ServiceDetailRow(label: 'Process', value: service.processName),
            const SizedBox(height: 8),
            ServiceDetailRow(label: 'PID', value: service.pid.toString()),
            if (service.ramUsage != null) ...[
              const SizedBox(height: 8),
              ServiceDetailRow(label: 'RAM Usage', value: service.ramUsage!),
            ],
            if (service.serviceClass != null) ...[
              const SizedBox(height: 8),
              ServiceDetailRow(label: 'Service Class', value: service.serviceClass!),
            ],
            const SizedBox(height: 8),
            ServiceDetailRow(label: 'Type', value: service.isSystemApp ? 'System App' : 'User App'),
          ],
        ),
      ),
      actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))],
    );
  }
}
