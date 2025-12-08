import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:running_services_monitor/core/constants.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'app_info_service.dart';
import 'shizuku_service.dart';
import 'package:running_services_monitor/utils/format_utils.dart';

@lazySingleton
class ProcessService {
  final ShizukuService _shizukuService;
  final AppInfoService _appInfoService;

  static final _serviceRecordRegex = RegExp(r'([a-z0-9.]+)/\.?([A-Za-z0-9.]+)');
  static final _processRecordRegex = RegExp(r'(\d+):([^/]+)/u(\d+)a(\d+)');
  static final _lruLineRegex = RegExp(r'#\s*\d+:\s*(\S+(?:\s*\+\s*\d+)?)\s+(\S+)\s+\S+\s+(\d+):([^/]+)/u(\d+)a(\d+)');
  static final _ramLineRegex = RegExp(r'^\s*([\d,]+)K:\s+(\S+)\s+\(pid\s+(\d+)');
  static final _connectionRegex = RegExp(r'([a-z0-9.]+)/\.?([A-Za-z0-9.$]+):@([a-f0-9]+)\s+flags=(0x[a-f0-9]+)');

  ProcessService(this._shizukuService, this._appInfoService);

  String _getAppName(String packageName, Map<String, dynamic> appMap) {
    final appInfo = appMap[packageName];
    if (appInfo != null) return appInfo.name;
    final parts = packageName.split('.');
    if (parts.isNotEmpty) {
      String name = parts.last;
      if (name.isNotEmpty) {
        return name[0].toUpperCase() + name.substring(1);
      }
    }
    return packageName;
  }

  Future<ProcessedAppsResult> getAppProcessInfosWithRamInfo() async {
    try {
      final appMap = _appInfoService.cachedAppsMap ?? {};

      Map<int, double> pidRamMap = {};
      Map<String, double> processNameRamMap = {};

      final data = await meminfo();
      Map<String, double> cachedAppsMap = {};
      if (data != null) {
        final ramMaps = _parseRamMaps(data);
        pidRamMap = ramMaps.pidMap;
        processNameRamMap = ramMaps.processNameMap;
        cachedAppsMap = _parseCachedAppsFromMeminfo(data);
      }

      final systemRamInfo = data != null ? _parseSystemRamInfo(data) : null;

      final results = await Future.wait([
        _shizukuService.executeCommand(AppConstants.cmdDumpsysActivityServices),
        _fetchLruProcesses(),
      ]);

      final servicesOutput = results[0] as String?;
      final lruProcesses = results[1] as Map<String, ({String state, String adj, int pid, int uid})>;

      final Map<String, AppProcessInfo> groupedApps = {};

      if (servicesOutput != null && servicesOutput.isNotEmpty) {
        List<String> currentBlock = [];
        String? currentPackage;

        final lines = servicesOutput.split('\n');
        for (final line in lines) {
          final trimmedLine = line.trim();

          if (trimmedLine.isEmpty) {
            if (currentBlock.isNotEmpty && currentPackage != null) {
              _processServiceBlock(
                currentBlock: currentBlock,
                currentPackage: currentPackage,
                groupedApps: groupedApps,
                appMap: appMap,
                pidRamMap: pidRamMap,
                processNameRamMap: processNameRamMap,
              );
              currentBlock.clear();
              currentPackage = null;
            }
          } else if (trimmedLine.contains('* ServiceRecord{')) {
            final serviceMatch = _serviceRecordRegex.firstMatch(trimmedLine);
            if (serviceMatch != null) {
              currentPackage = serviceMatch.group(1);
              currentBlock.add(line);
            }
          } else if (currentPackage != null) {
            currentBlock.add(line);
          }
        }

        if (currentBlock.isNotEmpty && currentPackage != null) {
          _processServiceBlock(
            currentBlock: currentBlock,
            currentPackage: currentPackage,
            groupedApps: groupedApps,
            appMap: appMap,
            pidRamMap: pidRamMap,
            processNameRamMap: processNameRamMap,
          );
        }
      }

      _mergeLruApps(
        groupedApps: groupedApps,
        lruProcesses: lruProcesses,
        appMap: appMap,
        pidRamMap: pidRamMap,
        processNameRamMap: processNameRamMap,
      );

      _mergeCachedApps(groupedApps: groupedApps, cachedAppsMap: cachedAppsMap, appMap: appMap);

      final allApps = groupedApps.values.toList();
      return categorizeApps(allApps, systemRamInfo);
    } catch (e) {
      return ProcessedAppsResult(allApps: [], userApps: [], systemApps: [], appsRam: 0, ramInfo: null);
    }
  }

