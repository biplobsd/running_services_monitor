import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
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

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16.rSafe),
        border: Border.all(color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.widgets, size: 20.sp, color: Theme.of(context).colorScheme.secondary),
              SizedBox(width: 8.w),
              Text(
                context.loc.objects,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.h,
              childAspectRatio: 1.3,
            ),
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
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12.rSafe),
        border: Border.all(color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.1)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(item.icon, size: 18.sp, color: Theme.of(context).colorScheme.primary),
          SizedBox(height: 4.h),
          Text(
            '${item.value}',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          Text(
            item.label,
            style: TextStyle(fontSize: 8.sp, color: Theme.of(context).colorScheme.onSurfaceVariant),
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
