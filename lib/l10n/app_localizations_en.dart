// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Running Services Monitor';

  @override
  String get enjoyingApp => 'Enjoying the app? Consider buying me a coffee!';

  @override
  String get donate => 'Donate';

  @override
  String get searchApps => 'Search apps...';

  @override
  String get all => 'All';

  @override
  String get user => 'User';

  @override
  String get system => 'System';

  @override
  String get closeSearch => 'Close Search';

  @override
  String get search => 'Search';

  @override
  String get autoUpdate => 'Auto-Update (3s)';

  @override
  String get refresh => 'Refresh';

  @override
  String get toggleTheme => 'Toggle Theme';

  @override
  String get about => 'About';

  @override
  String get loading => 'Loading...';

  @override
  String get developer => 'Developer';

  @override
  String get email => 'Email';

  @override
  String get sourceCode => 'Source Code';

  @override
  String get blogs => 'Blogs';

  @override
  String get buyMeCoffee => 'Buy Me a Coffee';

  @override
  String get madeInBangladesh => 'Made in Bangladesh';

  @override
  String get runningApp => 'Running app';

  @override
  String get stopWarning =>
      'This app can\'t safely be stopped. If you stop it, you may lose some of your current work.';

  @override
  String get activeServices => 'Active Services';

  @override
  String get shizukuRequired => 'Shizuku Required';

  @override
  String get shizukuRequiredMessage =>
      'This app requires Shizuku to access running services information.';

  @override
  String get setupSteps => 'Setup Steps:';

  @override
  String get step1 => 'Install Shizuku app from Play Store or GitHub';

  @override
  String get step2 => 'Open Shizuku and start the service';

  @override
  String get step3 => 'For Android 11+: Use Wireless Debugging';

  @override
  String get step4 => 'For Android 10 and below: Connect to PC via ADB';

  @override
  String get step5 => 'Return to this app and retry';

  @override
  String get quickStart => 'Quick Start (Android 11+)';

  @override
  String get quickStartSteps =>
      '1. Enable Developer Options\n2. Enable Wireless Debugging\n3. Open Shizuku and tap \"Pair\"\n4. Follow on-screen instructions';

  @override
  String get exitApp => 'Exit App';

  @override
  String get retry => 'Retry';

  @override
  String get loadingServices => 'Loading services...';

  @override
  String get deviceMemory => 'Device memory';

  @override
  String get noMatchingApps => 'No matching apps';

  @override
  String get noAppsFound => 'No apps found';

  @override
  String get ofRam => 'of RAM';

  @override
  String get processAnd => 'process and';

  @override
  String get services => 'Services';

  @override
  String get apps => 'Apps';

  @override
  String get used => 'Used';

  @override
  String get free => 'Free';

  @override
  String get stopService => 'Stop Service';

  @override
  String get stopAllServices => 'Stop All Services';

  @override
  String get stopServiceConfirm => 'Stop this service?';

  @override
  String get stopAllServicesConfirm => 'Stop all services for this app?';

  @override
  String get stopServiceWarning =>
      'This will force stop the app. You may lose unsaved data.';

  @override
  String get serviceStopped => 'Service stopped';

  @override
  String get allServicesStopped => 'All services stopped';

  @override
  String get stopServiceError => 'Failed to stop service';

  @override
  String get cancel => 'Cancel';

  @override
  String get stop => 'Stop';

  @override
  String get permissionRequired => 'Permission Required';

  @override
  String get permissionRequiredMessage =>
      'Shizuku permission is required to access running services information.';

  @override
  String get permissionSteps => 'How to Grant Permission:';

  @override
  String get permissionStep1 => 'Open the Shizuku app';

  @override
  String get permissionStep2 => 'Go to \'Authorized Apps\' or \'Permissions\'';

  @override
  String get permissionStep3 =>
      'Find \'Running Services Monitor\' and grant permission';

  @override
  String get permissionNote =>
      'Make sure Shizuku service is running before granting permission.';

  @override
  String get openShizuku => 'Open Shizuku';

  @override
  String get systemAppWarning =>
      '⚠️ WARNING: This is a SYSTEM APP. Stopping it may cause your device to malfunction or become unstable. Only proceed if you know what you\'re doing!';

  @override
  String get runningServicesTitle => 'System Running Services';

  @override
  String get openRunningServicesTooltip =>
      'Open Running Services in Android Settings';

  @override
  String get error => 'Error';

  @override
  String get appInfoNotFound => 'App information not found';

  @override
  String pageNotFound(String location) {
    return 'Page not found: $location';
  }

  @override
  String get package => 'Package';

  @override
  String get service => 'Service';

  @override
  String get process => 'Process';

  @override
  String get pid => 'PID';

  @override
  String get uid => 'UID';

  @override
  String get ramUsage => 'RAM Usage';

  @override
  String get intent => 'Intent';

  @override
  String get foreground => 'Foreground';

  @override
  String get foregroundId => 'Foreground ID';

  @override
  String get startRequested => 'Start Requested';

  @override
  String get createdFromFg => 'Created From FG';

  @override
  String get createTime => 'Create Time';

  @override
  String get lastActivity => 'Last Activity';

  @override
  String get baseDir => 'Base Dir';

  @override
  String get dataDir => 'Data Dir';

  @override
  String get type => 'Type';

  @override
  String get systemApp => 'System App';

  @override
  String get userApp => 'User App';

  @override
  String get rawOutput => 'Raw Output';

  @override
  String get close => 'Close';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get connections => 'Connections';

  @override
  String get flags => 'Flags';

  @override
  String get bound => 'Bound';

  @override
  String get processRecord => 'Process Record';

  @override
  String get visible => 'Visible';

  @override
  String get capabilities => 'Capabilities';

  @override
  String get active => 'Active';

  @override
  String get cached => 'Cached';

  @override
  String get noServicesFound => 'No services found';

  @override
  String get ramCalculation => 'RAM Calculation';

  @override
  String get totalRam => 'Total RAM';

  @override
  String get ramSources => 'Sources';

  @override
  String get noRamDataAvailable =>
      'No RAM data available for this app in the system memory report.';

  @override
  String get ramCalculationExplanation =>
      'RAM is calculated from system memory info. PID = Process ID lookup, Process = Process name lookup, LRU = Recent process list.';

  @override
  String get playCommand => 'Play Command';

  @override
  String get copiedToClipboard => 'Copied to clipboard';

  @override
  String get copy => 'Copy';

  @override
  String get and => 'and';

  @override
  String service_string(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count services',
      one: '1 service',
    );
    return '$_temp0';
  }

  @override
  String process_string(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count processes',
      one: '1 process',
    );
    return '$_temp0';
  }

  @override
  String service_process_string(int serviceCount, int processCount) {
    String _temp0 = intl.Intl.pluralLogic(
      processCount,
      locale: localeName,
      other: '$processCount processes',
      one: '1 process',
    );
    String _temp1 = intl.Intl.pluralLogic(
      serviceCount,
      locale: localeName,
      other: '$serviceCount services',
      one: '1 service',
    );
    return '$_temp0 and $_temp1';
  }

  @override
  String get info => 'Info';

  @override
  String get followSystem => 'System';

  @override
  String get contributors => 'Contributors';

  @override
  String contributionsCount(Object count) {
    return '$count contributions';
  }

  @override
  String get checkingPermissions => 'Checking permissions...';

  @override
  String get shizukuNotRunning =>
      'Shizuku is not running. Please start Shizuku app.';

  @override
  String get permissionDeniedShizuku =>
      'Permission denied. Please grant Shizuku permission.';

  @override
  String get failedToInitialize =>
      'Failed to initialize. Please grant permission.';

  @override
  String get errorInitializingShizuku => 'Error initializing Shizuku';

  @override
  String get loadingApps => 'Loading apps...';

  @override
  String get refreshedSuccessfully => 'Refreshed successfully';

  @override
  String get errorLoadingData => 'Error loading data';

  @override
  String get failedToStopAllServices => 'Failed to stop all services';

  @override
  String failedToStopServiceName(String serviceName) {
    return 'Failed to stop service $serviceName';
  }

  @override
  String errorPrefix(String error) {
    return 'Error: $error';
  }

  @override
  String get language => 'Language';

  @override
  String get openGithubProfile => 'Open GitHub Profile';

  @override
  String get appInfoTooltip => 'App Info';

  @override
  String get ok => 'OK';

  @override
  String get recentCallingUid => 'Recent Calling UID';

  @override
  String get appDetails => 'App Details';

  @override
  String uidLabel(int uid) {
    return 'UID: $uid';
  }

  @override
  String get processStateTitle => 'Process State';

  @override
  String get processStateFg =>
      'Foreground - App is currently in the foreground';

  @override
  String get processStateVis =>
      'Visible - App has a visible activity but not in foreground';

  @override
  String get processStatePrev => 'Previous - Previously used foreground app';

  @override
  String get processStatePrcp =>
      'Perceptible - App is doing something the user is aware of';

  @override
  String get processStateSvcb => 'Service B - App has a bound service';

  @override
  String get processStateHome => 'Home - Home/Launcher app';

  @override
  String get processStateHvy => 'Heavy Weight - Heavy weight app process';

  @override
  String get processStatePsvc =>
      'Persistent Service - App has a persistent service';

  @override
  String get processStatePers => 'Persistent - System persistent process';

  @override
  String get processStateCchEmpty =>
      'Cached Empty - Cached process with no activities';

  @override
  String get processStateCchAct =>
      'Cached Activity - Cached process with activities';

  @override
  String get processStateCchClient =>
      'Cached Client - Cached process as service client';

  @override
  String get processStateCch => 'Cached - Process is cached in memory';

  @override
  String get processStateBfgs =>
      'Bound Foreground Service - Bound to a foreground service';

  @override
  String get processStateRcvr =>
      'Receiver - App is running a broadcast receiver';

  @override
  String get processStateTop => 'Top - App is at the top of the activity stack';

  @override
  String get processStateBtop => 'Bound Top - Bound to a top app';

  @override
  String get processStateImpf =>
      'Important Foreground - Important foreground process';

  @override
  String get processStateImpb =>
      'Important Background - Important background process';

  @override
  String processStateUnknown(String state) {
    return 'Process state: $state';
  }

  @override
  String get workingMode => 'Working Mode';

  @override
  String get rootMode => 'Root';

  @override
  String get shizukuMode => 'Shizuku';

  @override
  String get selectWorkingMode => 'Select Working Mode';

  @override
  String get available => 'Available';

  @override
  String get notAvailable => 'Not Available';

  @override
  String get modeNotAvailable => 'This mode is not available';

  @override
  String get noModeAvailable => 'No permission mode available';

  @override
  String get commandLogs => 'Command Logs';

  @override
  String get commandOutput => 'Command Output';

  @override
  String get noCommandLogs => 'No commands executed yet';

  @override
  String get clearLogs => 'Clear Logs';

  @override
  String get clearLogsConfirm =>
      'Are you sure you want to clear all command logs?';

  @override
  String get executedAt => 'Executed at';

  @override
  String get command => 'Command';

  @override
  String get noOutput => 'No output';

  @override
  String get executeCommand => 'Execute';

  @override
  String get processes => 'Processes';

  @override
  String get processesDescription =>
      'All running processes for this app from memory info.';

  @override
  String get noProcessesFound => 'No processes found';

  @override
  String get usedBreakdown => 'Used Breakdown';

  @override
  String get freeBreakdown => 'Free Breakdown';

  @override
  String get other => 'Other';

  @override
  String get usedPss => 'Used PSS';

  @override
  String get kernel => 'Kernel';

  @override
  String get cachedPss => 'Cached PSS';

  @override
  String get cachedKernel => 'Cached Kernel';

  @override
  String get actualFree => 'Actual Free';

  @override
  String get gpu => 'GPU';

  @override
  String get lostRam => 'Lost RAM';

  @override
  String get zramPhysical => 'ZRAM Physical';

  @override
  String get zramSwapUsed => 'ZRAM Swap Used';

  @override
  String get zramTotalSwap => 'ZRAM Total Swap';

  @override
  String get oomThreshold => 'OOM Threshold';

  @override
  String get restoreLimit => 'Restore Limit';

  @override
  String get zramSection => 'ZRAM';

  @override
  String get memoryThresholds => 'Memory Thresholds';

  @override
  String get boundServiceCannotStop =>
      'This service is bound by another process and cannot be stopped directly. You can stop the entire app instead.';

  @override
  String get memoryInfo => 'Memory Info';

  @override
  String get viewRawOutput => 'View Raw';

  @override
  String get hideRawOutput => 'Hide Raw';

  @override
  String get compareWithOther => 'Compare';

  @override
  String get memoryCategories => 'Memory Categories';

  @override
  String get appSummary => 'App Summary';

  @override
  String get objects => 'Objects';

  @override
  String get memoryComparison => 'Memory Comparison';

  @override
  String get selectAppToCompare => 'Select an app to compare';

  @override
  String get selectApp => 'Select app...';

  @override
  String get totalPss => 'Total PSS';

  @override
  String get totalRss => 'Total RSS';

  @override
  String get javaHeap => 'Java Heap';

  @override
  String get nativeHeap => 'Native Heap';

  @override
  String get code => 'Code';

  @override
  String get graphics => 'Graphics';

  @override
  String get current => 'Current';

  @override
  String get allApps => 'All';

  @override
  String get userApps => 'User';

  @override
  String get systemApps => 'System';

  @override
  String get compareWith => 'Compare with';

  @override
  String get stats => 'Stats';

  @override
  String get statsLiveRamArea => 'Live System RAM';

  @override
  String get statsLiveRamAreaSubtitle => 'Used RAM over time';

  @override
  String get statsRamDistribution => 'System RAM Distribution';

  @override
  String statsRamDistributionTotal(String size) {
    return 'Total: $size';
  }

  @override
  String get statsRamLabel => 'RAM';

  @override
  String get statsZram => 'ZRAM';

  @override
  String get statsUserVsSystemRam => 'User vs System Apps RAM';

  @override
  String get statsAppStateDistribution => 'App State Distribution';

  @override
  String get statsActive => 'Active';

  @override
  String get statsBackground => 'Background';

  @override
  String get statsCached => 'Cached';

  @override
  String statsAppsCount(int count) {
    return '$count Apps';
  }

  @override
  String get statsSystemVsUserAnalysis => 'System vs User Analysis';

  @override
  String get statsAppCount => 'App Count';

  @override
  String get statsTotalRam => 'Total RAM';

  @override
  String get statsPerformance => 'Performance';

  @override
  String get statsRamDistributionScatter => 'RAM Distribution Scatter';

  @override
  String get statsRamDistributionScatterSubtitle => 'Y: RAM, X: App Index';

  @override
  String get statsTopRamConsumers => 'Top RAM Consumers';

  @override
  String get statsServicesVsRamCorrelation => 'Services vs RAM Correlation';

  @override
  String get statsServicesVsRamSubtitle =>
      'Y: RAM, X: Service Count, Bubble: Process Count';

  @override
  String get statsRamHistogram => 'RAM Frequency Histogram';

  @override
  String get statsRamHistogramSubtitle => 'Count of Apps by Memory Size';

  @override
  String get statsMemoryHeatmap => 'Memory Heatmap';

  @override
  String get statsMemoryHeatmapSubtitle => 'All Apps Sorted by RAM Intensity';

  @override
  String get statsTopAppsRelativeImpact => 'Top Apps Relative Impact';

  @override
  String get statsGanttSubtitle => 'Gantt-style Visualization of RAM Share';

  @override
  String get statsStackedAreaChart => 'RAM Breakdown Over Time';

  @override
  String get statsStackedAreaSubtitle => 'User, System, and Kernel RAM';

  @override
  String get statsPolarChart => 'Process State Distribution';

  @override
  String get statsPolarSubtitle => 'Polar view of app states';

  @override
  String get statsTreemap => 'RAM Distribution Treemap';

  @override
  String get statsTreemapSubtitle => 'Proportional RAM usage by app';

  @override
  String get statsFunnelChart => 'RAM Usage Tiers';

  @override
  String get statsFunnelSubtitle => 'Apps grouped by memory size';

  @override
  String get statsWaterfallChart => 'RAM Allocation Waterfall';

  @override
  String get statsWaterfallSubtitle => 'Breakdown from total to components';

  @override
  String get statsGaugeChart => 'RAM Usage Gauge';

  @override
  String get statsGaugeSubtitle => 'Overall system memory utilization';

  @override
  String get statsTiny => 'Tiny';

  @override
  String get statsSmall => 'Small';

  @override
  String get statsMedium => 'Medium';

  @override
  String get statsLarge => 'Large';

  @override
  String get statsHuge => 'Huge';

  @override
  String get statsNoData => 'No data available';

  @override
  String get statsWaitingForData => 'Waiting for data...';

  @override
  String get statsRamDistributionPie => 'System RAM Distribution';

  @override
  String get statsRamDistributionSubtitle => 'Used, Free, and ZRAM';

  @override
  String get statsUsed => 'Used';

  @override
  String get statsFree => 'Free';

  @override
  String get statsUserVsSystemPie => 'User vs System Apps RAM';

  @override
  String get statsUserVsSystemSubtitle => 'Compare user and system app memory';

  @override
  String get statsProcessStateBar => 'App State Distribution';

  @override
  String get statsProcessStateSubtitle => 'Active, Background, and Cached apps';

  @override
  String get statsScatterChart => 'RAM Distribution Scatter';

  @override
  String get statsScatterSubtitle => 'Y: RAM (MB), X: App Index';

  @override
  String get core => 'Core';

  @override
  String get coreAppInfoLimited =>
      'Limited info available for system processes';

  @override
  String get showCoreApps => 'Show Core Apps';

  @override
  String get usefulCommands => 'Useful Commands';

  @override
  String get commands => 'Commands';

  @override
  String get addCommand => 'Add Command';

  @override
  String get placeholders => 'Placeholders';

  @override
  String get commandTitle => 'Title';

  @override
  String get commandDescription => 'Description';

  @override
  String get reExecute => 'Re-execute';

  @override
  String get statsProcessVsRamLine => 'Process vs RAM Correlation';

  @override
  String get statsProcessVsRamLineSubtitle =>
      'Blue: RAM, Dashed: Process Count';

  @override
  String get statsUserVsSystemBar => 'User vs System Comparison';

  @override
  String get statsUserVsSystemBarSubtitle =>
      'App Count, Total RAM, Average RAM';

  @override
  String get statsRamTrendScatter => 'RAM Trend Analysis';

  @override
  String get statsRamTrendScatterSubtitle => 'Services vs RAM with Trend Line';

  @override
  String get statsServicesVsProcesses => 'Services vs Processes';

  @override
  String get statsServicesVsProcessesSubtitle =>
      'Correlation between Service and Process counts';

  @override
  String get statsProcessStateRam => 'RAM by Process State';

  @override
  String get statsProcessStateRamSubtitle =>
      'Average RAM usage per process state';

  @override
  String get myCommands => 'My Commands';

  @override
  String get defaultCommands => 'Default Commands';

  @override
  String get resetDefaults => 'Reset Defaults';
}
