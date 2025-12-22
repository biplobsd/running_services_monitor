import 'package:running_services_monitor/models/app_info_state_model.dart';
import 'package:running_services_monitor/models/process_state_filter.dart';
import 'package:running_services_monitor/models/service_info.dart';

class Helper {
  static List<AppProcessInfo> filterApps(
    List<AppProcessInfo> apps,
    String searchQuery,
    ProcessStateFilter filter,
    Map<String, CachedAppInfo> cachedApps,
  ) {
    return apps.where((app) {
      if (searchQuery.trim().isNotEmpty) {
        final query = searchQuery.trim().toLowerCase();
        final pkg = app.packageName.trim().toLowerCase();
        final cached = cachedApps[app.packageName];
        final name = cached?.appName.trim().toLowerCase() ?? pkg;
        if (!pkg.contains(query) && !name.contains(query)) {
          return false;
        }
      }
      return filter.matchesAppState(app.processState, app.hasServices, isCached: app.isCached);
    }).toList();
  }

  static List<AppProcessInfo> sortApps(List<AppProcessInfo> apps, bool ascending) {
    if (ascending) {
      apps.sort((a, b) => compareApps(b, a));
    } else {
      apps.sort((a, b) => compareApps(a, b));
    }
    return apps;
  }

  static int compareApps(AppProcessInfo a, AppProcessInfo b) {
    final ramCompare = b.totalRamInKb.compareTo(a.totalRamInKb);
    if (ramCompare != 0) return ramCompare;
    final pidsCompare = b.processCount.compareTo(a.processCount);
    if (pidsCompare != 0) return pidsCompare;
    return b.services.length.compareTo(a.services.length);
  }

  static bool? isSystemApp(AppProcessInfo app, Map<String, CachedAppInfo> cachedApps) {
    final cached = cachedApps[app.packageName];
    if (cached != null) {
      return cached.isSystemApp;
    }
    return app.isSystemApp;
  }
}
