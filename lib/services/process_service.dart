import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:running_services_monitor/core/constants.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'app_info_service.dart';
import 'shizuku_service.dart';

@lazySingleton
class ProcessService {
  final ShizukuService _shizukuService;
  final AppInfoService _appInfoService;

  ProcessService(this._shizukuService, this._appInfoService);

  Future<String?> fetchRawServicesData({void Function(String)? onProgress}) async {
    try {
      final buffer = StringBuffer();
      await for (final line in _shizukuService.executeCommandStream(AppConstants.cmdDumpsysActivityServices)) {
        buffer.writeln(line);
        onProgress?.call(line);
      }
      return buffer.toString();
    } catch (e) {

      return null;
    }
  }

  Future<List<AppProcessInfo>> processServiceData({required String services, required String meminfo}) async {
    try {
      if (services.isEmpty) return [];

      await _appInfoService.ensureCacheValid();
      final appMap = _appInfoService.cachedAppsMap ?? {};

      final Map<String, String> appNames = {};
      for (var entry in appMap.entries) {
        appNames[entry.key] = entry.value.name;
      }

      final isolateData = _IsolateData(servicesOutput: services, meminfoOutput: meminfo, appNames: appNames);

      final appProcessInfos = await compute(_processDataInIsolate, isolateData);

      final updatedAppProcessInfos = <AppProcessInfo>[];

      for (var info in appProcessInfos) {
        var updatedInfo = info;

        var appInfo = appMap[info.packageName];

        updatedInfo = updatedInfo.copyWith(appInfo: appInfo);

        final updatedServices = <RunningServiceInfo>[];
        for (var service in info.services) {
          var updatedService = service;

          if (service.packageName == info.packageName && appInfo != null && appInfo.icon != null) {
            updatedService = updatedService.copyWith(icon: appInfo.icon);
          } else {
            final serviceAppInfo = appMap[service.packageName];
            if (serviceAppInfo != null && serviceAppInfo.icon != null) {
              updatedService = updatedService.copyWith(icon: serviceAppInfo.icon);
            }
          }
          updatedServices.add(updatedService);
        }
        updatedInfo = updatedInfo.copyWith(services: updatedServices);
        updatedAppProcessInfos.add(updatedInfo);
      }

      final finalAppProcessInfos = updatedAppProcessInfos;

      return finalAppProcessInfos;
    } catch (e) {

      return [];
    }
  }

  Future<List<AppProcessInfo>> getAppProcessInfos() async {
    final results = await Future.wait([fetchRawServicesData(), meminfo()]);

    final servicesData = results[0];
    final memInfo = results[1];

    if (servicesData == null || memInfo == null) return [];
    return processServiceData(services: servicesData, meminfo: memInfo);
  }

