import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/core/extensions.dart';

class LoadingState extends StatelessWidget {
  final String? status;

  const LoadingState({super.key, this.status});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          SizedBox(height: 16.h),
          Text(status ?? context.loc.loadingServices, style: TextStyle(fontSize: 16.sp)),
        ],
      ),
    );
  }
}
