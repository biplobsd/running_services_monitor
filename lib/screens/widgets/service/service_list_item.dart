import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'service_details_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/stop_service_bloc/stop_service_bloc.dart';

class ServiceListItem extends StatelessWidget {
  final RunningServiceInfo service;

  const ServiceListItem({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 25.w, vertical: 4.h),
      child: ListTile(
        title: Text(
          service.appName ?? service.packageName,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
        ),
        subtitle: Column(
          spacing: 8.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              service.serviceName,
              style: TextStyle(fontSize: 12.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
            ),
            Row(
              spacing: 8.w,
              children: [
                if (service.ramUsage != null)
                  Row(
                    spacing: 4.w,
                    children: [
                      Icon(Icons.memory, size: 12.w, color: Theme.of(context).colorScheme.secondary),
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
                if (service.serviceClass != null)
                  Text(
                    '${context.loc.service}: ${service.serviceClass}',
                    style: TextStyle(fontSize: 11.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                if (service.pid != null)
                  Row(
                    spacing: 4.w,
                    children: [
                      Icon(Icons.numbers, size: 12.w, color: Theme.of(context).colorScheme.primary),
                      Text(
                        '${context.loc.pid}: ${service.pid?.toString() ?? 'N/A'}',
                        style: TextStyle(fontSize: 11.sp, color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
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
