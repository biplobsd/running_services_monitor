import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:running_services_monitor/core/constants.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/models/system_ram_info.dart';
import 'package:running_services_monitor/services/process_parser.dart';
import 'package:running_services_monitor/utils/format_utils.dart';
import 'shizuku_service.dart';

@lazySingleton
class ProcessService {
  final ShizukuService shizukuService;

  ProcessService(this.shizukuService);

  ({Stream<AppProcessInfo> apps, Future<SystemRamInfo?> systemRamInfo}) streamAppProcessInfosWithRamInfo() {
    final meminfoCompleter = Completer<String?>();

    Stream<AppProcessInfo> appStream() async* {
      final data = await meminfo();
      meminfoCompleter.complete(data);

      if (data == null) return;

      final ramMaps = ProcessParser.parseRamMaps(data);
      final pidRamMap = ramMaps.pidMap;
      final processNameRamMap = ramMaps.processNameMap;
      final meminfoResult = ProcessParser.parseAllAppsFromMeminfo(data);
      final meminfoAppsMap = meminfoResult.totals;
      final meminfoProcesses = meminfoResult.processes;

      final lruProcessesFuture = fetchLruProcesses();
      final groupedApps = <String, AppProcessInfo>{};
      final currentBlock = <String>[];
      final rawBuffer = StringBuffer();
      String? currentPackage;

      await for (final line in shizukuService.executeCommandStream(AppConstants.cmdDumpsysActivityServices)) {
        if (line.trim().isEmpty) {
          if (currentBlock.isNotEmpty && currentPackage != null) {
            final app = _processBlock(currentBlock, currentPackage, groupedApps, pidRamMap, processNameRamMap, rawBuffer);
            if (app != null) yield app;
            currentBlock.clear();
            rawBuffer.clear();
            currentPackage = null;
          }
          continue;
        }

        if (line.contains('* ServiceRecord{')) {
          final match = ProcessParser.serviceRecordRegex.firstMatch(line);
          if (match != null) {
            currentPackage = match.group(1);
            currentBlock.add(line);
          }
        } else if (currentPackage != null) {
          currentBlock.add(line);
        }
      }

      if (currentBlock.isNotEmpty && currentPackage != null) {
        final app = _processBlock(currentBlock, currentPackage, groupedApps, pidRamMap, processNameRamMap, rawBuffer);
        if (app != null) yield app;
      }

      final lruProcesses = await lruProcessesFuture;

      for (final entry in groupedApps.entries) {
        final lruInfo = lruProcesses[entry.key];
        if (lruInfo != null) {
          final app = entry.value.copyWith(processState: lruInfo.state, adjLevel: lruInfo.adj);
          groupedApps[entry.key] = app;
          yield app;
        }
      }

      for (final entry in lruProcesses.entries) {
        if (!groupedApps.containsKey(entry.key)) {
          final app = ProcessParser.createLruAppInfo(
            packageName: entry.key,
            lruInfo: entry.value,
            pidRamMap: pidRamMap,
            processNameRamMap: processNameRamMap,
          );
          groupedApps[entry.key] = app;
          yield app;
        }
      }

      for (final entry in meminfoAppsMap.entries) {
        final existingApp = groupedApps[entry.key];
        final processList = meminfoProcesses[entry.key] ?? [];

        if (existingApp != null) {
          final shouldUpdateRam = existingApp.totalRamInKb <= 0 || entry.value > existingApp.totalRamInKb;
          final ramSources = processList
              .map((p) => RamSourceInfo(source: RamSourceType.meminfoPss, ramKb: p.ramKb, processName: p.processName))
              .toList();

          final app = existingApp.copyWith(
            totalRam: shouldUpdateRam ? formatRam(entry.value) : existingApp.totalRam,
            totalRamInKb: shouldUpdateRam ? entry.value : existingApp.totalRamInKb,
            ramSources: [...existingApp.ramSources, ...ramSources],
            processes: processList,
          );
          groupedApps[entry.key] = app;
          yield app;
        }
      }
    }

    return (
      apps: appStream(),
      systemRamInfo: meminfoCompleter.future.then((data) => data != null ? ProcessParser.parseSystemRamInfo(data) : null),
    );
  }

