import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/models/system_ram_info.dart';

({Map<int, double> pidMap, Map<String, double> processNameMap}) computeParseRamMaps(String meminfoOutput) {
  return ProcessParser.parseRamMaps(meminfoOutput);
}

({Map<String, double> totals, Map<String, List<ProcessEntry>> processes}) computeParseMeminfo(String meminfoOutput) {
  return ProcessParser.parseAllAppsFromMeminfo(meminfoOutput);
}

SystemRamInfo computeParseSystemRamInfo(String meminfoOutput) {
  return ProcessParser.parseSystemRamInfo(meminfoOutput);
}

Map<String, ({String state, String adj, int pid, int uid})> computeParseLruProcesses(String lruOutput) {
  return ProcessParser.parseLruProcesses(lruOutput);
}

Map<String, AppProcessInfo> computeEnrichAppsWithRamInfo(Map<String, dynamic> params) {
  final groupedApps = (params['groupedApps'] as Map<String, dynamic>).map((k, v) => MapEntry(k, AppProcessInfo.fromJson(v as Map<String, dynamic>)));
  final pidMap = (params['pidMap'] as Map<String, dynamic>).map((k, v) => MapEntry(int.parse(k), (v as num).toDouble()));
  final processNameMap = (params['processNameMap'] as Map<String, dynamic>).map((k, v) => MapEntry(k, (v as num).toDouble()));
  final totals = (params['totals'] as Map<String, dynamic>).map((k, v) => MapEntry(k, (v as num).toDouble()));
  final processes = (params['processes'] as Map<String, dynamic>).map(
    (k, v) => MapEntry(k, (v as List).map((p) => ProcessEntry.fromJson(p as Map<String, dynamic>)).toList()),
  );

  final updatedApps = <String, AppProcessInfo>{};

  for (final entry in groupedApps.entries) {
    final packageName = entry.key;
    final existingApp = entry.value;
    final meminfoRam = totals[packageName];
    final processList = processes[packageName] ?? [];

    var updatedApp = existingApp;

    final enrichedServices = ProcessParser.enrichServicesWithRam(existingApp.services, pidMap);

    final totalRamKb =
        meminfoRam ??
        ProcessParser.calculateTotalRamKb(services: enrichedServices, packageName: packageName, pidRamMap: pidMap, processNameRamMap: processNameMap);

    final ramSources = processList.map((p) => RamSourceInfo(source: RamSourceType.meminfoPss, ramKb: p.ramKb, processName: p.processName)).toList();

    updatedApp = updatedApp.copyWith(
      services: enrichedServices,
      totalRamInKb: totalRamKb,
      ramSources: [...updatedApp.ramSources, ...ramSources],
      processes: processList.isNotEmpty ? processList : updatedApp.processes,
    );

    updatedApps[packageName] = updatedApp;
  }

  for (final entry in totals.entries) {
    final packageName = entry.key;
    if (updatedApps.containsKey(packageName)) continue;

    final totalRam = entry.value;
    final processList = processes[packageName] ?? [];
    final pids = processList.map((p) => p.pid).whereType<int>().toList();

    final ramSources = processList.map((p) => RamSourceInfo(source: RamSourceType.meminfoPss, ramKb: p.ramKb, processName: p.processName)).toList();

    updatedApps[packageName] = AppProcessInfo(
      packageName: packageName,
      services: const [],
      pids: pids,
      totalRamInKb: totalRam,
      hasServices: false,
      isCoreApp: true,
      ramSources: ramSources,
      processes: processList,
    );
  }

  return updatedApps;
}

