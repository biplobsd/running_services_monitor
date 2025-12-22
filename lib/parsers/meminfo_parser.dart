import 'package:running_services_monitor/models/meminfo_data.dart';

class MemInfoParser {
  static final _pidRegex = RegExp(r'pid\s+(\d+)');
  static final _summaryRegex = RegExp(r'^\s*([A-Za-z\s]+):\s*(\d+)\s*(\d+)?');
  static final _totalSummaryRegex = RegExp(r'TOTAL\s+PSS:\s*(\d+).*?TOTAL\s+RSS:\s*(\d+).*?SWAP\s+PSS:\s*(\d+)', caseSensitive: false);
  static final _objectsRegex = RegExp(r'(\w+[\w\s]*):\s*(\d+)');
  static final _allocationRegex = RegExp(r'(\d+)\s+(\d+)');
  static final _categoryRegex = RegExp(r'^\s*([\w\s\.]+?)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)(?:\s+(\d+)\s+(\d+)\s+(\d+))?');

  static MemInfoData parse(String packageName, String output) {
    final lines = output.split('\n');
    final categories = <MemInfoCategory>[];
    MemInfoTotal? total;
    AppSummary? appSummary;
    ObjectsInfo? objects;
    NativeAllocations? nativeAllocations;
    int pid = 0;

    final pidMatch = _pidRegex.firstMatch(output);
    if (pidMatch != null) {
      pid = int.tryParse(pidMatch.group(1) ?? '0') ?? 0;
    }

    bool inAppSummary = false;
    bool inObjects = false;
    bool inNativeAllocations = false;

    int javaHeapPss = 0, javaHeapRss = 0;
    int nativeHeapPss = 0, nativeHeapRss = 0;
    int codePss = 0, codeRss = 0;
    int stackPss = 0, stackRss = 0;
    int graphicsPss = 0, graphicsRss = 0;
    int privateOther = 0, system = 0, unknownRss = 0;
    int totalPss = 0, totalRss = 0, totalSwapPss = 0;

    int views = 0, viewRootImpl = 0, appContexts = 0, activities = 0;
    int assets = 0, assetManagers = 0, localBinders = 0, proxyBinders = 0;
    int parcelMemory = 0, parcelCount = 0, deathRecipients = 0, webViews = 0;

    int bitmapCount = 0, bitmapTotalKb = 0;
    int otherMallocedCount = 0, otherMallocedKb = 0;
    int otherNonMallocedCount = 0, otherNonMallocedKb = 0;

    for (final line in lines) {
      final trimmed = line.trim();

      if (trimmed.startsWith('App Summary')) {
        inAppSummary = true;
        inObjects = false;
        inNativeAllocations = false;
        continue;
      }
      if (trimmed.startsWith('Objects')) {
        inAppSummary = false;
        inObjects = true;
        inNativeAllocations = false;
        continue;
      }
      if (trimmed.startsWith('Native Allocations')) {
        inAppSummary = false;
        inObjects = false;
        inNativeAllocations = true;
        continue;
      }
      if (trimmed.startsWith('SQL') || trimmed.startsWith('Asset Allocations')) {
        inAppSummary = false;
        inObjects = false;
        inNativeAllocations = false;
        continue;
      }

      if (inAppSummary) {
        final summaryMatch = _summaryRegex.firstMatch(line);
        if (summaryMatch != null) {
          final label = summaryMatch.group(1)?.trim() ?? '';
          final val1 = int.tryParse(summaryMatch.group(2) ?? '0') ?? 0;
          final val2 = int.tryParse(summaryMatch.group(3) ?? '0') ?? 0;

          if (label.contains('Java Heap')) {
            javaHeapPss = val1;
            javaHeapRss = val2;
          } else if (label.contains('Native Heap')) {
            nativeHeapPss = val1;
            nativeHeapRss = val2;
          } else if (label == 'Code') {
            codePss = val1;
            codeRss = val2;
          } else if (label == 'Stack') {
            stackPss = val1;
            stackRss = val2;
          } else if (label.contains('Graphics')) {
            graphicsPss = val1;
            graphicsRss = val2;
          } else if (label.contains('Private Other')) {
            privateOther = val1;
          } else if (label == 'System') {
            system = val1;
          } else if (label == 'Unknown') {
            unknownRss = val2 > 0 ? val2 : val1;
          }
        }
        final totalMatch = _totalSummaryRegex.firstMatch(line);
        if (totalMatch != null) {
          totalPss = int.tryParse(totalMatch.group(1) ?? '0') ?? 0;
          totalRss = int.tryParse(totalMatch.group(2) ?? '0') ?? 0;
          totalSwapPss = int.tryParse(totalMatch.group(3) ?? '0') ?? 0;
        }
        continue;
      }

      if (inObjects) {
        final objectsMatch = _objectsRegex.allMatches(line);
        for (final match in objectsMatch) {
          final label = match.group(1)?.trim() ?? '';
          final val = int.tryParse(match.group(2) ?? '0') ?? 0;

          if (label == 'Views') {
            views = val;
          } else if (label == 'ViewRootImpl') {
            viewRootImpl = val;
          } else if (label == 'AppContexts') {
            appContexts = val;
          } else if (label == 'Activities') {
            activities = val;
          } else if (label == 'Assets') {
            assets = val;
          } else if (label == 'AssetManagers') {
            assetManagers = val;
          } else if (label.contains('Local Binders')) {
            localBinders = val;
          } else if (label.contains('Proxy Binders')) {
            proxyBinders = val;
          } else if (label.contains('Parcel memory')) {
            parcelMemory = val;
          } else if (label.contains('Parcel count')) {
            parcelCount = val;
          } else if (label.contains('Death Recipients')) {
            deathRecipients = val;
          } else if (label == 'WebViews') {
            webViews = val;
          }
        }
        continue;
      }

      if (inNativeAllocations) {
        if (trimmed.contains('Bitmap') && trimmed.contains('malloced')) {
          final allocMatch = _allocationRegex.firstMatch(trimmed);
          if (allocMatch != null) {
            bitmapCount = int.tryParse(allocMatch.group(1) ?? '0') ?? 0;
            bitmapTotalKb = int.tryParse(allocMatch.group(2) ?? '0') ?? 0;
          }
        } else if (trimmed.contains('Other') && trimmed.contains('malloced') && !trimmed.contains('non')) {
          final allocMatch = _allocationRegex.firstMatch(trimmed);
          if (allocMatch != null) {
            otherMallocedCount = int.tryParse(allocMatch.group(1) ?? '0') ?? 0;
            otherMallocedKb = int.tryParse(allocMatch.group(2) ?? '0') ?? 0;
          }
        } else if (trimmed.contains('nonmalloced')) {
          final allocMatch = _allocationRegex.firstMatch(trimmed);
          if (allocMatch != null) {
            otherNonMallocedCount = int.tryParse(allocMatch.group(1) ?? '0') ?? 0;
            otherNonMallocedKb = int.tryParse(allocMatch.group(2) ?? '0') ?? 0;
          }
        }
        continue;
      }

      final categoryMatch = _categoryRegex.firstMatch(line);

      if (categoryMatch != null) {
        final name = categoryMatch.group(1)?.trim() ?? '';
        if (name.isEmpty || name.contains('------') || name.contains('Pss')) continue;

        final pssTotal = int.tryParse(categoryMatch.group(2) ?? '0') ?? 0;
        final privateDirty = int.tryParse(categoryMatch.group(3) ?? '0') ?? 0;
        final privateClean = int.tryParse(categoryMatch.group(4) ?? '0') ?? 0;
        final swapPssDirty = int.tryParse(categoryMatch.group(5) ?? '0') ?? 0;
        final rssTotal = int.tryParse(categoryMatch.group(6) ?? '0') ?? 0;
        final heapSize = int.tryParse(categoryMatch.group(7) ?? '');
        final heapAlloc = int.tryParse(categoryMatch.group(8) ?? '');
        final heapFree = int.tryParse(categoryMatch.group(9) ?? '');

        if (name == 'TOTAL') {
          total = MemInfoTotal(
            pssTotal: pssTotal,
            privateDirty: privateDirty,
            privateClean: privateClean,
            swapPssDirty: swapPssDirty,
            rssTotal: rssTotal,
            heapSize: heapSize ?? 0,
            heapAlloc: heapAlloc ?? 0,
            heapFree: heapFree ?? 0,
          );
        } else {
          categories.add(
            MemInfoCategory(
              name: name,
              pssTotal: pssTotal,
              privateDirty: privateDirty,
              privateClean: privateClean,
              swapPssDirty: swapPssDirty,
              rssTotal: rssTotal,
              heapSize: heapSize,
              heapAlloc: heapAlloc,
              heapFree: heapFree,
            ),
          );
        }
      }
    }

    appSummary = AppSummary(
      javaHeapPss: javaHeapPss,
      javaHeapRss: javaHeapRss,
      nativeHeapPss: nativeHeapPss,
      nativeHeapRss: nativeHeapRss,
      codePss: codePss,
      codeRss: codeRss,
      stackPss: stackPss,
      stackRss: stackRss,
      graphicsPss: graphicsPss,
      graphicsRss: graphicsRss,
      privateOther: privateOther,
      system: system,
      unknownRss: unknownRss,
      totalPss: totalPss,
      totalRss: totalRss,
      totalSwapPss: totalSwapPss,
    );

    objects = ObjectsInfo(
      views: views,
      viewRootImpl: viewRootImpl,
      appContexts: appContexts,
      activities: activities,
      assets: assets,
      assetManagers: assetManagers,
      localBinders: localBinders,
      proxyBinders: proxyBinders,
      parcelMemory: parcelMemory,
      parcelCount: parcelCount,
      deathRecipients: deathRecipients,
      webViews: webViews,
    );

    nativeAllocations = NativeAllocations(
      bitmapCount: bitmapCount,
      bitmapTotalKb: bitmapTotalKb,
      otherMallocedCount: otherMallocedCount,
      otherMallocedKb: otherMallocedKb,
      otherNonMallocedCount: otherNonMallocedCount,
      otherNonMallocedKb: otherNonMallocedKb,
    );

    return MemInfoData(
      packageName: packageName,
      rawOutput: output,
      pid: pid,
      categories: categories,
      total: total,
      appSummary: appSummary,
      objects: objects,
      nativeAllocations: nativeAllocations,
    );
  }
}