  void _mergeLruApps({
    required Map<String, AppProcessInfo> groupedApps,
    required Map<String, ({String state, String adj, int pid, int uid})> lruProcesses,
    required Map<String, dynamic> appMap,
    required Map<int, double> pidRamMap,
    required Map<String, double> processNameRamMap,
  }) {
    for (final entry in groupedApps.entries) {
      final packageName = entry.key;
      var app = entry.value;

      if (lruProcesses.containsKey(packageName)) {
        final lruInfo = lruProcesses[packageName]!;
        final isCached = lruInfo.state.startsWith('cch');
        app = app.copyWith(processState: lruInfo.state, adjLevel: lruInfo.adj, isCached: isCached);
        groupedApps[packageName] = app;
      }
    }

    for (final entry in lruProcesses.entries) {
      final packageName = entry.key;
      if (!groupedApps.containsKey(packageName)) {
        final lruInfo = entry.value;
        final processOnlyApp = _createLruAppInfo(
          packageName: packageName,
          lruInfo: lruInfo,
          appMap: appMap,
          pidRamMap: pidRamMap,
          processNameRamMap: processNameRamMap,
        );
        groupedApps[packageName] = processOnlyApp;
      }
    }
  }

  void _mergeCachedApps({
    required Map<String, AppProcessInfo> groupedApps,
    required Map<String, double> cachedAppsMap,
    required Map<String, dynamic> appMap,
  }) {
    for (final entry in groupedApps.entries) {
      final packageName = entry.key;
      var app = entry.value;

      if (cachedAppsMap.containsKey(packageName)) {
        final cachedMemory = cachedAppsMap[packageName]!;
        app = app.copyWith(cachedMemoryKb: cachedMemory, isCached: true);
        groupedApps[packageName] = app;
      }
    }

    for (final entry in cachedAppsMap.entries) {
      final packageName = entry.key;
      if (!groupedApps.containsKey(packageName)) {
        final cachedMemory = entry.value;
        final appName = _getAppName(packageName, appMap);
        final appInfo = appMap[packageName];

        groupedApps[packageName] = AppProcessInfo(
          packageName: packageName,
          appName: appName,
          services: [],
          pids: [],
          totalRam: formatRam(cachedMemory),
          totalRamInKb: cachedMemory,
          isSystemApp: packageName.startsWith('com.android') || packageName.startsWith('android'),
          appInfo: appInfo,
          hasServices: false,
          isCached: true,
          cachedMemoryKb: cachedMemory,
        );
      }
    }
  }

  AppProcessInfo _createLruAppInfo({
    required String packageName,
    required ({String state, String adj, int pid, int uid}) lruInfo,
    required Map<String, dynamic> appMap,
    required Map<int, double> pidRamMap,
    required Map<String, double> processNameRamMap,
  }) {
    final isSystem = lruInfo.uid < 10000;
    final appName = _getAppName(packageName, appMap);
    final appInfo = appMap[packageName];

    double ramKb = 0;
    final List<RamSourceInfo> ramSources = [];
    if (pidRamMap.containsKey(lruInfo.pid)) {
      ramKb = pidRamMap[lruInfo.pid]!;
      ramSources.add(RamSourceInfo(source: 'lru', ramKb: ramKb, pid: lruInfo.pid));
    } else if (processNameRamMap.containsKey(packageName)) {
      ramKb = processNameRamMap[packageName]!;
      ramSources.add(RamSourceInfo(source: 'process_name', ramKb: ramKb, processName: packageName));
    }

    final isCached = lruInfo.state.startsWith('cch');

    return AppProcessInfo(
      packageName: packageName,
      appName: appName,
      services: [],
      pids: [lruInfo.pid],
      totalRam: formatRam(ramKb),
      totalRamInKb: ramKb,
      isSystemApp: isSystem,
      appInfo: appInfo,
      processState: lruInfo.state,
      adjLevel: lruInfo.adj,
      hasServices: false,
      ramSources: ramSources,
      isCached: isCached,
    );
  }