class ProcessParser {
  static final serviceRecordRegex = RegExp(r'([a-zA-Z0-9._]+)/\.?([A-Za-z0-9.$]+)');
  static final _processRecordRegex = RegExp(r'(\d+):([^/]+)/u(\d+)a(\d+)');
  static final _lruLineRegex = RegExp(r'#\s*\d+:\s*(\S+(?:\s*\+\s*\d+)?)\s+(\S+)\s+\S+\s+(\d+):([^/]+)/u(\d+)a(\d+)');
  static final _ramLineRegex = RegExp(r'^\s*([\d,]+)K:\s+(\S+)\s+\(pid\s+(\d+)');
  static final _connectionRegex = RegExp(r'([a-zA-Z0-9._]+)/\.?([A-Za-z0-9.$]+):@([a-f0-9]+)\s+flags=(0x[a-f0-9]+)');
  static final _pssLineRegex = RegExp(r'^\s*([\d,]+)K:\s+([a-zA-Z0-9._:]+)(?:\s+\(pid\s+(\d+))?', caseSensitive: false);
  static final _totalRamRegex = RegExp(r'Total RAM:\s+([\d,]+)K\s*(?:\(status\s+(\w+)\))?');
  static final _freeRamRegex = RegExp(r'Free RAM:\s+([\d,]+)K\s*\(\s*([\d,]+)K\s+cached pss\s*\+\s*([\d,]+)K\s+cached kernel\s*\+\s*([\d,]+)K\s+free\)');
  static final _usedRamRegex = RegExp(r'Used RAM:\s+([\d,]+)K\s*\(\s*([\d,]+)K\s+used pss\s*\+\s*([\d,]+)K\s+kernel\)');
  static final _gpuRegex = RegExp(r'GPU:\s+([\d,]+)K');
  static final _lostRamRegex = RegExp(r'Lost RAM:\s+([\d,]+)K');
  static final _zramRegex = RegExp(r'ZRAM:\s+([\d,]+)K\s+physical\s+used\s+for\s+([\d,]+)K\s+in\s+swap\s*\(\s*([\d,]+)K\s+total\s+swap\)');
  static final _tuningRegex = RegExp(r'Tuning:.*oom\s+([\d,]+)K.*restore limit\s+([\d,]+)K');

  static double calculateTotalRamKb({
    required List<RunningServiceInfo> services,
    required String packageName,
    required Map<int, double> pidRamMap,
    required Map<String, double> processNameRamMap,
    Set<int>? excludePids,
  }) {
    var totalRamKb = 0.0;
    final countedPids = <int>{};

    for (final service in services) {
      final pid = service.pid;
      if (pid != null && countedPids.add(pid)) {
        if (excludePids != null && excludePids.contains(pid)) continue;
        totalRamKb += pidRamMap[pid] ?? 0;
      }
    }

    if (totalRamKb <= 0) {
      totalRamKb = processNameRamMap[packageName] ?? 0;
    }

    return totalRamKb;
  }

  static List<RunningServiceInfo> enrichServicesWithRam(List<RunningServiceInfo> services, Map<int, double> pidRamMap) {
    return services.map((s) {
      if (s.ramInKb != null || s.pid == null) return s;
      final ramKb = pidRamMap[s.pid];
      return s.copyWith(ramInKb: ramKb);
    }).toList();
  }

  static double _parseKb(String? value) {
    if (value == null) return 0.0;
    return double.tryParse(value.replaceAll(',', '')) ?? 0.0;
  }

  static ({String packageName, String state, String adj, int pid, int uid})? parseLruLine(String line) {
    if (!line.trimLeft().startsWith('#')) return null;

    final match = _lruLineRegex.firstMatch(line);
    if (match == null) return null;

    final processName = match.group(4) ?? '';
    final colonIdx = processName.indexOf(':');

    return (
      packageName: colonIdx == -1 ? processName : processName.substring(0, colonIdx),
      state: match.group(1) ?? '',
      adj: match.group(2) ?? '',
      pid: int.parse(match.group(3) ?? '0'),
      uid: (int.parse(match.group(5) ?? '0')) * 100000 + 10000 + (int.parse(match.group(6) ?? '0')),
    );
  }

