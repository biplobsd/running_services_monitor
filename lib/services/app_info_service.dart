import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';

import 'package:injectable/injectable.dart';

@lazySingleton
class AppInfoService {
  Map<String, AppInfo>? _cachedApps;
  DateTime? _lastFetchTime;
  static const Duration _cacheValidity = Duration(days: 1);

  Map<String, AppInfo>? get cachedAppsMap => _cachedApps;

  Future<void> ensureCacheValid() async {
    await _ensureCacheValid();
  }

  Future<void> _ensureCacheValid() async {
    if (_cachedApps == null || _lastFetchTime == null || DateTime.now().difference(_lastFetchTime!) > _cacheValidity) {
      final token = RootIsolateToken.instance;
      if (token == null) {
        throw Exception('RootIsolateToken is null');
      }

      // Fetch ALL apps with icons to populate the cache comprehensively
      final appsList = await compute(_fetchInstalledApps, _FetchAppsParams(token: token));

      _cachedApps = {for (var app in appsList) app.packageName: app};
      _lastFetchTime = DateTime.now();
      debugPrint("Has app icons count:  ${appsList.where((app) => app.icon != null).length} of ${appsList.length}");
      debugPrint('AppInfoService: Cache refreshed with ${_cachedApps!.length} apps');
    }
  }

  Future<List<AppInfo>> getInstalledApps() async {
    await _ensureCacheValid();
    return _cachedApps!.values.toList();
  }

  Future<AppInfo?> getAppInfo(String packageName) async {
    await _ensureCacheValid();

    // Try to find in cache
    if (_cachedApps!.containsKey(packageName)) {
      return _cachedApps![packageName];
    }

    // Not found in cache (maybe new app?), fetch directly
    try {
      final token = RootIsolateToken.instance;
      if (token == null) {
        throw Exception('RootIsolateToken is null');
      }

      final app = await compute(_fetchAppInfo, _FetchAppInfoParams(token: token, packageName: packageName));
      if (app != null) {
        _cachedApps![app.packageName] = app; // Update cache
      }
      return app;
    } catch (e) {
      return null;
    }
  }
}

class _FetchAppsParams {
  final RootIsolateToken token;

  _FetchAppsParams({required this.token});
}

class _FetchAppInfoParams {
  final RootIsolateToken token;
  final String packageName;

  _FetchAppInfoParams({required this.token, required this.packageName});
}

Future<List<AppInfo>> _fetchInstalledApps(_FetchAppsParams params) async {
  BackgroundIsolateBinaryMessenger.ensureInitialized(params.token);
  return InstalledApps.getInstalledApps(excludeNonLaunchableApps: false, excludeSystemApps: false, withIcon: true);
}

Future<AppInfo?> _fetchAppInfo(_FetchAppInfoParams params) async {
  BackgroundIsolateBinaryMessenger.ensureInitialized(params.token);
  return InstalledApps.getAppInfo(params.packageName);
}