  ProcessedAppsResult categorizeApps(List<AppProcessInfo> allApps, [List<double>? ramInfo]) {
    List<AppProcessInfo> userApps = [];
    List<AppProcessInfo> systemApps = [];
    double appsRam = 0;

    for (var app in allApps) {
      if (app.isSystemApp) {
        systemApps.add(app);
      } else {
        userApps.add(app);
      }
      appsRam += app.totalRamInKb;
    }

    userApps.sort((a, b) => b.totalRamInKb.compareTo(a.totalRamInKb));
    systemApps.sort((a, b) => b.totalRamInKb.compareTo(a.totalRamInKb));

    return ProcessedAppsResult(
      allApps: allApps,
      userApps: userApps,
      systemApps: systemApps,
      appsRam: appsRam,
      ramInfo: ramInfo,
    );
  }

  AppProcessInfo? _processServiceBlock({
    required List<String> currentBlock,
    required String currentPackage,
    required Map<String, AppProcessInfo> groupedApps,
    required Map<String, dynamic> appMap,
    required Map<int, double> pidRamMap,
    required Map<String, double> processNameRamMap,
  }) {
    final services = _parseServiceBlock(currentBlock);

    if (services.isEmpty) return null;

    if (groupedApps.containsKey(currentPackage)) {
      final existingApp = groupedApps[currentPackage]!;
      final mergedServices = [...existingApp.services, ...services];
      final Set<int> mergedPids = {...existingApp.pids, ...services.where((s) => s.pid != null).map((s) => s.pid!)};

      double totalRamKb = 0;
      final Set<int> countedPids = {};
      for (var s in mergedServices) {
        if (s.pid != null && !countedPids.contains(s.pid)) {
          countedPids.add(s.pid!);
          if (pidRamMap.containsKey(s.pid)) {
            totalRamKb += pidRamMap[s.pid]!;
          } else if (s.ramInKb != null) {
            totalRamKb += s.ramInKb!;
          }
        }
      }
      if (totalRamKb <= 0 && processNameRamMap.containsKey(currentPackage)) {
        totalRamKb = processNameRamMap[currentPackage]!;
      }

      final enrichedServices = <RunningServiceInfo>[];
      for (var s in mergedServices) {
        var enriched = s;
        if (pidRamMap.containsKey(s.pid) && s.ramInKb == null) {
          final ramKb = pidRamMap[s.pid]!;
          enriched = enriched.copyWith(ramInKb: ramKb, ramUsage: formatRam(ramKb));
        }
        if (existingApp.appInfo?.icon != null && s.icon == null) {
          enriched = enriched.copyWith(icon: existingApp.appInfo!.icon);
        }
        enrichedServices.add(enriched);
      }

      final updatedApp = existingApp.copyWith(
        services: enrichedServices,
        pids: mergedPids.toList(),
        totalRam: formatRam(totalRamKb),
        totalRamInKb: totalRamKb,
      );
      groupedApps[currentPackage] = updatedApp;
      return updatedApp;
    } else {
      final appProcessInfo = _createAppProcessInfo(
        packageName: currentPackage,
        services: services,
        appMap: appMap,
        pidRamMap: pidRamMap,
        processNameRamMap: processNameRamMap,
      );
      groupedApps[currentPackage] = appProcessInfo;
      return appProcessInfo;
    }
  }

