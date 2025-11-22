import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

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

      // 1. Get raw data asynchronously on main thread
      final servicesOutput = await _shizukuService.executeCommand('dumpsys activity services');
      if (servicesOutput == null || servicesOutput.isEmpty) return [];

      final meminfoOutput = await _shizukuService.executeCommand('dumpsys meminfo');

      // 2. Prepare data for isolate
      // We pass a simplified map of the cache to avoid passing complex objects if possible,
      // but AppInfo should be transferable. If not, we might need to map it to a simpler DTO.
      // For now, we'll pass the cache directly.
      final isolateData = _IsolateData(
        servicesOutput: servicesOutput,
        meminfoOutput: meminfoOutput ?? '',
        appCache: _appCache,
      );

      // 3. Run heavy processing in background isolate
      final appProcessInfos = await compute(_processDataInIsolate, isolateData);

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

      return await compute(_parseSystemRamInfo, result);
    } catch (e) {
      debugPrint('Error getting system RAM info: $e');
      return [0, 0, 0];
    }
  }

  // --- Static methods for Isolate ---

  static List<double> _parseSystemRamInfo(String result) {
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
  }

  static Future<List<AppProcessInfo>> _processDataInIsolate(_IsolateData data) async {
    // 1. Parse services
    final services = _parseServices(data.servicesOutput);
    if (services.isEmpty) return [];

    // 2. Parse RAM map
    final ramMap = _parseRamMap(data.meminfoOutput);

    // 3. Enrich and Group
    final Map<String, List<RunningServiceInfo>> grouped = {};

    // Helper to format RAM
    String formatRam(double kb) {
      if (kb > 1024 * 1024) {
        return '${(kb / (1024 * 1024)).toStringAsFixed(2)} GB';
      } else if (kb > 1024) {
        return '${(kb / 1024).toStringAsFixed(1)} MB';
      }
      return '${kb.toStringAsFixed(0)} KB';
    }

    // Enrich services
    for (var service in services) {
      // Update RAM
      if (ramMap.containsKey(service.pid)) {
        final ramKb = ramMap[service.pid]!;
        service.ramInKb = ramKb;
        service.ramUsage = formatRam(ramKb);
      }

      // Update App Name from Cache
      final cachedApp = data.appCache[service.packageName];
      if (cachedApp != null) {
        service.appName = cachedApp.name;
      } else {
        // Fallback name generation
        final parts = service.packageName.split('.');
        if (parts.isNotEmpty) {
          String name = parts.last;
          if (name.isNotEmpty) {
            name = name[0].toUpperCase() + name.substring(1);
          }
          service.appName = name;
        } else {
          service.appName = service.packageName;
        }
      }

      // Group
      if (!grouped.containsKey(service.packageName)) {
        grouped[service.packageName] = [];
      }
      grouped[service.packageName]!.add(service);
    }

    // 4. Create AppProcessInfo objects
    final List<AppProcessInfo> appProcessInfos = [];

    grouped.forEach((packageName, serviceList) {
      double totalRamKb = 0;
      final Set<int> pids = {};
      String appName = packageName;
      bool isSystem = false;
      AppInfo? cachedAppInfo = data.appCache[packageName];

      if (cachedAppInfo != null) {
        appName = cachedAppInfo.name;
      } else if (serviceList.isNotEmpty && serviceList.first.appName != null) {
        appName = serviceList.first.appName!;
      }

      for (var service in serviceList) {
        totalRamKb += service.ramInKb ?? 0;
        pids.add(service.pid);
        if (service.isSystemApp) isSystem = true;
      }

      appProcessInfos.add(
        AppProcessInfo(
          packageName: packageName,
          appName: appName,
          services: serviceList,
          pids: pids.toList(),
          totalRam: formatRam(totalRamKb),
          totalRamInKb: totalRamKb,
          isSystemApp: isSystem,
          appInfo: cachedAppInfo,
        ),
      );
    });

    // Sort
    appProcessInfos.sort((a, b) => b.totalRamInKb.compareTo(a.totalRamInKb));

    return appProcessInfos;
  }

  static List<RunningServiceInfo> _parseServices(String dumpsysOutput) {
    final List<RunningServiceInfo> services = [];
    final lines = dumpsysOutput.split('\n');

    String? currentPackage;
    String? currentProcess;
    int? currentPid;
    String? currentService;
    String? currentRamUsage;
    double? currentRamInKb;
    int? currentUid;

    // Helper to format RAM (duplicated here as it's static)
    String formatRam(double kb) {
      if (kb > 1024 * 1024) {
        return '${(kb / (1024 * 1024)).toStringAsFixed(2)} GB';
      } else if (kb > 1024) {
        return '${(kb / 1024).toStringAsFixed(1)} MB';
      }
      return '${kb.toStringAsFixed(0)} KB';
    }

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
            currentRamUsage = formatRam(currentRamInKb);
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
            user: '0',
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

  static Map<int, double> _parseRamMap(String meminfoOutput) {
    final Map<int, double> ramMap = {};
    if (meminfoOutput.isEmpty) return ramMap;

    final lines = meminfoOutput.split('\n');
    final regex = RegExp(r'^\s*([\d,]+)K:\s+(\S+)\s+\(pid\s+(\d+)\)');

    for (var line in lines) {
      final match = regex.firstMatch(line);
      if (match != null) {
        final ramStr = match.group(1)?.replaceAll(',', '') ?? '0';
        final pidStr = match.group(3) ?? '0';

        final ramKb = double.tryParse(ramStr) ?? 0;
        final pid = int.tryParse(pidStr) ?? 0;

        if (pid > 0) {
          ramMap[pid] = ramKb;
        }
      }
    }
    return ramMap;
  }
}

class _IsolateData {
  final String servicesOutput;
  final String meminfoOutput;
  final Map<String, AppInfo> appCache;

  _IsolateData({required this.servicesOutput, required this.meminfoOutput, required this.appCache});
}
