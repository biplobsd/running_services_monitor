import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'service_icon.dart';
import 'service_details_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/stop_service_bloc/stop_service_bloc.dart';

class ServiceListItem extends StatelessWidget {
  final RunningServiceInfo service;

  const ServiceListItem({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      child: ListTile(
        leading: ServiceIcon(service: service),
        title: Text(
          service.appName ?? service.packageName,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
        ),
        subtitle: SelectionArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4.h),
              Text(
                service.packageName,
                style: TextStyle(fontSize: 12.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
              if (service.ramUsage != null) ...[
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Icon(Icons.memory, size: 12.w, color: Theme.of(context).colorScheme.secondary),
                    SizedBox(width: 4.w),
                    Text(
                      service.ramUsage!,
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ],
              if (service.serviceClass != null) ...[
                SizedBox(height: 2.h),
                Text(
                  'Service: ${service.serviceClass}',
                  style: TextStyle(fontSize: 11.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              SizedBox(height: 2.h),
              Row(
                children: [
                  Icon(Icons.numbers, size: 12.w, color: Theme.of(context).colorScheme.primary),
                  SizedBox(width: 4.w),
                  Text(
                    'PID: ${service.pid}',
                    style: TextStyle(fontSize: 11.sp, color: Theme.of(context).colorScheme.primary),
                  ),
                  SizedBox(width: 12.w),
                  Icon(
                    service.isSystemApp ? Icons.android : Icons.person,
                    size: 12.w,
                    color: service.isSystemApp
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.tertiary,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    service.isSystemApp ? 'System' : 'User',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: service.isSystemApp
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        trailing: Icon(Icons.chevron_right, color: Theme.of(context).colorScheme.onSurfaceVariant),
        onTap: () {
          final stopServiceBloc = context.read<StopServiceBloc>();
          showDialog(
            context: context,
            builder: (context) => BlocProvider.value(
              value: stopServiceBloc,
              child: ServiceDetailsDialog(service: service),
            ),
          );
        },
      ),
    );
  }
}
