import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/models/service_info.dart';

class DefaultServiceIcon extends StatelessWidget {
  final RunningServiceInfo service;
  final double size;

  const DefaultServiceIcon({super.key, required this.service, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8.rSafe),
      ),
      child: Icon(
        service.isSystemApp ? Icons.android : Icons.apps,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        size: size * 0.6,
      ),
    );
  }
}
