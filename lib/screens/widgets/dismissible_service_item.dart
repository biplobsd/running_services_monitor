import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/stop_service_bloc/stop_service_bloc.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/l10n/app_localizations.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'service_list_item.dart';

class DismissibleServiceItem extends StatelessWidget {
  final RunningServiceInfo service;

  const DismissibleServiceItem({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StopServiceBloc>(),
      child: BlocListener<StopServiceBloc, StopServiceState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            stopping: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      ),
                      const SizedBox(width: 16),
                      Text(AppLocalizations.of(context)!.loading),
                    ],
                  ),
                  duration: const Duration(seconds: 10),
                  backgroundColor: Colors.blue[700],
                ),
              );
            },
            success: (packageName) {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      const Icon(Icons.check_circle, color: Colors.white),
                      const SizedBox(width: 16),
                      Expanded(child: Text(AppLocalizations.of(context)!.serviceStopped)),
                    ],
                  ),
                  backgroundColor: Colors.green[700],
                  duration: const Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                ),
              );
              // Note: The entire app will be stopped, so all services for this package will be gone
              // The AppDetailsScreen will handle the refresh/navigation
            },
            error: (message) {
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      const Icon(Icons.error, color: Colors.white),
                      const SizedBox(width: 16),
                      Expanded(child: Text('${AppLocalizations.of(context)!.stopServiceError}: $message')),
                    ],
                  ),
                  backgroundColor: Colors.red[700],
                  duration: const Duration(seconds: 4),
                  behavior: SnackBarBehavior.floating,
                  action: SnackBarAction(label: 'OK', textColor: Colors.white, onPressed: () {}),
                ),
              );
            },
          );
        },
        child: Dismissible(
          key: Key('${service.packageName}_${service.pid}'),
          direction: DismissDirection.endToStart,
          confirmDismiss: (direction) async {
            return await showDialog<bool>(
              context: context,
              builder: (dialogContext) => AlertDialog(
                title: Text(AppLocalizations.of(context)!.stopServiceConfirm),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(service.serviceName, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('PID: ${service.pid}', style: const TextStyle(fontSize: 12)),
                    const SizedBox(height: 8),
                    Text(
                      AppLocalizations.of(context)!.stopServiceWarning,
                      style: TextStyle(color: Theme.of(context).colorScheme.error, fontSize: 12),
                    ),
                    if (service.isSystemApp) ...[
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red[900]?.withOpacity(0.3),
                          border: Border.all(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.systemAppWarning,
                          style: TextStyle(color: Colors.red[300], fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ),
                    ],
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(dialogContext).pop(false),
                    child: Text(AppLocalizations.of(context)!.cancel),
                  ),
                  FilledButton(
                    onPressed: () {
                      Navigator.of(dialogContext).pop(true);
                      context.read<StopServiceBloc>().add(
                        StopServiceEvent.stopService(packageName: service.packageName, servicePid: service.pid),
                      );
                    },
                    style: FilledButton.styleFrom(backgroundColor: Colors.red),
                    child: Text(AppLocalizations.of(context)!.stop),
                  ),
                ],
              ),
            );
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 16),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.stop_circle, color: Colors.white, size: 32),
                SizedBox(height: 4),
                Text(
                  'Stop',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          child: ServiceListItem(service: service),
        ),
      ),
    );
  }
}