  static RunningServiceInfo? parseServiceBlock(List<String> lines, StringBuffer rawBuffer) {
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
    String? appProcessRecord;
    List<ConnectionRecord>? connections;
    bool hasBound = false;

    for (var i = 0; i < lines.length; i++) {
      final line = lines[i];
      final trimmed = line.trimLeft();

      if (trimmed.isEmpty) continue;

      final firstChar = trimmed[0];

      if (firstChar == '*' || firstChar == 'C') {
        if (trimmed.startsWith('* ConnectionRecord{') || trimmed.startsWith('ConnectionRecord{')) {
          final connMatch = _connectionRegex.firstMatch(trimmed);
          if (connMatch != null) {
            connections ??= [];
            connections.add(
              ConnectionRecord(
                packageName: connMatch.group(1) ?? '',
                serviceName: connMatch.group(2) ?? '',
                conn: connMatch.group(3),
                flags: connMatch.group(4),
                isForeground: trimmed.contains(' FGS ') || trimmed.contains(' FG '),
                isVisible: trimmed.contains(' VIS '),
                hasCapabilities: trimmed.contains(' CAPS '),
                rawConnectionRecord: trimmed,
              ),
            );
          }
          continue;
        }
        if (trimmed.startsWith('* ServiceRecord{')) {
          serviceName = serviceRecordRegex.firstMatch(trimmed)?.group(2);
          continue;
        }
        if (trimmed.startsWith('* IntentBindRecord{')) {
          if (trimmed.contains('hasBound=true')) {
            hasBound = true;
          }
          continue;
        }
      }

      if (firstChar == 'i' && trimmed.startsWith('intent=')) {
        intent = trimmed.substring(7);
      } else if (firstChar == 'p' && trimmed.startsWith('packageName=')) {
        packageName = trimmed.substring(12);
      } else if (firstChar == 'p' && trimmed.startsWith('processName=')) {
        processName = trimmed.substring(12);
      } else if (firstChar == 'b' && trimmed.startsWith('baseDir=')) {
        baseDir = trimmed.substring(8);
      } else if (firstChar == 'd' && trimmed.startsWith('dataDir=')) {
        dataDir = trimmed.substring(8);
      } else if (firstChar == 'i' && trimmed.startsWith('isForeground=')) {
        isForeground = trimmed.length > 13 && trimmed[13] == 't';
      } else if (firstChar == 'f' && trimmed.startsWith('foregroundId=')) {
        foregroundId = int.tryParse(trimmed.substring(13));
      } else if (firstChar == 'c' && trimmed.startsWith('createTime=')) {
        createTime = trimmed.substring(11);
      } else if (firstChar == 'l' && trimmed.startsWith('lastActivity=')) {
        lastActivityTime = trimmed.substring(13);
      } else if (firstChar == 's' && trimmed.startsWith('startRequested=')) {
        startRequested = trimmed.length > 15 && trimmed[15] == 't';
      } else if (firstChar == 'c' && trimmed.startsWith('createdFromFg=')) {
        createdFromFg = trimmed.length > 14 && trimmed[14] == 't';
      } else if (firstChar == 'r' && trimmed.startsWith('recentCallingUid=')) {
        recentCallingUid = int.tryParse(trimmed.substring(17));
      } else if (firstChar == 'a' && trimmed.startsWith('app=ProcessRecord{')) {
        final pidMatch = _processRecordRegex.firstMatch(trimmed);
        if (pidMatch != null) {
          pid = int.tryParse(pidMatch.group(1) ?? '');
          appProcessRecord = pidMatch.group(2);
          uid = (int.tryParse(pidMatch.group(3) ?? '0') ?? 0) * 100000 + 10000 + (int.tryParse(pidMatch.group(4) ?? '0') ?? 0);
        }
      }
    }

    if (packageName == null || serviceName == null) return null;

    for (var line in lines) {
      rawBuffer.write(line);
      rawBuffer.write('\n');
    }

    return RunningServiceInfo(
      user: '0',
      pid: pid,
      processName: processName ?? packageName,
      serviceName: serviceName,
      packageName: packageName,
      isSystemApp:
          !packageName.contains('.') ||
          (uid != null && uid < 10000) ||
          (baseDir != null && (baseDir.startsWith('/system') || baseDir.startsWith('/product') || baseDir.startsWith('/system_ext'))),
      intent: intent,
      baseDir: baseDir,
      dataDir: dataDir,
      isForeground: isForeground,
      foregroundId: foregroundId,
      createTime: createTime,
      lastActivityTime: lastActivityTime,
      startRequested: startRequested,
      createdFromFg: createdFromFg,
      rawServiceRecord: rawBuffer.toString(),
      uid: uid,
      recentCallingUid: recentCallingUid,
      appProcessRecord: appProcessRecord,
      connections: connections ?? const [],
      hasBound: hasBound,
    );
  }

