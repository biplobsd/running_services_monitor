import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/service_info.dart';
import '../common/code_output_box.dart';

class ServiceRawOutputSection extends StatelessWidget {
  final RunningServiceInfo service;

  const ServiceRawOutputSection({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return ExpansionTile(
      tilePadding: AppStyles.paddingH4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.rSafe)),
      collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.rSafe)),
      leading: Icon(Icons.code_rounded, size: 20.w, color: colorScheme.primary),
      title: Text(
        context.loc.rawOutput,
        style: textTheme.titleSmall?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.bold),
      ),
      children: [
        CodeOutputBox(
          text: service.rawServiceRecord!,
          fontSize: 11.sp,
          textColor: const Color(0xFF4EC9B0),
          backgroundColor: Colors.black87,
          hasBorder: true,
          horizontalScroll: true,
        ),
      ],
    );
  }
}
