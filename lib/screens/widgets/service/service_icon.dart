import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/app_info_bloc/app_info_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/models/service_info.dart';

import 'default_service_icon.dart';

class ServiceIcon extends StatelessWidget {
  final RunningServiceInfo service;
  final double size;

  const ServiceIcon({super.key, required this.service, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppInfoBloc, AppInfoState, Uint8List?>(
      bloc: getIt<AppInfoBloc>(),
      selector: (state) {
        return state.value.cachedApps[service.packageName]?.icon;
      },
      builder: (context, icon) {
        if (icon != null) {
          return Image.memory(
            icon,
            width: size,
            height: size,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => DefaultServiceIcon(service: service, size: size),
          );
        }

        return DefaultServiceIcon(service: service, size: size);
      },
    );
  }
}