  AppProcessInfo? _processBlock(
    List<String> block,
    String packageName,
    Map<String, AppProcessInfo> groupedApps,
    Map<int, double> pidRamMap,
    Map<String, double> processNameRamMap,
    StringBuffer rawBuffer,
  ) {
    final service = ProcessParser.parseServiceBlock(block, rawBuffer);
    if (service == null) return null;

    final existing = groupedApps[packageName];
    if (existing != null) {
      return _mergeService(existing, service, packageName, groupedApps, pidRamMap, processNameRamMap);
    }

    final app = ProcessParser.createAppProcessInfo(
      packageName: packageName,
      services: [service],
      pidRamMap: pidRamMap,
      processNameRamMap: processNameRamMap,
    );
    groupedApps[packageName] = app;
    return app;
  }

  AppProcessInfo _mergeService(
    AppProcessInfo existing,
    RunningServiceInfo service,
    String packageName,
    Map<String, AppProcessInfo> groupedApps,
    Map<int, double> pidRamMap,
    Map<String, double> processNameRamMap,
  ) {
    final mergedServices = [...existing.services, service];
    final mergedPids = <int>{...existing.pids};
    if (service.pid != null) mergedPids.add(service.pid!);

    var totalRamKb = 0.0;
    final countedPids = <int>{};

    for (final s in mergedServices) {
      final pid = s.pid;
      if (pid != null && countedPids.add(pid)) {
        totalRamKb += pidRamMap[pid] ?? s.ramInKb ?? 0;
      }
    }

    if (totalRamKb <= 0) totalRamKb = processNameRamMap[packageName] ?? 0;

    final enrichedServices = mergedServices.map((s) {
      if (s.ramInKb != null || s.pid == null) return s;
      final ramKb = pidRamMap[s.pid];
      return ramKb != null ? s.copyWith(ramInKb: ramKb, ramUsage: formatRam(ramKb)) : s;
    }).toList();

    final app = existing.copyWith(
      services: enrichedServices,
      pids: mergedPids.toList(),
      totalRam: formatRam(totalRamKb),
      totalRamInKb: totalRamKb,
    );
    groupedApps[packageName] = app;
    return app;
  }

  Future<Map<String, ({String state, String adj, int pid, int uid})>> fetchLruProcesses() async {
    final result = await shizukuService.executeCommand(AppConstants.cmdDumpsysActivityLru);
    if (result == null || result.isEmpty) return const {};

    final processes = <String, ({String state, String adj, int pid, int uid})>{};
    var start = 0;

    while (start < result.length) {
      var end = result.indexOf('\n', start);
      if (end == -1) end = result.length;

      final parsed = ProcessParser.parseLruLine(result.substring(start, end));
      if (parsed != null) {
        processes[parsed.packageName] = (state: parsed.state, adj: parsed.adj, pid: parsed.pid, uid: parsed.uid);
      }
      start = end + 1;
    }

    return processes;
  }

  Future<String?> meminfo({void Function(String)? onProgress}) async {
    final result = await shizukuService.executeCommand(AppConstants.cmdDumpsysMeminfo);
    if (result != null) onProgress?.call(result);
    return result;
  }

  Future<bool> stopServiceByComponent({required String packageName, required String serviceName}) async {
    final component = serviceName.startsWith('.') ? '$packageName/$packageName$serviceName' : '$packageName/$serviceName';
    final result = await shizukuService.executeCommand('am stop-service $component');
    return result == null || result.isEmpty || !result.toLowerCase().contains('error');
  }

  Future<bool> stopServiceByPid(int pid) async {
    final result = await shizukuService.executeCommand('kill -9 $pid');
    if (result == null || result.isEmpty) return true;
    final lower = result.toLowerCase();
    return !lower.contains('error') && !lower.contains('permission denied');
  }

  Future<bool> stopService(String packageName) async {
    final result = await shizukuService.executeCommand('am force-stop $packageName');
    return result == null || result.isEmpty || !result.toLowerCase().contains('error');
  }
}