  ({Stream<AppProcessInfo> apps, Future<List<double>?> systemRamInfo}) streamAppProcessInfosWithRamInfo() {
    final meminfoCompleter = Completer<String?>();

    Stream<AppProcessInfo> appStream() async* {
      final appMap = _appInfoService.cachedAppsMap ?? {};

      Map<int, double> pidRamMap = {};
      Map<String, double> processNameRamMap = {};

      final data = await meminfo();
      meminfoCompleter.complete(data);
      Map<String, double> cachedAppsMap = {};
      if (data != null) {
        final ramMaps = _parseRamMaps(data);
        pidRamMap = ramMaps.pidMap;
        processNameRamMap = ramMaps.processNameMap;
        cachedAppsMap = _parseCachedAppsFromMeminfo(data);
      }

      final lruProcessesFuture = _fetchLruProcesses();

      final Map<String, AppProcessInfo> groupedApps = {};

      List<String> currentBlock = [];
      String? currentPackage;

      await for (final line in _shizukuService.executeCommandStream(AppConstants.cmdDumpsysActivityServices)) {
        final trimmedLine = line.trim();

        if (trimmedLine.isEmpty) {
          if (currentBlock.isNotEmpty && currentPackage != null) {
            final app = _processServiceBlock(
              currentBlock: currentBlock,
              currentPackage: currentPackage,
              groupedApps: groupedApps,
              appMap: appMap,
              pidRamMap: pidRamMap,
              processNameRamMap: processNameRamMap,
            );
            if (app != null) yield app;
            currentBlock.clear();
            currentPackage = null;
          }
        } else if (trimmedLine.contains('* ServiceRecord{')) {
          final serviceMatch = _serviceRecordRegex.firstMatch(trimmedLine);
          if (serviceMatch != null) {
            currentPackage = serviceMatch.group(1);
            currentBlock.add(line);
          }
        } else if (currentPackage != null) {
          currentBlock.add(line);
        }
      }

      if (currentBlock.isNotEmpty && currentPackage != null) {
        final app = _processServiceBlock(
          currentBlock: currentBlock,
          currentPackage: currentPackage,
          groupedApps: groupedApps,
          appMap: appMap,
          pidRamMap: pidRamMap,
          processNameRamMap: processNameRamMap,
        );
        if (app != null) yield app;
      }

      final lruProcesses = await lruProcessesFuture;

      for (final entry in groupedApps.entries) {
        final packageName = entry.key;
        var app = entry.value;

        if (lruProcesses.containsKey(packageName)) {
          final lruInfo = lruProcesses[packageName]!;
          final isCached = lruInfo.state.startsWith('cch');
          app = app.copyWith(processState: lruInfo.state, adjLevel: lruInfo.adj, isCached: isCached);
          groupedApps[packageName] = app;
          yield app;
        }
      }

      for (final entry in lruProcesses.entries) {
        final packageName = entry.key;
        if (!groupedApps.containsKey(packageName)) {
          final lruInfo = entry.value;
          final processOnlyApp = _createLruAppInfo(
            packageName: packageName,
            lruInfo: lruInfo,
            appMap: appMap,
            pidRamMap: pidRamMap,
            processNameRamMap: processNameRamMap,
          );
          groupedApps[packageName] = processOnlyApp;
          yield processOnlyApp;
        }
      }

      for (final entry in groupedApps.entries) {
        final packageName = entry.key;
        var app = entry.value;

        if (cachedAppsMap.containsKey(packageName)) {
          final cachedMemory = cachedAppsMap[packageName]!;
          app = app.copyWith(cachedMemoryKb: cachedMemory, isCached: true);
          groupedApps[packageName] = app;
          yield app;
        }
      }

      for (final entry in cachedAppsMap.entries) {
        final packageName = entry.key;
        if (!groupedApps.containsKey(packageName)) {
          final cachedMemory = entry.value;
          final appName = _getAppName(packageName, appMap);
          final appInfo = appMap[packageName];

          final cachedApp = AppProcessInfo(
            packageName: packageName,
            appName: appName,
            services: [],
            pids: [],
            totalRam: formatRam(cachedMemory),
            totalRamInKb: cachedMemory,
            isSystemApp: packageName.startsWith('com.android') || packageName.startsWith('android'),
            appInfo: appInfo,
            hasServices: false,
            isCached: true,
            cachedMemoryKb: cachedMemory,
          );
          groupedApps[packageName] = cachedApp;
          yield cachedApp;
        }
      }
    }

    final systemRamFuture = meminfoCompleter.future.then((data) async {
      if (data == null) return null;
      return _parseSystemRamInfo(data);
    });

    return (apps: appStream(), systemRamInfo: systemRamFuture);
  }

  Future<Map<String, ({String state, String adj, int pid, int uid})>> _fetchLruProcesses() async {
    final Map<String, ({String state, String adj, int pid, int uid})> processes = {};

    try {
      final result = await _shizukuService.executeCommand(AppConstants.cmdDumpsysActivityLru);
      if (result == null || result.isEmpty) return processes;

      final lines = result.split('\n');
      for (final line in lines) {
        final parsed = _parseLruLine(line);
        if (parsed != null) {
          processes[parsed.packageName] = (state: parsed.state, adj: parsed.adj, pid: parsed.pid, uid: parsed.uid);
        }
      }
    } catch (_) {}

    return processes;
  }

