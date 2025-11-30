import 'package:flutter/material.dart';
import 'package:flutter_scale_kit/flutter_scale_kit.dart';
import 'package:running_services_monitor/l10n/app_localizations.dart';
import 'ram_legend_item.dart';

class RamBar extends StatelessWidget {
  final double totalRamKb;
  final double usedRamKb;
  final double appsRamKb;
  final double freeRamKb;

  const RamBar({
    super.key,
    required this.totalRamKb,
    required this.usedRamKb,
    required this.appsRamKb,
    required this.freeRamKb,
  });

  String _formatRam(double kb) {
    if (kb > 1024 * 1024) {
      return '${(kb / (1024 * 1024)).toStringAsFixed(2)} GB';
    } else if (kb > 1024) {
      return '${(kb / 1024).toStringAsFixed(1)} MB';
    }
    return '${kb.toStringAsFixed(0)} KB';
  }

  @override
  Widget build(BuildContext context) {


    double systemRamKb = usedRamKb - appsRamKb;
    if (systemRamKb < 0) systemRamKb = 0;


    if (totalRamKb <= 0) {
      return const SizedBox.shrink();
    }

    final double systemFlex = systemRamKb / totalRamKb;
    final double appsFlex = appsRamKb / totalRamKb;
    final double freeFlex = freeRamKb / totalRamKb;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 5.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.deviceMemory,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 15.h),

          ClipRRect(
            borderRadius: BorderRadius.circular(8.rSafe),
            child: SizedBox(
              height: 24.h,
              child: Row(
                children: [

                  Expanded(
                    flex: (systemFlex * 1000).toInt(),
                    child: Container(color: Colors.grey[700]),
                  ),

                  Expanded(
                    flex: (appsFlex * 1000).toInt(),
                    child: Container(color: Colors.lightBlue[200]),
                  ),

                  Expanded(
                    flex: (freeFlex * 1000).toInt(),
                    child: Container(color: Colors.grey[300]),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),

          RamLegendItem(
            color: Colors.grey[700]!,
            label: AppLocalizations.of(context)!.system,
            value: _formatRam(systemRamKb),
          ),
          SizedBox(height: 8.h),
          RamLegendItem(
            color: Colors.lightBlue[200]!,
            label: AppLocalizations.of(context)!.apps,
            value: _formatRam(appsRamKb),
          ),
          SizedBox(height: 8.h),
          RamLegendItem(
            color: Colors.grey[300]!,
            label: AppLocalizations.of(context)!.free,
            value: _formatRam(freeRamKb),
          ),
        ],
      ),
    );
  }
}
