import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/utils/format_utils.dart';
import 'service_details_dialog.dart';

class ServiceListItem extends StatelessWidget {
  final RunningServiceInfo service;

  const ServiceListItem({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final loc = context.loc;

    return Card(
      margin: AppStyles.cardMargin,
      child: ListTile(
        title: Text(service.packageName, style: AppStyles.titleStyle),
        subtitle: Column(
          spacing: 8.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(service.serviceName, style: AppStyles.subtitleStyle.copyWith(color: colors.onSurfaceVariant)),
            Row(
              spacing: 8.w,
              children: [
                if (service.ramInKb != null)
                  Row(
                    spacing: 4.w,
                    children: [
                      Icon(Icons.memory, size: 12.w, color: colors.secondary),
                      Text(
                        service.ramInKb.formatRam(),
                        style: AppStyles.captionStyle.copyWith(fontWeight: FontWeight.bold, color: colors.secondary),
                      ),
                    ],
                  ),
                if (service.serviceClass != null)
                  Flexible(
                    child: Text(
                      '${loc.service}: ${service.serviceClass}',
                      style: AppStyles.captionStyle.copyWith(color: colors.onSurfaceVariant),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                if (service.pid != null)
                  Row(
                    spacing: 4.w,
                    children: [
                      Icon(Icons.numbers, size: 12.w, color: colors.primary),
                      Text('${loc.pid}: ${service.pid}', style: AppStyles.captionStyle.copyWith(color: colors.primary)),
                    ],
                  ),
              ],
            ),
          ],
        ),
        onTap: () => ServiceDetailsSheet.show(context, service),
      ),
    );
  }
}
