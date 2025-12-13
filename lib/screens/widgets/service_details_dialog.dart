import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/bloc/stop_service_bloc/stop_service_bloc.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'service_detail_row.dart';
import 'status_badge.dart';

class ServiceDetailsDialog extends StatelessWidget {
  final RunningServiceInfo service;

  const ServiceDetailsDialog({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      title: Text(service.appName ?? service.packageName, style: TextStyle(fontSize: 18.sp)),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ServiceDetailRow(label: context.loc.package, value: service.packageName),
            SizedBox(height: 8.h),
            ServiceDetailRow(label: context.loc.service, value: service.serviceName),
            SizedBox(height: 8.h),
            ServiceDetailRow(label: context.loc.process, value: service.processName),
            if (service.pid != null) ...[
              SizedBox(height: 8.h),
              ServiceDetailRow(label: context.loc.pid, value: service.pid.toString()),
            ],
            if (service.uid != null) ...[
              SizedBox(height: 8.h),
              ServiceDetailRow(label: context.loc.uid, value: service.uid.toString()),
            ],
            if (service.recentCallingUid != null) ...[
              SizedBox(height: 8.h),
              ServiceDetailRow(label: context.loc.recentCallingUid, value: service.recentCallingUid.toString()),
            ],
            if (service.ramUsage != null) ...[
              SizedBox(height: 8.h),
              ServiceDetailRow(label: context.loc.ramUsage, value: service.ramUsage!),
            ],
            if (service.intent != null) ...[
              SizedBox(height: 8.h),
              ServiceDetailRow(label: context.loc.intent, value: service.intent!),
            ],
            if (service.isForeground != null) ...[
              SizedBox(height: 8.h),
              ServiceDetailRow(
                label: context.loc.foreground,
                value: service.isForeground! ? context.loc.yes : context.loc.no,
              ),
            ],
            if (service.foregroundId != null && service.foregroundId != 0) ...[
              SizedBox(height: 8.h),
              ServiceDetailRow(label: context.loc.foregroundId, value: service.foregroundId.toString()),
            ],
            if (service.startRequested != null) ...[
              SizedBox(height: 8.h),
              ServiceDetailRow(
                label: context.loc.startRequested,
                value: service.startRequested! ? context.loc.yes : context.loc.no,
              ),
            ],
            if (service.createdFromFg != null) ...[
              SizedBox(height: 8.h),
              ServiceDetailRow(
                label: context.loc.createdFromFg,
                value: service.createdFromFg! ? context.loc.yes : context.loc.no,
              ),
            ],
            if (service.createTime != null) ...[
              SizedBox(height: 8.h),
              ServiceDetailRow(label: context.loc.createTime, value: service.createTime!),
            ],
            if (service.lastActivityTime != null) ...[
              SizedBox(height: 8.h),
              ServiceDetailRow(label: context.loc.lastActivity, value: service.lastActivityTime!),
            ],
            if (service.baseDir != null) ...[
              SizedBox(height: 8.h),
              ServiceDetailRow(label: context.loc.baseDir, value: service.baseDir!),
            ],
            if (service.dataDir != null) ...[
              SizedBox(height: 8.h),
              ServiceDetailRow(label: context.loc.dataDir, value: service.dataDir!),
            ],
            SizedBox(height: 8.h),
            ServiceDetailRow(
              label: context.loc.type,
              value: service.isSystemApp ? context.loc.systemApp : context.loc.userApp,
            ),
            if (service.connections.isNotEmpty) ...[
              SizedBox(height: 16.h),
              ExpansionTile(
                tilePadding: EdgeInsets.zero,
                title: Text(
                  '${context.loc.connections} (${service.connections.length})',
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                children: [
                  ...service.connections.map(
                    (conn) => Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 8.h),
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8.rSafe),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${conn.packageName}/${conn.serviceName}',
                            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 4.h),
                          if (conn.flags != null)
                            Text(
                              '${context.loc.flags}: ${conn.flags}',
                              style: TextStyle(fontSize: 10.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
                            ),
                          Row(
                            children: [
                              if (conn.isForeground == true)
                                Padding(
                                  padding: EdgeInsets.only(right: 4.w, top: 4.h),
                                  child: StatusBadge(label: 'FGS', color: Colors.green, fontSize: 9.sp),
                                ),
                              if (conn.isVisible == true)
                                Padding(
                                  padding: EdgeInsets.only(right: 4.w, top: 4.h),
                                  child: StatusBadge(label: 'VIS', color: Colors.blue, fontSize: 9.sp),
                                ),
                              if (conn.hasCapabilities == true)
                                Padding(
                                  padding: EdgeInsets.only(right: 4.w, top: 4.h),
                                  child: StatusBadge(label: 'CAPS', color: Colors.orange, fontSize: 9.sp),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
            if (service.rawServiceRecord != null) ...[
              SizedBox(height: 16.h),
              ExpansionTile(
                tilePadding: EdgeInsets.zero,
                title: Text(
                  context.loc.rawOutput,
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(8.rSafe),
                    ),
                    child: SelectableText(
                      service.rawServiceRecord!,
                      scrollPhysics: NeverScrollableScrollPhysics(),
                      style: TextStyle(fontSize: 10.sp, fontFamily: 'monospace'),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(context.loc.close, style: TextStyle(fontSize: 14.sp)),
        ),
        FilledButton(
          onPressed: () {
            context.read<StopServiceBloc>().add(
              StopServiceEvent.stopSingleService(
                packageName: service.packageName,
                serviceName: service.serviceName,
                pid: service.pid,
              ),
            );
            Navigator.of(context).pop();
          },
          style: FilledButton.styleFrom(backgroundColor: Colors.red),
          child: Text(context.loc.stop, style: TextStyle(fontSize: 14.sp)),
        ),
      ],
    );
  }
}
