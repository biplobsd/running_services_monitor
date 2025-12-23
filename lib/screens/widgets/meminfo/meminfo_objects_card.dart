import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/core/app_styles.dart';
import 'package:running_services_monitor/core/extensions.dart';
import 'package:running_services_monitor/models/meminfo_data.dart';

class MemInfoObjectsCard extends StatelessWidget {
  final ObjectsInfo objects;

  const MemInfoObjectsCard({super.key, required this.objects});

  @override
  Widget build(BuildContext context) {
    final items = [
      _ObjectItem('Views', objects.views, Icons.visibility),
      _ObjectItem('ViewRootImpl', objects.viewRootImpl, Icons.layers),
      _ObjectItem('AppContexts', objects.appContexts, Icons.apps),
      _ObjectItem('Activities', objects.activities, Icons.window),
      _ObjectItem('Assets', objects.assets, Icons.image),
      _ObjectItem('AssetManagers', objects.assetManagers, Icons.folder_open),
      _ObjectItem('Local Binders', objects.localBinders, Icons.link),
      _ObjectItem('Proxy Binders', objects.proxyBinders, Icons.sync_alt),
      _ObjectItem('Parcel Memory', objects.parcelMemory, Icons.inventory_2),
      _ObjectItem('Parcel Count', objects.parcelCount, Icons.numbers),
      _ObjectItem('Death Recipients', objects.deathRecipients, Icons.warning),
      _ObjectItem('WebViews', objects.webViews, Icons.web),
    ];

    final nonZeroItems = items.where((item) => item.value > 0).toList();

    if (nonZeroItems.isEmpty) {
      return SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: AppStyles.sectionPadding,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16.rSafe),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.widgets, size: 20.sp, color: colorScheme.secondary),
              AppStyles.spacing8,
              Text(context.loc.objects, style: AppStyles.titleStyle.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
          AppStyles.spacingH16,
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 8.w, mainAxisSpacing: 8.h, childAspectRatio: 1.3),
            itemCount: nonZeroItems.length,
            itemBuilder: (context, index) {
              final item = nonZeroItems[index];
              return _buildObjectTile(context, item);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildObjectTile(BuildContext context, _ObjectItem item) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: AppStyles.padding8,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12.rSafe),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.1)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(item.icon, size: 18.sp, color: colorScheme.primary),
          AppStyles.spacingH4,
          Text(
            '${item.value}',
            style: AppStyles.titleStyle.copyWith(fontWeight: FontWeight.bold, color: colorScheme.onSurface),
          ),
          Text(
            item.label,
            style: TextStyle(fontSize: 8.sp, color: colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _ObjectItem {
  final String label;
  final int value;
  final IconData icon;

  _ObjectItem(this.label, this.value, this.icon);
}
