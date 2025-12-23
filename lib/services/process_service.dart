import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:running_services_monitor/core/constants.dart';
import 'package:running_services_monitor/models/meminfo_data.dart';
import 'package:running_services_monitor/models/service_info.dart';
import 'package:running_services_monitor/models/system_ram_info.dart';
import 'package:running_services_monitor/parsers/meminfo_parser.dart';
import 'package:running_services_monitor/parsers/process_parser.dart';
import 'shizuku_service.dart';

@lazySingleton
class ProcessService {
  final ShizukuService shizukuService;

  ProcessService(this.shizukuService);

  ({Stream<AppProcessInfo> apps, Future<SystemRamInfo?> systemRamInfo, Future<void> Function(void Function(Map<String, AppProcessInfo>)) onRamInfoReady})
  streamAppProcessInfosWithRamInfo() {
    final meminfoFuture = meminfo();
    final groupedAppsCompleter = Completer<Map<String, AppProcessInfo>>();

    Stream<AppProcessInfo> appStream() async* {
      final lruProcessesFuture = fetchLruProcesses();
      final groupedApps = <String, AppProcessInfo>{};
      final currentBlock = <String>[];
      final rawBuffer = StringBuffer();
      String? currentPackage;
      final emptyPidRamMap = <int, double>{};
      final emptyProcessNameRamMap = <String, double>{};

      await for (final line in shizukuService.executeCommandStream(AppConstants.cmdDumpsysActivityServices)) {
        if (line.trim().isEmpty) {
          if (currentBlock.isNotEmpty && currentPackage != null) {
            final app = _processBlock(currentBlock, currentPackage, groupedApps, emptyPidRamMap, emptyProcessNameRamMap, rawBuffer);
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
        final app = _processBlock(currentBlock, currentPackage, groupedApps, emptyPidRamMap, emptyProcessNameRamMap, rawBuffer);
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
            pidRamMap: emptyPidRamMap,
            processNameRamMap: emptyProcessNameRamMap,
          );
          groupedApps[entry.key] = app;
          yield app;
        }
      }

      groupedAppsCompleter.complete(Map.from(groupedApps));
    }

    Future<void> onRamInfoReady(void Function(Map<String, AppProcessInfo>) callback) async {
      final data = await meminfoFuture;

      if (data == null) return;

      final groupedApps = await groupedAppsCompleter.future;

      final ramMaps = await compute(computeParseRamMaps, data);
      final meminfoResult = await compute(computeParseMeminfo, data);

      final pidRamMap = ramMaps.pidMap;
      final processNameRamMap = ramMaps.processNameMap;
      final meminfoAppsMap = meminfoResult.totals;
      final meminfoProcesses = meminfoResult.processes;

      final updatedApps = <String, AppProcessInfo>{};

      for (final entry in groupedApps.entries) {
        final packageName = entry.key;
        final existingApp = entry.value;
        final meminfoRam = meminfoAppsMap[packageName];
        final processList = meminfoProcesses[packageName] ?? [];

        var updatedApp = existingApp;

        final enrichedServices = ProcessParser.enrichServicesWithRam(existingApp.services, pidRamMap);

        final totalRamKb =
            meminfoRam ??
            ProcessParser.calculateTotalRamKb(services: enrichedServices, packageName: packageName, pidRamMap: pidRamMap, processNameRamMap: processNameRamMap);

        final ramSources = processList.map((p) => RamSourceInfo(source: RamSourceType.meminfoPss, ramKb: p.ramKb, processName: p.processName)).toList();

        updatedApp = updatedApp.copyWith(
          services: enrichedServices,
          totalRamInKb: totalRamKb,
          ramSources: [...updatedApp.ramSources, ...ramSources],
          processes: processList.isNotEmpty ? processList : updatedApp.processes,
        );

        updatedApps[packageName] = updatedApp;
      }

      for (final entry in meminfoAppsMap.entries) {
        final packageName = entry.key;
        if (updatedApps.containsKey(packageName)) continue;

        final totalRam = entry.value;
        final processList = meminfoProcesses[packageName] ?? [];
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

      callback(updatedApps);
    }

    return (
      apps: appStream(),
      systemRamInfo: meminfoFuture.then((data) async {
        if (data == null) return null;
        return await compute(computeParseSystemRamInfo, data);
      }),
      onRamInfoReady: onRamInfoReady,
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

    final app = ProcessParser.createAppProcessInfo(packageName: packageName, services: [service], pidRamMap: pidRamMap, processNameRamMap: processNameRamMap);
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

    final enrichedServices = ProcessParser.enrichServicesWithRam(mergedServices, pidRamMap);
    final totalRamKb = ProcessParser.calculateTotalRamKb(
      services: enrichedServices,
      packageName: packageName,
      pidRamMap: pidRamMap,
      processNameRamMap: processNameRamMap,
    );

    final app = existing.copyWith(services: enrichedServices, pids: mergedPids.toList(), totalRamInKb: totalRamKb);
    groupedApps[packageName] = app;
    return app;
  }

  Future<Map<String, ({String state, String adj, int pid, int uid})>> fetchLruProcesses() async {
    final result = await shizukuService.executeCommand(AppConstants.cmdDumpsysActivityLru);
    if (result == null || result.isEmpty) return const {};

    return await compute(computeParseLruProcesses, result);
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

  Future<MemInfoData> fetchMemInfoData(String packageName) async {
    final output = await shizukuService.executeCommand('dumpsys meminfo $packageName') ?? '';
    return await compute(computeParseMemInfoData, {'packageName': packageName, 'output': output});
  }
}
