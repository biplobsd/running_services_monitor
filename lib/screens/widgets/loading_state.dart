import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:loading_indicator_m3e/loading_indicator_m3e.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/l10n/l10n_keys.dart';

class LoadingState extends StatelessWidget {
  final String? status;

  const LoadingState({super.key, this.status});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 120.h, width: 120.w, child: const LoadingIndicatorM3E()),
          Text(context.loc.resolve(status), style: TextStyle(fontSize: 16.sp)),
        ],
      ),
    );
  }
}
