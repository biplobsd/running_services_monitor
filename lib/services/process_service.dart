import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:appcheck/appcheck.dart' hide AppInfo;
import 'package:installed_apps/installed_apps.dart';
import 'package:installed_apps/app_info.dart';
import '../models/service_info.dart';
import 'shizuku_service.dart';

@lazySingleton
class ProcessService {
  final ShizukuService _shizukuService;

  ProcessService(this._shizukuService);

  // Cache for app info (icon, name, etc.)
  final Map<String, AppInfo> _appCache = {};
  bool _isCacheInitialized = false;

  /// Refresh the app cache
  Future<void> refreshAppCache() async {
    try {
      final apps = await InstalledApps.getInstalledApps(excludeSystemApps: false, withIcon: true);
      _appCache.clear();
      for (var app in apps) {
        _appCache[app.packageName] = app;
      }
      _isCacheInitialized = true;
    } catch (e) {
      debugPrint('Error refreshing app cache: $e');
    }
  }

  /// Get grouped app process info
  Future<List<AppProcessInfo>> getAppProcessInfos() async {
    try {
      // Ensure cache is initialized
      if (!_isCacheInitialized) {
        await refreshAppCache();
      }

      // 1. Get raw services
      final services = await getRunningServices();
      if (services.isEmpty) return [];

      // 2. Enrich with app names using cache
      final enrichedServices = await enrichServicesWithAppNames(services);

      // 3. Group by package name
      final Map<String, List<RunningServiceInfo>> grouped = {};
      for (var service in enrichedServices) {
        if (!grouped.containsKey(service.packageName)) {
          grouped[service.packageName] = [];
        }
        grouped[service.packageName]!.add(service);
      }

      // 4. Create AppProcessInfo objects
      final List<AppProcessInfo> appProcessInfos = [];

      grouped.forEach((packageName, serviceList) {
        // Calculate total RAM
        double totalRamKb = 0;
        final Set<int> pids = {};
        String appName = packageName;
        bool isSystem = false;
        AppInfo? cachedAppInfo = _appCache[packageName];

        if (cachedAppInfo != null) {
          appName = cachedAppInfo.name;
        }

        for (var service in serviceList) {
          totalRamKb += service.ramInKb ?? 0;
          pids.add(service.pid);
          // If we didn't find app name in cache, maybe service has it (from AppCheck fallback)
          if (cachedAppInfo == null && service.appName != null) {
            appName = service.appName!;
          }
          if (service.isSystemApp) isSystem = true;
        }

        // Format RAM string
        String totalRamStr;
        if (totalRamKb > 1024) {
          totalRamStr = '${(totalRamKb / 1024).toStringAsFixed(0)} MB';
        } else {
          totalRamStr = '${totalRamKb.toStringAsFixed(0)} KB';
        }

        appProcessInfos.add(
          AppProcessInfo(
            packageName: packageName,
            appName: appName,
            services: serviceList,
            pids: pids.toList(),
            totalRam: totalRamStr,
            totalRamInKb: totalRamKb,
            isSystemApp: isSystem,
            appInfo: cachedAppInfo,
          ),
        );
      });

      // Sort by RAM usage (descending)
      appProcessInfos.sort((a, b) => b.totalRamInKb.compareTo(a.totalRamInKb));

      return appProcessInfos;
    } catch (e) {
      debugPrint('Error getting app process infos: $e');
      return [];
    }
  }

  /// Get system RAM info (Total, Free, Used)
  /// Returns [Total, Free, Used] in KB
  Future<List<double>> getSystemRamInfo() async {
    try {
      final result = await _shizukuService.executeCommand('dumpsys meminfo');
      if (result == null) return [0, 0, 0];

      double totalRam = 0;
      double freeRam = 0;

      // Parse Total RAM: 11,366,712K
      final totalMatch = RegExp(r'Total RAM:\s+([\d,]+)K').firstMatch(result);
      if (totalMatch != null) {
        totalRam = double.tryParse(totalMatch.group(1)!.replaceAll(',', '')) ?? 0;
      }

      // Parse Free RAM: 7,396,751K
      final freeMatch = RegExp(r'Free RAM:\s+([\d,]+)K').firstMatch(result);
      if (freeMatch != null) {
        freeRam = double.tryParse(freeMatch.group(1)!.replaceAll(',', '')) ?? 0;
      }

      double usedRam = totalRam - freeRam;

      return [totalRam, freeRam, usedRam];
    } catch (e) {
      debugPrint('Error getting system RAM info: $e');
      return [0, 0, 0];
    }
  }