  ({Stream<AppProcessInfo> apps, Future<List<double>?> systemRamInfo}) streamAppProcessInfosWithRamInfo() {
    final meminfoCompleter = Completer<String?>();

    Stream<AppProcessInfo> appStream() async* {
      final appMap = _appInfoService.cachedAppsMap ?? {};

      Map<int, double> ramMap = {};

      final data = await meminfo();
      meminfoCompleter.complete(data);
      if (data != null) {
        ramMap = _parseRamMap(data);
      }

      final Map<String, AppProcessInfo> groupedApps = {};

      List<String> currentBlock = [];
      String? currentPackage;

      await for (final line in _shizukuService.executeCommandStream(AppConstants.cmdDumpsysActivityServices)) {
        final trimmedLine = line.trim();

        if (trimmedLine.isEmpty) {
          if (currentBlock.isNotEmpty && currentPackage != null) {
            final services = _parseServiceBlock(currentBlock);

            if (services.isNotEmpty) {
              if (groupedApps.containsKey(currentPackage)) {
                final existingApp = groupedApps[currentPackage]!;
                final mergedServices = [...existingApp.services, ...services];
                final Set<int> mergedPids = {...existingApp.pids, ...services.map((s) => s.pid)};

                double totalRamKb = 0;
                for (var s in mergedServices) {
                  if (ramMap.containsKey(s.pid)) {
                    totalRamKb += ramMap[s.pid]!;
                  } else if (s.ramInKb != null) {
                    totalRamKb += s.ramInKb!;
                  }
                }

                final enrichedServices = <RunningServiceInfo>[];
                for (var s in mergedServices) {
                  var enriched = s;
                  if (ramMap.containsKey(s.pid) && s.ramInKb == null) {
                    final ramKb = ramMap[s.pid]!;
                    enriched = enriched.copyWith(ramInKb: ramKb, ramUsage: _formatRam(ramKb));
                  }
                  if (existingApp.appInfo?.icon != null && s.icon == null) {
                    enriched = enriched.copyWith(icon: existingApp.appInfo!.icon);
                  }
                  enrichedServices.add(enriched);
                }

                final updatedApp = existingApp.copyWith(
                  services: enrichedServices,
                  pids: mergedPids.toList(),
                  totalRam: _formatRam(totalRamKb),
                  totalRamInKb: totalRamKb,
                );
                groupedApps[currentPackage] = updatedApp;

                yield updatedApp;
              } else {
                final appProcessInfo = _createAppProcessInfo(
                  packageName: currentPackage,
                  services: services,
                  appMap: appMap,
                  ramMap: ramMap,
                );
                groupedApps[currentPackage] = appProcessInfo;

                yield appProcessInfo;
              }
            }

            currentBlock.clear();
            currentPackage = null;
          }
        } else if (trimmedLine.contains('* ServiceRecord{')) {
          final serviceMatch = RegExp(r'([a-z0-9.]+)/\.?([A-Za-z0-9.]+)').firstMatch(trimmedLine);
          if (serviceMatch != null) {
            currentPackage = serviceMatch.group(1);
            currentBlock.add(line);
          }
        } else if (currentPackage != null) {
          currentBlock.add(line);
        }
      }

      if (currentBlock.isNotEmpty && currentPackage != null) {
        final services = _parseServiceBlock(currentBlock);

        if (services.isNotEmpty) {
          if (groupedApps.containsKey(currentPackage)) {
            final existingApp = groupedApps[currentPackage]!;
            final mergedServices = [...existingApp.services, ...services];
            final Set<int> mergedPids = {...existingApp.pids, ...services.map((s) => s.pid)};

            double totalRamKb = 0;
            for (var s in mergedServices) {
              if (ramMap.containsKey(s.pid)) {
                totalRamKb += ramMap[s.pid]!;
              } else if (s.ramInKb != null) {
                totalRamKb += s.ramInKb!;
              }
            }

            final updatedApp = existingApp.copyWith(
              services: mergedServices,
              pids: mergedPids.toList(),
              totalRam: _formatRam(totalRamKb),
              totalRamInKb: totalRamKb,
            );
            groupedApps[currentPackage] = updatedApp;

            yield updatedApp;
          } else {
            final appProcessInfo = _createAppProcessInfo(
              packageName: currentPackage,
              services: services,
              appMap: appMap,
              ramMap: ramMap,
            );

            yield appProcessInfo;
          }
        }
      }
    }

    final systemRamFuture = meminfoCompleter.future.then((data) async {
      if (data == null) return null;
      return _parseSystemRamInfo(data);
    });

    return (apps: appStream(), systemRamInfo: systemRamFuture);
  }

  Stream<AppProcessInfo> streamAppProcessInfos() async* {
    final result = streamAppProcessInfosWithRamInfo();
    yield* result.apps;
  }

