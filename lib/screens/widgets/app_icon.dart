import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:running_services_monitor/bloc/app_info_bloc/app_info_bloc.dart';
import 'package:running_services_monitor/core/dependency_injection/dependency_injection.dart';
import 'package:running_services_monitor/models/service_info.dart';

class AppIcon extends StatelessWidget {
  final AppProcessInfo appInfo;
  final double size;

  const AppIcon({super.key, required this.appInfo, this.size = 48});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: BlocSelector<AppInfoBloc, AppInfoState, Uint8List?>(
        bloc: getIt<AppInfoBloc>(),
        selector: (state) {
          return state.value.cachedApps[appInfo.packageName]?.icon;
        },
        builder: (context, icon) {
          if (icon != null) {
            return Image.memory(icon, width: size, height: size, gaplessPlayback: true);
          }

          return Icon(Icons.android, size: size);
        },
      ),
    );
  }
}
