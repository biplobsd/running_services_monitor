enum ProcessStateFilter { all, active, cached, withServices }

bool isActiveState(String? processState, {bool hasServices = false}) {
  if (processState == null) return hasServices;
  final state = processState.toLowerCase();
  return state == 'fg' ||
      state == 'vis' ||
      state == 'prev' ||
      state == 'prcp' ||
      state == 'svcb' ||
      state == 'home' ||
      state == 'hvy' ||
      state == 'psvc' ||
      state == 'pers' ||
      state.startsWith('prev');
}

bool isCachedState(String? processState) {
  if (processState == null) return false;
  return processState.toLowerCase().startsWith('cch');
}

extension ProcessStateFilterExtension on ProcessStateFilter {
  bool matchesAppState(String? processState, bool hasServices, {bool isCached = false}) {
    switch (this) {
      case ProcessStateFilter.all:
        return true;
      case ProcessStateFilter.active:
        return isActiveState(processState, hasServices: hasServices);
      case ProcessStateFilter.cached:
        return isCachedState(processState) || isCached;
      case ProcessStateFilter.withServices:
        return hasServices;
    }
  }
}