  List<RunningServiceInfo> _parseServiceBlock(List<String> lines) {
    final services = <RunningServiceInfo>[];

    String? packageName;
    String? serviceName;
    String? processName;
    int? pid;
    int? uid;
    String? intent;
    String? baseDir;
    String? dataDir;
    bool? isForeground;
    int? foregroundId;
    String? createTime;
    String? lastActivityTime;
    bool? startRequested;
    bool? createdFromFg;

    final rawBlock = lines.join('\n');

    for (var line in lines) {
      final trimmedLine = line.trim();

      if (trimmedLine.startsWith('* ServiceRecord{')) {
        final serviceMatch = RegExp(r'([a-z0-9.]+)/\.?([A-Za-z0-9.]+)').firstMatch(trimmedLine);
        if (serviceMatch != null) {
          serviceName = serviceMatch.group(2);
        }
      } else if (trimmedLine.startsWith('intent=')) {
        intent = trimmedLine.substring('intent='.length);
      } else if (trimmedLine.startsWith('packageName=')) {
        packageName = trimmedLine.substring('packageName='.length);
      } else if (trimmedLine.startsWith('processName=')) {
        processName = trimmedLine.substring('processName='.length);
      } else if (trimmedLine.startsWith('baseDir=')) {
        baseDir = trimmedLine.substring('baseDir='.length);
      } else if (trimmedLine.startsWith('dataDir=')) {
        dataDir = trimmedLine.substring('dataDir='.length);
      } else if (trimmedLine.startsWith('isForeground=')) {
        isForeground = trimmedLine.substring('isForeground='.length) == 'true';
      } else if (trimmedLine.startsWith('foregroundId=')) {
        foregroundId = int.tryParse(trimmedLine.substring('foregroundId='.length));
      } else if (trimmedLine.startsWith('createTime=')) {
        createTime = trimmedLine.substring('createTime='.length);
      } else if (trimmedLine.startsWith('lastActivity=')) {
        lastActivityTime = trimmedLine.substring('lastActivity='.length);
      } else if (trimmedLine.startsWith('startRequested=')) {
        startRequested = trimmedLine.substring('startRequested='.length) == 'true';
      } else if (trimmedLine.startsWith('createdFromFg=')) {
        createdFromFg = trimmedLine.substring('createdFromFg='.length) == 'true';
      } else if (trimmedLine.startsWith('app=ProcessRecord{')) {
        if (trimmedLine == 'app=null') {

          return [];
        }

        final pidMatch = RegExp(r'(\d+):([^/]+)/u(\d+)a(\d+)').firstMatch(trimmedLine);
        if (pidMatch != null) {
          pid = int.tryParse(pidMatch.group(1) ?? '');
          final userId = int.tryParse(pidMatch.group(3) ?? '0') ?? 0;
          final appId = int.tryParse(pidMatch.group(4) ?? '0') ?? 0;
          uid = userId * 100000 + 10000 + appId;
        }
      }
    }

    if (packageName != null && serviceName != null && pid != null) {
      final isSystem =
          (uid != null && uid < 10000) ||
          (baseDir != null &&
              (baseDir.startsWith('/system') || baseDir.startsWith('/product') || baseDir.startsWith('/system_ext'))) ||
          packageName.startsWith('com.android') ||
          packageName.startsWith('android') ||
          packageName.startsWith('com.google.android');



      services.add(
        RunningServiceInfo(
          user: '0',
          pid: pid,
          processName: processName ?? packageName,
          serviceName: serviceName,
          packageName: packageName,
          isSystemApp: isSystem,
          intent: intent,
          baseDir: baseDir,
          dataDir: dataDir,
          isForeground: isForeground,
          foregroundId: foregroundId,
          createTime: createTime,
          lastActivityTime: lastActivityTime,
          startRequested: startRequested,
          createdFromFg: createdFromFg,
          rawServiceRecord: rawBlock,
          uid: uid,
        ),
      );
    } else {

    }

    return services;
  }

  AppProcessInfo _createAppProcessInfo({
    required String packageName,
    required List<RunningServiceInfo> services,
    required Map<String, dynamic> appMap,
    required Map<int, double> ramMap,
  }) {
    double totalRamKb = 0;
    final Set<int> pids = {};
    bool isSystem = false;
    String appName = packageName;

    final appInfo = appMap[packageName];
    if (appInfo != null) {
      appName = appInfo.name;
    } else {
      final parts = packageName.split('.');
      if (parts.isNotEmpty) {
        String name = parts.last;
        if (name.isNotEmpty) {
          name = name[0].toUpperCase() + name.substring(1);
        }
        appName = name;
      }
    }

    final enrichedServices = <RunningServiceInfo>[];
    for (var service in services) {
      pids.add(service.pid);
      if (service.isSystemApp) isSystem = true;

      var enrichedService = service;

      if (ramMap.containsKey(service.pid)) {
        final ramKb = ramMap[service.pid]!;
        totalRamKb += ramKb;
        enrichedService = enrichedService.copyWith(ramInKb: ramKb, ramUsage: _formatRam(ramKb));
      }

      if (appInfo != null && appInfo.icon != null) {
        enrichedService = enrichedService.copyWith(icon: appInfo.icon);
      }

      enrichedService = enrichedService.copyWith(appName: appName);
      enrichedServices.add(enrichedService);
    }

    return AppProcessInfo(
      packageName: packageName,
      appName: appName,
      services: enrichedServices,
      pids: pids.toList(),
      totalRam: _formatRam(totalRamKb),
      totalRamInKb: totalRamKb,
      isSystemApp: isSystem,
      appInfo: appInfo,
    );
  }

  String _formatRam(double kb) {
    if (kb > 1024 * 1024) {
      return '${(kb / (1024 * 1024)).toStringAsFixed(2)} GB';
    } else if (kb > 1024) {
      return '${(kb / 1024).toStringAsFixed(1)} MB';
    }
    return '${kb.toStringAsFixed(0)} KB';
  }

  Future<String?> meminfo({void Function(String)? onProgress}) async {
    try {
      final buffer = StringBuffer();
      await for (final line in _shizukuService.executeCommandStream(AppConstants.cmdDumpsysMeminfo)) {
        buffer.writeln(line);
        onProgress?.call(line);
      }
      return buffer.toString();
    } catch (e) {

      return null;
    }
  }