  /// Get all running services
  Future<List<RunningServiceInfo>> getRunningServices() async {
    try {
      final result = await _shizukuService.executeCommand('dumpsys activity services');
      if (result == null || result.isEmpty) return [];
      return _parseServices(result);
    } catch (e) {
      return [];
    }
  }

  /// Parse services from dumpsys output
  List<RunningServiceInfo> _parseServices(String dumpsysOutput) {
    final List<RunningServiceInfo> services = [];
    final lines = dumpsysOutput.split('\n');

    String? currentPackage;
    String? currentProcess;
    int? currentPid;
    String? currentService;
    String? currentRamUsage;
    double? currentRamInKb;
    int? currentUid;

    for (var line in lines) {
      line = line.trim();

      if (line.contains('ServiceRecord{')) {
        final serviceMatch = RegExp(r'([a-z0-9.]+)/\.?([A-Za-z0-9.]+)').firstMatch(line);
        if (serviceMatch != null) {
          currentPackage = serviceMatch.group(1);
          currentService = serviceMatch.group(2);
        }
      } else if (line.contains('app=ProcessRecord{')) {
        final pidMatch = RegExp(r'(\d+):([^/]+)/(\d+)').firstMatch(line);
        if (pidMatch != null) {
          currentPid = int.tryParse(pidMatch.group(1) ?? '');
          currentProcess = pidMatch.group(2);
          currentUid = int.tryParse(pidMatch.group(3) ?? '');
        } else {
          // Fallback for simpler format
          final simplePidMatch = RegExp(r'(\d+):([^/]+)').firstMatch(line);
          if (simplePidMatch != null) {
            currentPid = int.tryParse(simplePidMatch.group(1) ?? '');
            currentProcess = simplePidMatch.group(2);
          }
        }

        final pssMatch = RegExp(r'lastPss=(\d+)').firstMatch(line);
        if (pssMatch != null) {
          final pssKb = int.tryParse(pssMatch.group(1) ?? '');
          if (pssKb != null) {
            currentRamInKb = pssKb.toDouble();
            if (pssKb > 1024) {
              currentRamUsage = '${(pssKb / 1024).toStringAsFixed(1)} MB';
            } else {
              currentRamUsage = '$pssKb KB';
            }
          }
        }
      }

      if (currentPackage != null && currentPid != null && currentService != null) {
        final isSystem =
            (currentUid != null && currentUid < 10000) ||
            currentPackage.startsWith('com.android') ||
            currentPackage.startsWith('android') ||
            currentPackage.startsWith('com.google.android');

        services.add(
          RunningServiceInfo(
            user: '0', // Default user
            pid: currentPid,
            processName: currentProcess ?? currentPackage,
            serviceName: currentService,
            packageName: currentPackage,
            isSystemApp: isSystem,
            ramUsage: currentRamUsage,
            ramInKb: currentRamInKb,
          ),
        );

        currentPackage = null;
        currentProcess = null;
        currentPid = null;
        currentService = null;
        currentRamUsage = null;
        currentRamInKb = null;
        currentUid = null;
      }
    }

    return services;
  }

  /// Enrich service info with app names
  Future<List<RunningServiceInfo>> enrichServicesWithAppNames(List<RunningServiceInfo> services) async {
    // Use cache if available
    if (_isCacheInitialized) {
      for (var service in services) {
        final cachedApp = _appCache[service.packageName];
        if (cachedApp != null) {
          service.appName = cachedApp.name;
        }
      }
      return services;
    }

    // Fallback to AppCheck if cache not ready (shouldn't happen often with new flow)
    try {
      final appCheck = AppCheck();
      final installedApps = await appCheck.getInstalledApps();

      final appNameMap = <String, String>{};
      if (installedApps != null) {
        for (var app in installedApps) {
          appNameMap[app.packageName] = app.appName ?? app.packageName;
        }
      }

      for (var service in services) {
        String? appName = appNameMap[service.packageName];

        if (appName == null) {
          final parts = service.packageName.split('.');
          if (parts.isNotEmpty) {
            appName = parts.last;
            if (appName.isNotEmpty) {
              appName = appName[0].toUpperCase() + appName.substring(1);
            }
          } else {
            appName = service.packageName;
          }
        }

        service.appName = appName;
      }

      return services;
    } catch (e) {
      debugPrint('Error enriching services: $e');
      return services;
    }
  }
}
