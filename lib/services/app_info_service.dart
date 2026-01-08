import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:running_services_monitor/services/shizuku_api.g.dart';

class AppInfoData {
  final String packageName;
  final String name;
  final Uint8List? icon;
  final bool isSystemApp;

  AppInfoData({required this.packageName, required this.name, this.icon, required this.isSystemApp});
}

@lazySingleton
class AppInfoService {
  final ShizukuHostApi shizukuApi = ShizukuHostApi();
  Map<String, AppInfoData>? cachedApps;
  DateTime? lastFetchTime;
  static const Duration cacheValidity = Duration(minutes: 15);
  Future<void>? initFuture;

  Map<String, AppInfoData>? get cachedAppsMap => cachedApps;

  Future<void> ensureCacheValid() async {
    await _ensureCacheValid();
  }

  Future<void> _ensureCacheValid() async {
    final isCacheValid = cachedApps != null && cachedApps!.isNotEmpty && lastFetchTime != null && DateTime.now().difference(lastFetchTime!) <= cacheValidity;

    if (isCacheValid) {
      return;
    }

    if (initFuture != null) {
      await initFuture;
      if (cachedApps != null && cachedApps!.isNotEmpty) {
        return;
      }
    }

    initFuture = _fetchApps();
    await initFuture;
    initFuture = null;
  }

  Future<void> _fetchApps() async {
    try {
      cachedApps = {};
      await shizukuApi.startAppInfoStream();
      await for (final appInfo in appInfoOutput()) {
        try {
          cachedApps![appInfo.packageName] = AppInfoData(
            packageName: appInfo.packageName,
            name: appInfo.appName,
            icon: appInfo.icon,
            isSystemApp: appInfo.isSystemApp,
          );
        } catch (e) {
          debugPrint('Error parsing app info: $e');
        }
      }
      if (cachedApps!.isNotEmpty) {
        lastFetchTime = DateTime.now();
      }
    } catch (e) {
      debugPrint('Error fetching apps via Shizuku stream: $e');
      cachedApps ??= {};
    }
  }

  Future<List<AppInfoData>> getInstalledApps() async {
    await _ensureCacheValid();
    return cachedApps!.values.toList();
  }

  Future<AppInfoData?> getAppInfo(String packageName) async {
    await _ensureCacheValid();

    if (cachedApps!.containsKey(packageName)) {
      return cachedApps![packageName];
    }

    try {
      final app = await shizukuApi.getAppInfo(packageName);
      if (app != null) {
        final appData = AppInfoData(packageName: app.packageName, name: app.appName, icon: app.icon, isSystemApp: app.isSystemApp);
        cachedApps![packageName] = appData;
        return appData;
      }
    } catch (e) {
      debugPrint('Error fetching app info via Shizuku: $e');
    }
    return null;
  }
}
