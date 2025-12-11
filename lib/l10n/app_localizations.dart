import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bn'),
    Locale('en'),
    Locale('zh'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'Running Services Monitor'**
  String get appTitle;

  /// No description provided for @enjoyingApp.
  ///
  /// In en, this message translates to:
  /// **'Enjoying the app? Consider buying me a coffee!'**
  String get enjoyingApp;

  /// No description provided for @donate.
  ///
  /// In en, this message translates to:
  /// **'Donate'**
  String get donate;

  /// No description provided for @searchApps.
  ///
  /// In en, this message translates to:
  /// **'Search apps...'**
  String get searchApps;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @user.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get user;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @closeSearch.
  ///
  /// In en, this message translates to:
  /// **'Close Search'**
  String get closeSearch;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @autoUpdate.
  ///
  /// In en, this message translates to:
  /// **'Auto-Update (3s)'**
  String get autoUpdate;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @toggleTheme.
  ///
  /// In en, this message translates to:
  /// **'Toggle Theme'**
  String get toggleTheme;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @developer.
  ///
  /// In en, this message translates to:
  /// **'Developer'**
  String get developer;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @sourceCode.
  ///
  /// In en, this message translates to:
  /// **'Source Code'**
  String get sourceCode;

  /// No description provided for @blogs.
  ///
  /// In en, this message translates to:
  /// **'Blogs'**
  String get blogs;

  /// No description provided for @buyMeCoffee.
  ///
  /// In en, this message translates to:
  /// **'Buy Me a Coffee'**
  String get buyMeCoffee;

  /// No description provided for @madeInBangladesh.
  ///
  /// In en, this message translates to:
  /// **'Made in Bangladesh'**
  String get madeInBangladesh;

  /// No description provided for @runningApp.
  ///
  /// In en, this message translates to:
  /// **'Running app'**
  String get runningApp;

  /// No description provided for @stopWarning.
  ///
  /// In en, this message translates to:
  /// **'This app can\'t safely be stopped. If you stop it, you may lose some of your current work.'**
  String get stopWarning;

  /// No description provided for @activeServices.
  ///
  /// In en, this message translates to:
  /// **'Active Services'**
  String get activeServices;

  /// No description provided for @shizukuRequired.
  ///
  /// In en, this message translates to:
  /// **'Shizuku Required'**
  String get shizukuRequired;

  /// No description provided for @shizukuRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'This app requires Shizuku to access running services information.'**
  String get shizukuRequiredMessage;

  /// No description provided for @setupSteps.
  ///
  /// In en, this message translates to:
  /// **'Setup Steps:'**
  String get setupSteps;

  /// No description provided for @step1.
  ///
  /// In en, this message translates to:
  /// **'Install Shizuku app from Play Store or GitHub'**
  String get step1;

  /// No description provided for @step2.
  ///
  /// In en, this message translates to:
  /// **'Open Shizuku and start the service'**
  String get step2;

  /// No description provided for @step3.
  ///
  /// In en, this message translates to:
  /// **'For Android 11+: Use Wireless Debugging'**
  String get step3;

  /// No description provided for @step4.
  ///
  /// In en, this message translates to:
  /// **'For Android 10 and below: Connect to PC via ADB'**
  String get step4;

  /// No description provided for @step5.
  ///
  /// In en, this message translates to:
  /// **'Return to this app and retry'**
  String get step5;

  /// No description provided for @quickStart.
  ///
  /// In en, this message translates to:
  /// **'Quick Start (Android 11+)'**
  String get quickStart;

  /// No description provided for @quickStartSteps.
  ///
  /// In en, this message translates to:
  /// **'1. Enable Developer Options\n2. Enable Wireless Debugging\n3. Open Shizuku and tap \"Pair\"\n4. Follow on-screen instructions'**
  String get quickStartSteps;

  /// No description provided for @exitApp.
  ///
  /// In en, this message translates to:
  /// **'Exit App'**
  String get exitApp;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @loadingServices.
  ///
  /// In en, this message translates to:
  /// **'Loading services...'**
  String get loadingServices;

  /// No description provided for @deviceMemory.
  ///
  /// In en, this message translates to:
  /// **'Device memory'**
  String get deviceMemory;

  /// No description provided for @noMatchingApps.
  ///
  /// In en, this message translates to:
  /// **'No matching apps'**
  String get noMatchingApps;

  /// No description provided for @noAppsFound.
  ///
  /// In en, this message translates to:
  /// **'No apps found'**
  String get noAppsFound;

  /// No description provided for @ofRam.
  ///
  /// In en, this message translates to:
  /// **'of RAM'**
  String get ofRam;

  /// No description provided for @processAnd.
  ///
  /// In en, this message translates to:
  /// **'process and'**
  String get processAnd;

  /// No description provided for @services.
  ///
  /// In en, this message translates to:
  /// **'services'**
  String get services;

  /// No description provided for @apps.
  ///
  /// In en, this message translates to:
  /// **'Apps'**
  String get apps;

  /// No description provided for @used.
  ///
  /// In en, this message translates to:
  /// **'Used'**
  String get used;

  /// No description provided for @free.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get free;

  /// No description provided for @stopService.
  ///
  /// In en, this message translates to:
  /// **'Stop Service'**
  String get stopService;

  /// No description provided for @stopAllServices.
  ///
  /// In en, this message translates to:
  /// **'Stop All Services'**
  String get stopAllServices;

  /// No description provided for @stopServiceConfirm.
  ///
  /// In en, this message translates to:
  /// **'Stop this service?'**
  String get stopServiceConfirm;

  /// No description provided for @stopAllServicesConfirm.
  ///
  /// In en, this message translates to:
  /// **'Stop all services for this app?'**
  String get stopAllServicesConfirm;

  /// No description provided for @stopServiceWarning.
  ///
  /// In en, this message translates to:
  /// **'This will force stop the app. You may lose unsaved data.'**
  String get stopServiceWarning;

  /// No description provided for @serviceStopped.
  ///
  /// In en, this message translates to:
  /// **'Service stopped'**
  String get serviceStopped;

  /// No description provided for @allServicesStopped.
  ///
  /// In en, this message translates to:
  /// **'All services stopped'**
  String get allServicesStopped;

  /// No description provided for @stopServiceError.
  ///
  /// In en, this message translates to:
  /// **'Failed to stop service'**
  String get stopServiceError;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @stop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get stop;

  /// No description provided for @permissionRequired.
  ///
  /// In en, this message translates to:
  /// **'Permission Required'**
  String get permissionRequired;

  /// No description provided for @permissionRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'Shizuku permission is required to access running services information.'**
  String get permissionRequiredMessage;

  /// No description provided for @permissionSteps.
  ///
  /// In en, this message translates to:
  /// **'How to Grant Permission:'**
  String get permissionSteps;

  /// No description provided for @permissionStep1.
  ///
  /// In en, this message translates to:
  /// **'Open the Shizuku app'**
  String get permissionStep1;

  /// No description provided for @permissionStep2.
  ///
  /// In en, this message translates to:
  /// **'Go to \'Authorized Apps\' or \'Permissions\''**
  String get permissionStep2;

  /// No description provided for @permissionStep3.
  ///
  /// In en, this message translates to:
  /// **'Find \'Running Services Monitor\' and grant permission'**
  String get permissionStep3;

  /// No description provided for @permissionNote.
  ///
  /// In en, this message translates to:
  /// **'Make sure Shizuku service is running before granting permission.'**
  String get permissionNote;

  /// No description provided for @openShizuku.
  ///
  /// In en, this message translates to:
  /// **'Open Shizuku'**
  String get openShizuku;

  /// No description provided for @systemAppWarning.
  ///
  /// In en, this message translates to:
  /// **'⚠️ WARNING: This is a SYSTEM APP. Stopping it may cause your device to malfunction or become unstable. Only proceed if you know what you\'re doing!'**
  String get systemAppWarning;

  /// No description provided for @runningServicesTitle.
  ///
  /// In en, this message translates to:
  /// **'System Running Services'**
  String get runningServicesTitle;

  /// No description provided for @openRunningServicesTooltip.
  ///
  /// In en, this message translates to:
  /// **'Open Running Services in Android Settings'**
  String get openRunningServicesTooltip;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @appInfoNotFound.
  ///
  /// In en, this message translates to:
  /// **'App information not found'**
  String get appInfoNotFound;

  /// Error message when a page is not found
  ///
  /// In en, this message translates to:
  /// **'Page not found: {location}'**
  String pageNotFound(String location);

  /// No description provided for @package.
  ///
  /// In en, this message translates to:
  /// **'Package'**
  String get package;

  /// No description provided for @service.
  ///
  /// In en, this message translates to:
  /// **'Service'**
  String get service;

  /// No description provided for @process.
  ///
  /// In en, this message translates to:
  /// **'Process'**
  String get process;

  /// No description provided for @pid.
  ///
  /// In en, this message translates to:
  /// **'PID'**
  String get pid;

  /// No description provided for @uid.
  ///
  /// In en, this message translates to:
  /// **'UID'**
  String get uid;

  /// No description provided for @ramUsage.
  ///
  /// In en, this message translates to:
  /// **'RAM Usage'**
  String get ramUsage;

  /// No description provided for @intent.
  ///
  /// In en, this message translates to:
  /// **'Intent'**
  String get intent;

  /// No description provided for @foreground.
  ///
  /// In en, this message translates to:
  /// **'Foreground'**
  String get foreground;

  /// No description provided for @foregroundId.
  ///
  /// In en, this message translates to:
  /// **'Foreground ID'**
  String get foregroundId;

  /// No description provided for @startRequested.
  ///
  /// In en, this message translates to:
  /// **'Start Requested'**
  String get startRequested;

  /// No description provided for @createdFromFg.
  ///
  /// In en, this message translates to:
  /// **'Created From FG'**
  String get createdFromFg;

  /// No description provided for @createTime.
  ///
  /// In en, this message translates to:
  /// **'Create Time'**
  String get createTime;

  /// No description provided for @lastActivity.
  ///
  /// In en, this message translates to:
  /// **'Last Activity'**
  String get lastActivity;

  /// No description provided for @baseDir.
  ///
  /// In en, this message translates to:
  /// **'Base Dir'**
  String get baseDir;

  /// No description provided for @dataDir.
  ///
  /// In en, this message translates to:
  /// **'Data Dir'**
  String get dataDir;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @systemApp.
  ///
  /// In en, this message translates to:
  /// **'System App'**
  String get systemApp;

  /// No description provided for @userApp.
  ///
  /// In en, this message translates to:
  /// **'User App'**
  String get userApp;

  /// No description provided for @rawOutput.
  ///
  /// In en, this message translates to:
  /// **'Raw Output'**
  String get rawOutput;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @connections.
  ///
  /// In en, this message translates to:
  /// **'Connections'**
  String get connections;

  /// No description provided for @flags.
  ///
  /// In en, this message translates to:
  /// **'Flags'**
  String get flags;

  /// No description provided for @visible.
  ///
  /// In en, this message translates to:
  /// **'Visible'**
  String get visible;

  /// No description provided for @capabilities.
  ///
  /// In en, this message translates to:
  /// **'Capabilities'**
  String get capabilities;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @cached.
  ///
  /// In en, this message translates to:
  /// **'Cached'**
  String get cached;

  /// No description provided for @noServicesFound.
  ///
  /// In en, this message translates to:
  /// **'No services found'**
  String get noServicesFound;

  /// No description provided for @ramCalculation.
  ///
  /// In en, this message translates to:
  /// **'RAM Calculation'**
  String get ramCalculation;

  /// No description provided for @totalRam.
  ///
  /// In en, this message translates to:
  /// **'Total RAM'**
  String get totalRam;

  /// No description provided for @ramSources.
  ///
  /// In en, this message translates to:
  /// **'Sources'**
  String get ramSources;

  /// No description provided for @noRamDataAvailable.
  ///
  /// In en, this message translates to:
  /// **'No RAM data available for this app in the system memory report.'**
  String get noRamDataAvailable;

  /// No description provided for @ramCalculationExplanation.
  ///
  /// In en, this message translates to:
  /// **'RAM is calculated from system memory info. PID = Process ID lookup, Process = Process name lookup, LRU = Recent process list.'**
  String get ramCalculationExplanation;

  /// No description provided for @verifyCommand.
  ///
  /// In en, this message translates to:
  /// **'Verify Command'**
  String get verifyCommand;

  /// No description provided for @copiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard'**
  String get copiedToClipboard;

  /// No description provided for @copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copy;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get and;

  /// No description provided for @service_string.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one {1 service} other {{count} services}}'**
  String service_string(int count);

  /// No description provided for @process_string.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one {1 process} other {{count} processes}}'**
  String process_string(int count);

  /// No description provided for @service_process_string.
  ///
  /// In en, this message translates to:
  /// **'{processCount, plural, one {1 process} other {{processCount} processes}} and {serviceCount, plural, one {1 service} other {{serviceCount} services}}'**
  String service_process_string(int serviceCount, int processCount);

  /// No description provided for @info.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get info;

  /// No description provided for @followSystem.
  ///
  /// In en, this message translates to:
  /// **'Follow System'**
  String get followSystem;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['bn', 'en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