  ({String packageName, String state, String adj, int pid, int uid})? _parseLruLine(String line) {
    final trimmed = line.trim();
    if (!trimmed.startsWith('#')) return null;

    final match = _lruLineRegex.firstMatch(trimmed);
    if (match == null) return null;

    final state = match.group(1) ?? '';
    final adj = match.group(2) ?? '';
    final pid = int.tryParse(match.group(3) ?? '') ?? 0;
    final processName = match.group(4) ?? '';
    final userId = int.tryParse(match.group(5) ?? '0') ?? 0;
    final appId = int.tryParse(match.group(6) ?? '0') ?? 0;
    final uid = userId * 100000 + 10000 + appId;

    String packageName = processName;
    if (processName.contains(':')) {
      packageName = processName.split(':').first;
    }

    return (packageName: packageName, state: state, adj: adj, pid: pid, uid: uid);
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
    int? recentCallingUid;
    final connections = <ConnectionRecord>[];

    final rawBlock = lines.join('\n');

    for (var line in lines) {
      final trimmedLine = line.trim();

      if (trimmedLine.startsWith('* ConnectionRecord{') || trimmedLine.startsWith('ConnectionRecord{')) {
        final connMatch = _connectionRegex.firstMatch(trimmedLine);
        if (connMatch != null) {
          final connPackageName = connMatch.group(1) ?? '';
          final connServiceName = connMatch.group(2) ?? '';
          final conn = connMatch.group(3);
          final flags = connMatch.group(4);

          final connIsForeground = trimmedLine.contains(' FGS ') || trimmedLine.contains(' FG ');
          final isVisible = trimmedLine.contains(' VIS ');
          final hasCapabilities = trimmedLine.contains(' CAPS ');

          connections.add(
            ConnectionRecord(
              packageName: connPackageName,
              serviceName: connServiceName,
              conn: conn,
              flags: flags,
              isForeground: connIsForeground,
              isVisible: isVisible,
              hasCapabilities: hasCapabilities,
              rawConnectionRecord: trimmedLine,
            ),
          );
        }
        continue;
      }

      if (trimmedLine.startsWith('* ServiceRecord{')) {
        final serviceMatch = _serviceRecordRegex.firstMatch(trimmedLine);
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
      } else if (trimmedLine.startsWith('recentCallingUid=')) {
        recentCallingUid = int.tryParse(trimmedLine.substring('recentCallingUid='.length));
      } else if (trimmedLine.startsWith('app=ProcessRecord{')) {
        final pidMatch = _processRecordRegex.firstMatch(trimmedLine);
        if (pidMatch != null) {
          pid = int.tryParse(pidMatch.group(1) ?? '');
          final userId = int.tryParse(pidMatch.group(3) ?? '0') ?? 0;
          final appId = int.tryParse(pidMatch.group(4) ?? '0') ?? 0;
          uid = userId * 100000 + 10000 + appId;
        }
      }
    }

    if (packageName != null && serviceName != null) {
      final isSystem =
          (uid != null && uid < 10000) ||
          (baseDir != null &&
              (baseDir.startsWith('/system') || baseDir.startsWith('/product') || baseDir.startsWith('/system_ext')));

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
          recentCallingUid: recentCallingUid,
          connections: connections,
        ),
      );
    }

    return services;
  }

  AppProcessInfo _createAppProcessInfo({
    required String packageName,
    required List<RunningServiceInfo> services,
    required Map<String, dynamic> appMap,
    required Map<int, double> pidRamMap,
    required Map<String, double> processNameRamMap,
  }) {
    double totalRamKb = 0;
    final Set<int> pids = {};
    bool isSystem = false;
    final appName = _getAppName(packageName, appMap);
    final List<RamSourceInfo> ramSources = [];
    final appInfo = appMap[packageName];

    final enrichedServices = <RunningServiceInfo>[];
    for (var service in services) {
      if (service.pid != null) {
        final isNewPid = pids.add(service.pid!);
        if (isNewPid && pidRamMap.containsKey(service.pid)) {
          final ramKb = pidRamMap[service.pid]!;
          totalRamKb += ramKb;
          ramSources.add(RamSourceInfo(source: 'pid', ramKb: ramKb, pid: service.pid));
        }
      }
      if (service.isSystemApp) isSystem = true;

      var enrichedService = service;

      if (pidRamMap.containsKey(service.pid)) {
        final ramKb = pidRamMap[service.pid]!;
        enrichedService = enrichedService.copyWith(ramInKb: ramKb, ramUsage: formatRam(ramKb));
      }

      if (appInfo != null && appInfo.icon != null) {
        enrichedService = enrichedService.copyWith(icon: appInfo.icon);
      }

      enrichedService = enrichedService.copyWith(appName: appName);
      enrichedServices.add(enrichedService);
    }

    if (totalRamKb <= 0 && processNameRamMap.containsKey(packageName)) {
      totalRamKb = processNameRamMap[packageName]!;
      ramSources.add(RamSourceInfo(source: 'process_name', ramKb: totalRamKb, processName: packageName));
    }

    return AppProcessInfo(
      packageName: packageName,
      appName: appName,
      services: enrichedServices,
      pids: pids.toList(),
      totalRam: formatRam(totalRamKb),
      totalRamInKb: totalRamKb,
      isSystemApp: isSystem,
      appInfo: appInfo,
      ramSources: ramSources,
    );
  }

  Future<String?> meminfo({void Function(String)? onProgress}) async {
    try {
      final result = await _shizukuService.executeCommand(AppConstants.cmdDumpsysMeminfo);
      if (result != null) {
        onProgress?.call(result);
      }
      return result;
    } catch (e) {
      return null;
    }
  }

  Future<bool> stopServiceByComponent({required String packageName, required String serviceName}) async {
    try {
      final serviceComponent = serviceName.startsWith('.')
          ? '$packageName/$packageName$serviceName'
          : '$packageName/$serviceName';
      final result = await _shizukuService.executeCommand('am stop-service $serviceComponent');
      if (result == null || result.isEmpty || !result.toLowerCase().contains('error')) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
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

  static ({Map<int, double> pidMap, Map<String, double> processNameMap}) _parseRamMaps(String meminfoOutput) {
    final Map<int, double> pidMap = {};
    final Map<String, double> processNameMap = {};
    if (meminfoOutput.isEmpty) return (pidMap: pidMap, processNameMap: processNameMap);

    final lines = meminfoOutput.split('\n');

    for (var line in lines) {
      final match = _ramLineRegex.firstMatch(line);
      if (match != null) {
        final ramStr = match.group(1)?.replaceAll(',', '') ?? '0';
        final processName = match.group(2) ?? '';
        final pidStr = match.group(3) ?? '0';

        final ramKb = double.tryParse(ramStr) ?? 0;
        final pid = int.tryParse(pidStr) ?? 0;

        if (pid > 0 && !pidMap.containsKey(pid)) {
          pidMap[pid] = ramKb;
        }
        if (processName.isNotEmpty) {
          if (!processNameMap.containsKey(processName)) {
            processNameMap[processName] = ramKb;
          }
          if (processName.contains(':')) {
            final basePackageName = processName.split(':').first;
            if (!processNameMap.containsKey(basePackageName)) {
              processNameMap[basePackageName] = ramKb;
            }
          }
        }
      }
    }
    return (pidMap: pidMap, processNameMap: processNameMap);
  }

  static Map<String, double> _parseCachedAppsFromMeminfo(String meminfoOutput) {
    final Map<String, double> cachedApps = {};
    if (meminfoOutput.isEmpty) return cachedApps;

    final lines = meminfoOutput.split('\n');
    bool inPssSection = false;
    bool inCachedSection = false;
    final cachedLineRegex = RegExp(r'^\s*([\d,]+)K:\s+([a-z0-9._:]+)(?:\s+\(pid\s+\d+)?', caseSensitive: false);

    for (var line in lines) {
      final trimmed = line.trim();

      if (trimmed.startsWith('Total PSS by OOM')) {
        inPssSection = true;
        continue;
      }

      if (!inPssSection) continue;

      if (trimmed.startsWith('Total') && !trimmed.startsWith('Total PSS')) {
        break;
      }

      if (trimmed.endsWith('Cached')) {
        inCachedSection = true;
        continue;
      }

      if (inCachedSection) {
        if (trimmed.isEmpty) {
          break;
        }

        if (!trimmed.startsWith(RegExp(r'[\d,]'))) {
          break;
        }

        final match = cachedLineRegex.firstMatch(line);
        if (match != null) {
          final pssStr = match.group(1)?.replaceAll(',', '') ?? '0';
          var processName = match.group(2) ?? '';

          if (processName.contains(':')) {
            processName = processName.split(':').first;
          }

          final pssKb = double.tryParse(pssStr) ?? 0;
          if (processName.isNotEmpty && pssKb > 0) {
            if (!cachedApps.containsKey(processName)) {
              cachedApps[processName] = pssKb;
            } else {
              cachedApps[processName] = cachedApps[processName]! + pssKb;
            }
          }
        }
      }
    }
    return cachedApps;
  }
}
