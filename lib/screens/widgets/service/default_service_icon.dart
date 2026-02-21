import 'package:flutter/material.dart';
import 'package:running_services_monitor/models/service_info.dart';

class DefaultServiceIcon extends StatelessWidget {
  final RunningServiceInfo service;
  final double size;

  const DefaultServiceIcon({super.key, required this.service, this.size = 40});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: colorScheme.primaryContainer, borderRadius: BorderRadius.circular(8)),
      child: Icon(service.isSystemApp ? Icons.android : Icons.apps, color: colorScheme.onPrimaryContainer, size: size * 0.6),
    );
  }
}