  static SystemRamInfo parseSystemRamInfo(String result) {
    final totalMatch = _totalRamRegex.firstMatch(result);
    final freeMatch = _freeRamRegex.firstMatch(result);
    final usedMatch = _usedRamRegex.firstMatch(result);
    final gpuMatch = _gpuRegex.firstMatch(result);
    final lostMatch = _lostRamRegex.firstMatch(result);
    final zramMatch = _zramRegex.firstMatch(result);
    final tuningMatch = _tuningRegex.firstMatch(result);

    return SystemRamInfo(
      totalRamKb: _parseKb(totalMatch?.group(1)),
      totalRamStatus: totalMatch?.group(2) ?? '',
      freeRamKb: _parseKb(freeMatch?.group(1)),
      cachedPssKb: _parseKb(freeMatch?.group(2)),
      cachedKernelKb: _parseKb(freeMatch?.group(3)),
      actualFreeKb: _parseKb(freeMatch?.group(4)),
      usedRamKb: _parseKb(usedMatch?.group(1)),
      usedPssKb: _parseKb(usedMatch?.group(2)),
      kernelKb: _parseKb(usedMatch?.group(3)),
      gpuKb: _parseKb(gpuMatch?.group(1)),
      lostRamKb: _parseKb(lostMatch?.group(1)),
      zramPhysicalKb: _parseKb(zramMatch?.group(1)),
      zramSwapKb: _parseKb(zramMatch?.group(2)),
      zramTotalSwapKb: _parseKb(zramMatch?.group(3)),
      oomKb: _parseKb(tuningMatch?.group(1)),
      restoreLimitKb: _parseKb(tuningMatch?.group(2)),
    );
  }

  static ({Map<int, double> pidMap, Map<String, double> processNameMap}) parseRamMaps(String meminfoOutput) {
    if (meminfoOutput.isEmpty) return (pidMap: const {}, processNameMap: const {});

    final pssStart = meminfoOutput.indexOf('Total PSS by process:');
    if (pssStart == -1) return (pidMap: const {}, processNameMap: const {});

    final pssEnd = meminfoOutput.indexOf('Total PSS by OOM', pssStart);
    final section = pssEnd != -1 ? meminfoOutput.substring(pssStart, pssEnd) : meminfoOutput.substring(pssStart);

    final pidMap = <int, double>{};
    final processNameMap = <String, double>{};

    var start = section.indexOf('\n') + 1;
    while (start < section.length) {
      var end = section.indexOf('\n', start);
      if (end == -1) end = section.length;

      final line = section.substring(start, end);
      start = end + 1;

      final match = _ramLineRegex.firstMatch(line);
      if (match == null) continue;

      final ramKb = double.tryParse(match.group(1)?.replaceAll(',', '') ?? '0') ?? 0;
      final processName = match.group(2) ?? '';
      final pid = int.tryParse(match.group(3) ?? '0') ?? 0;

      if (pid > 0) pidMap.putIfAbsent(pid, () => ramKb);

      if (processName.isNotEmpty) {
        processNameMap.putIfAbsent(processName, () => ramKb);
        final colonIdx = processName.indexOf(':');
        if (colonIdx != -1) {
          processNameMap.putIfAbsent(processName.substring(0, colonIdx), () => ramKb);
        }
      }
    }

    return (pidMap: pidMap, processNameMap: processNameMap);
  }

