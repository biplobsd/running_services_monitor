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
  String get services => 'services';

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
  String get verifyCommand => 'Verify Command';

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
  String get followSystem => 'Follow System';
}
