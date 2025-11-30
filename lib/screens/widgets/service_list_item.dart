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
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: ServiceIcon(service: service),
        title: Text(service.appName ?? service.packageName, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              service.packageName,
              style: TextStyle(fontSize: 12.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
            ),
            if (service.ramUsage != null) ...[
              const SizedBox(height: 2),
              Row(
                children: [
                  Icon(Icons.memory, size: 12, color: Theme.of(context).colorScheme.secondary),
                  const SizedBox(width: 4),
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
              const SizedBox(height: 2),
              Text(
                'Service: ${service.serviceClass}',
                style: TextStyle(fontSize: 11.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            const SizedBox(height: 2),
            Row(
              children: [
                Icon(Icons.numbers, size: 12, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 4),
                Text(
                  'PID: ${service.pid}',
                  style: TextStyle(fontSize: 11.sp, color: Theme.of(context).colorScheme.primary),
                ),
                const SizedBox(width: 12),
                Icon(
                  service.isSystemApp ? Icons.android : Icons.person,
                  size: 12,
                  color: service.isSystemApp
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.tertiary,
                ),
                const SizedBox(width: 4),
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