  static ({Map<String, double> totals, Map<String, List<ProcessEntry>> processes}) parseAllAppsFromMeminfo(String meminfoOutput) {
    if (meminfoOutput.isEmpty) return (totals: const {}, processes: const {});

    final pssStart = meminfoOutput.indexOf('Total PSS by process:');
    if (pssStart == -1) return (totals: const {}, processes: const {});

    final pssEnd = meminfoOutput.indexOf('Total PSS by OOM', pssStart);
    final section = pssEnd != -1 ? meminfoOutput.substring(pssStart, pssEnd) : meminfoOutput.substring(pssStart);

    final totals = <String, double>{};
    final processes = <String, List<ProcessEntry>>{};

    var start = section.indexOf('\n') + 1;
    while (start < section.length) {
      var end = section.indexOf('\n', start);
      if (end == -1) end = section.length;

      final line = section.substring(start, end);
      start = end + 1;

      final match = _pssLineRegex.firstMatch(line);
      if (match == null) continue;

      final fullProcessName = match.group(2) ?? '';
      // if (!fullProcessName.contains('.')) continue;

      final colonIdx = fullProcessName.indexOf(':');
      final basePackage = colonIdx != -1 ? fullProcessName.substring(0, colonIdx) : fullProcessName;

      final pssKb = double.tryParse(match.group(1)?.replaceAll(',', '') ?? '0') ?? 0;
      final pid = int.tryParse(match.group(3) ?? '');
      if (pssKb > 0) {
        totals.update(basePackage, (v) => v + pssKb, ifAbsent: () => pssKb);
        processes.putIfAbsent(basePackage, () => []).add(ProcessEntry(processName: fullProcessName, ramKb: pssKb, pid: pid));
      }
    }

    return (totals: totals, processes: processes);
  }

  static AppProcessInfo createLruAppInfo({
    required String packageName,
    required ({String state, String adj, int pid, int uid}) lruInfo,
    required Map<int, double> pidRamMap,
    required Map<String, double> processNameRamMap,
  }) {
    final ramFromPid = pidRamMap[lruInfo.pid];
    final ramFromName = processNameRamMap[packageName];

    final ramKb = ramFromPid ?? ramFromName ?? 0.0;
    final ramSource = ramFromPid != null
        ? RamSourceInfo(source: RamSourceType.lru, ramKb: ramKb, pid: lruInfo.pid)
        : ramFromName != null
        ? RamSourceInfo(source: RamSourceType.processName, ramKb: ramKb, processName: packageName)
        : null;

    return AppProcessInfo(
      packageName: packageName,
      isCoreApp: !packageName.contains('.'),
      services: const [],
      pids: [lruInfo.pid],
      totalRamInKb: ramKb,
      processState: lruInfo.state,
      adjLevel: lruInfo.adj,
      hasServices: false,
      ramSources: ramSource != null ? [ramSource] : const [],
    );
  }

  static AppProcessInfo createAppProcessInfo({
    required String packageName,
    required List<RunningServiceInfo> services,
    required Map<int, double> pidRamMap,
    required Map<String, double> processNameRamMap,
  }) {
    final enrichedServices = enrichServicesWithRam(services, pidRamMap);
    final pids = services.map((s) => s.pid).whereType<int>().toSet();
    final isSystemApp = services.isNotEmpty && services.first.isSystemApp;

    final totalRamKb = calculateTotalRamKb(services: enrichedServices, packageName: packageName, pidRamMap: pidRamMap, processNameRamMap: processNameRamMap);

    final ramSources = <RamSourceInfo>[];
    final countedPids = <int>{};
    for (final service in enrichedServices) {
      final pid = service.pid;
      if (pid != null && countedPids.add(pid)) {
        final ramKb = pidRamMap[pid];
        if (ramKb != null) {
          ramSources.add(RamSourceInfo(source: RamSourceType.pid, ramKb: ramKb, pid: pid));
        }
      }
    }
    if (ramSources.isEmpty && totalRamKb > 0) {
      ramSources.add(RamSourceInfo(source: RamSourceType.processName, ramKb: totalRamKb, processName: packageName));
    }

    return AppProcessInfo(
      isCoreApp: isSystemApp && !packageName.contains('.'),
      packageName: packageName,
      services: enrichedServices,
      pids: pids.toList(),
      totalRamInKb: totalRamKb,
      ramSources: ramSources,
    );
  }

  static Map<String, ({String state, String adj, int pid, int uid})> parseLruProcesses(String result) {
    if (result.isEmpty) return const {};

    final processes = <String, ({String state, String adj, int pid, int uid})>{};
    var start = 0;

    while (start < result.length) {
      var end = result.indexOf('\n', start);
      if (end == -1) end = result.length;

      final parsed = parseLruLine(result.substring(start, end));
      if (parsed != null) {
        processes[parsed.packageName] = (state: parsed.state, adj: parsed.adj, pid: parsed.pid, uid: parsed.uid);
      }
      start = end + 1;
    }

    return processes;
  }
}
