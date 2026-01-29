import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:running_services_monitor/services/shizuku_api.g.dart' as api;

@lazySingleton
class AppInfoService {
  final api.ShizukuHostApi shizukuApi = api.ShizukuHostApi();
  Map<String, api.AppInfoData>? cachedApps;
  DateTime? lastFetchTime;
  static const Duration cacheValidity = Duration(minutes: 15);
  Future<void>? initFuture;

  Map<String, api.AppInfoData>? get cachedAppsMap => cachedApps;

  Future<void> ensureCacheValid({String? mode}) async {
    await _ensureCacheValid(mode: mode);
  }

  Future<void> _ensureCacheValid({String? mode}) async {
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

    initFuture = _fetchApps(mode: mode);
    await initFuture;
    initFuture = null;
  }

  Future<void> _fetchApps({String? mode}) async {
    try {
      cachedApps = {};
      await shizukuApi.startAppInfoStream(mode);
      await for (final appInfo in api.appInfoOutput()) {
        try {
          cachedApps![appInfo.packageName] = appInfo;
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

  Future<List<api.AppInfoData>> getInstalledApps({String? mode}) async {
    await _ensureCacheValid(mode: mode);
    return cachedApps!.values.toList();
  }

  Future<api.AppInfoData?> getAppInfo(String packageName, {String? mode}) async {
    await _ensureCacheValid(mode: mode);

    if (cachedApps!.containsKey(packageName)) {
      return cachedApps![packageName];
    }

    try {
      final app = await shizukuApi.getAppInfo(packageName, mode);
      if (app != null) {
        cachedApps![packageName] = app;
        return app;
      }
    } catch (e) {
      debugPrint('Error fetching app info via Shizuku: $e');
    }
    return null;
  }
}