  Future<({List<double>? ramInfo, String? meminfo})> getSystemRamInfo() async {
    try {
      final result = await meminfo();
      if (result == null) return (meminfo: result, ramInfo: null);

      return (ramInfo: await compute(_parseSystemRamInfo, result), meminfo: result);
    } catch (e) {

      return (ramInfo: null, meminfo: null);
    }
  }

  Future<bool> stopServiceByPid(int pid) async {
    try {
      final result = await _shizukuService.executeCommand('kill -9 $pid');

      if (result == null ||
          result.isEmpty ||
          !result.toLowerCase().contains('error') && !result.toLowerCase().contains('permission denied')) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> stopService(String packageName) async {
    try {

      final result = await _shizukuService.executeCommand('am force-stop $packageName');

      if (result == null || result.isEmpty || !result.toLowerCase().contains('error')) {
        return true;
      } else {

        return false;
      }
    } catch (e) {

      return false;
    }
  }

  static List<double> _parseSystemRamInfo(String result) {
    double totalRam = 0;
    double freeRam = 0;

    final totalMatch = RegExp(r'Total RAM:\s+([\d,]+)K').firstMatch(result);
    if (totalMatch != null) {
      totalRam = double.tryParse(totalMatch.group(1)!.replaceAll(',', '')) ?? 0;
    }

    final freeMatch = RegExp(r'Free RAM:\s+([\d,]+)K').firstMatch(result);
    if (freeMatch != null) {
      freeRam = double.tryParse(freeMatch.group(1)!.replaceAll(',', '')) ?? 0;
    }

    double usedRam = totalRam - freeRam;

    return [totalRam, freeRam, usedRam];
  }

  static Future<List<AppProcessInfo>> _processDataInIsolate(_IsolateData data) async {
    final services = _parseServices(data.servicesOutput);
    if (services.isEmpty) return [];

    final ramMap = _parseRamMap(data.meminfoOutput);

    final Map<String, List<RunningServiceInfo>> grouped = {};

    String formatRam(double kb) {
      if (kb > 1024 * 1024) {
        return '${(kb / (1024 * 1024)).toStringAsFixed(2)} GB';
      } else if (kb > 1024) {
        return '${(kb / 1024).toStringAsFixed(1)} MB';
      }
      return '${kb.toStringAsFixed(0)} KB';
    }

    final enrichedServices = services.map((service) {
      var updatedService = service;

      if (ramMap.containsKey(service.pid)) {
        final ramKb = ramMap[service.pid]!;
        updatedService = updatedService.copyWith(ramInKb: ramKb, ramUsage: formatRam(ramKb));
      }

      final cachedAppName = data.appNames[service.packageName];
      if (cachedAppName != null) {
        updatedService = updatedService.copyWith(appName: cachedAppName);
      } else {
        final parts = service.packageName.split('.');
        if (parts.isNotEmpty) {
          String name = parts.last;
          if (name.isNotEmpty) {
            name = name[0].toUpperCase() + name.substring(1);
          }
          updatedService = updatedService.copyWith(appName: name);
        } else {
          updatedService = updatedService.copyWith(appName: service.packageName);
        }
      }
      return updatedService;
    }).toList();

    for (var service in enrichedServices) {
      if (!grouped.containsKey(service.packageName)) {
        grouped[service.packageName] = [];
      }
      grouped[service.packageName]!.add(service);
    }

    final List<AppProcessInfo> appProcessInfos = [];

    grouped.forEach((packageName, serviceList) {
      double totalRamKb = 0;
      final Set<int> pids = {};
      String appName = packageName;
      bool isSystem = false;

      final cachedAppName = data.appNames[packageName];
      if (cachedAppName != null) {
        appName = cachedAppName;
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
          appInfo: null,
        ),
      );
    });

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
        final pidMatch = RegExp(r'(\d+):([^/]+)/u(\d+)a(\d+)').firstMatch(line);
        if (pidMatch != null) {
          currentPid = int.tryParse(pidMatch.group(1) ?? '');
          currentProcess = pidMatch.group(2);
          final userId = int.tryParse(pidMatch.group(3) ?? '0') ?? 0;
          final appId = int.tryParse(pidMatch.group(4) ?? '0') ?? 0;
          currentUid = userId * 100000 + 10000 + appId;
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
  final Map<String, String> appNames;

  _IsolateData({required this.servicesOutput, required this.meminfoOutput, required this.appNames});
}
