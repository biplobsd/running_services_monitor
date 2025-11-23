import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@lazySingleton
class AppInfoService {
  Map<String, AppInfo>? _cachedApps;
  DateTime? _lastFetchTime;
  static const Duration _cacheValidity = Duration(days: 1);
  static const String _cacheFileName = 'app_cache.json';

  Map<String, AppInfo>? get cachedAppsMap => _cachedApps;

  Future<void> ensureCacheValid() async {
    await _ensureCacheValid();
  }

  Future<File> _getCacheFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$_cacheFileName');
  }

  Future<void> _saveCache(List<AppInfo> apps) async {
    try {
      final file = await _getCacheFile();
      final List<Map<String, dynamic>> jsonList = apps.map((app) {
        return {
          'name': app.name,
          'icon': app.icon != null ? base64Encode(app.icon!) : null,
          'packageName': app.packageName,
          'versionName': app.versionName,
          'versionCode': app.versionCode,
          'installedTimestamp': app.installedTimestamp,
          'isSystemApp': app.isSystemApp,
          'isLaunchableApp': app.isLaunchableApp,
          // 'platformType': app.platformType.index, // Not saving platform type for now as we default it
        };
      }).toList();

      final jsonString = jsonEncode({'timestamp': DateTime.now().toIso8601String(), 'apps': jsonList});

      await file.writeAsString(jsonString);
      debugPrint('AppInfoService: Saved ${apps.length} apps to disk cache');
    } catch (e) {
      debugPrint('AppInfoService: Error saving cache: $e');
    }
  }

  Future<void> _loadCache() async {
    try {
      final file = await _getCacheFile();
      if (await file.exists()) {
        final jsonString = await file.readAsString();
        final Map<String, dynamic> data = jsonDecode(jsonString);

        final timestamp = DateTime.parse(data['timestamp']);
        if (DateTime.now().difference(timestamp) > _cacheValidity) {
          debugPrint('AppInfoService: Disk cache expired');
          return;
        }

        final List<dynamic> appsJson = data['apps'];
        final List<AppInfo> apps = appsJson.map((json) {
          return AppInfo(
            name: json['name'] as String,
            icon: json['icon'] != null ? base64Decode(json['icon'] as String) : null,
            packageName: json['packageName'] as String,
            versionName: json['versionName'] as String,
            versionCode: json['versionCode'] as int,
            installedTimestamp: json['installedTimestamp'] as int,
            isSystemApp: json['isSystemApp'] as bool,
            isLaunchableApp: json['isLaunchableApp'] as bool,
            platformType: PlatformType.nativeOrOthers,
          );
        }).toList();

        _cachedApps = {for (var app in apps) app.packageName: app};
        _lastFetchTime = timestamp;
        debugPrint('AppInfoService: Loaded ${apps.length} apps from disk cache');
      }
    } catch (e) {
      debugPrint('AppInfoService: Error loading cache: $e');
      _cachedApps = null;
    }
  }

  Future<void> _ensureCacheValid() async {
    if (_cachedApps != null && _lastFetchTime != null && DateTime.now().difference(_lastFetchTime!) < _cacheValidity) {
      return;
    }

    if (_cachedApps == null) {
      await _loadCache();
    }

    if (_cachedApps == null || _lastFetchTime == null || DateTime.now().difference(_lastFetchTime!) > _cacheValidity) {
      final token = RootIsolateToken.instance;
      if (token == null) {
        throw Exception('RootIsolateToken is null');
      }

      debugPrint('AppInfoService: Fetching installed apps from system...');
      final appsList = await compute(_fetchInstalledApps, _FetchAppsParams(token: token));

      _cachedApps = {for (var app in appsList) app.packageName: app};
      _lastFetchTime = DateTime.now();
      debugPrint("Has app icons count:  ${appsList.where((app) => app.icon != null).length} of ${appsList.length}");
      debugPrint('AppInfoService: Cache refreshed with ${_cachedApps!.length} apps');

      await _saveCache(appsList);
    }
  }

  Future<List<AppInfo>> getInstalledApps() async {
    await _ensureCacheValid();
    return _cachedApps!.values.toList();
  }

  Future<AppInfo?> getAppInfo(String packageName) async {
    await _ensureCacheValid();

    if (_cachedApps!.containsKey(packageName)) {
      return _cachedApps![packageName];
    }

    try {
      final token = RootIsolateToken.instance;
      if (token == null) {
        throw Exception('RootIsolateToken is null');
      }

      final app = await compute(_fetchAppInfo, _FetchAppInfoParams(token: token, packageName: packageName));
      if (app != null) {
        _cachedApps![app.packageName] = app;
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
