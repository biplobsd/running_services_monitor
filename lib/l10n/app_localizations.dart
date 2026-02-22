import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
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
    Locale('hi'),
    Locale('ja'),
    Locale('pt'),
    Locale('ru'),
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
  /// **'Services'**
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

  /// No description provided for @bound.
  ///
  /// In en, this message translates to:
  /// **'Bound'**
  String get bound;

  /// No description provided for @processRecord.
  ///
  /// In en, this message translates to:
  /// **'Process Record'**
  String get processRecord;

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

  /// No description provided for @playCommand.
  ///
  /// In en, this message translates to:
  /// **'Play Command'**
  String get playCommand;

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
  /// **'System'**
  String get followSystem;

  /// No description provided for @contributors.
  ///
  /// In en, this message translates to:
  /// **'Contributors'**
  String get contributors;

  /// No description provided for @contributionsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} contributions'**
  String contributionsCount(Object count);

  /// No description provided for @checkingPermissions.
  ///
  /// In en, this message translates to:
  /// **'Checking permissions...'**
  String get checkingPermissions;

  /// No description provided for @shizukuNotRunning.
  ///
  /// In en, this message translates to:
  /// **'Shizuku is not running. Please start Shizuku app.'**
  String get shizukuNotRunning;

  /// No description provided for @permissionDeniedShizuku.
  ///
  /// In en, this message translates to:
  /// **'Permission denied. Please grant Shizuku permission.'**
  String get permissionDeniedShizuku;

  /// No description provided for @failedToInitialize.
  ///
  /// In en, this message translates to:
  /// **'Failed to initialize. Please grant permission.'**
  String get failedToInitialize;

  /// No description provided for @errorInitializingShizuku.
  ///
  /// In en, this message translates to:
  /// **'Error initializing Shizuku'**
  String get errorInitializingShizuku;

  /// No description provided for @loadingApps.
  ///
  /// In en, this message translates to:
  /// **'Loading apps...'**
  String get loadingApps;

  /// No description provided for @refreshedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Refreshed successfully'**
  String get refreshedSuccessfully;

  /// No description provided for @errorLoadingData.
  ///
  /// In en, this message translates to:
  /// **'Error loading data'**
  String get errorLoadingData;

  /// No description provided for @failedToStopAllServices.
  ///
  /// In en, this message translates to:
  /// **'Failed to stop all services'**
  String get failedToStopAllServices;

  /// No description provided for @failedToStopServiceName.
  ///
  /// In en, this message translates to:
  /// **'Failed to stop service {serviceName}'**
  String failedToStopServiceName(String serviceName);

  /// No description provided for @errorPrefix.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String errorPrefix(String error);

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @openGithubProfile.
  ///
  /// In en, this message translates to:
  /// **'Open GitHub Profile'**
  String get openGithubProfile;

  /// No description provided for @appInfoTooltip.
  ///
  /// In en, this message translates to:
  /// **'App Info'**
  String get appInfoTooltip;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @recentCallingUid.
  ///
  /// In en, this message translates to:
  /// **'Recent Calling UID'**
  String get recentCallingUid;

  /// No description provided for @appDetails.
  ///
  /// In en, this message translates to:
  /// **'App Details'**
  String get appDetails;

  /// No description provided for @uidLabel.
  ///
  /// In en, this message translates to:
  /// **'UID: {uid}'**
  String uidLabel(int uid);

  /// No description provided for @processStateTitle.
  ///
  /// In en, this message translates to:
  /// **'Process State'**
  String get processStateTitle;

  /// No description provided for @processStateFg.
  ///
  /// In en, this message translates to:
  /// **'Foreground - App is currently in the foreground'**
  String get processStateFg;

  /// No description provided for @processStateVis.
  ///
  /// In en, this message translates to:
  /// **'Visible - App has a visible activity but not in foreground'**
  String get processStateVis;

  /// No description provided for @processStatePrev.
  ///
  /// In en, this message translates to:
  /// **'Previous - Previously used foreground app'**
  String get processStatePrev;

  /// No description provided for @processStatePrcp.
  ///
  /// In en, this message translates to:
  /// **'Perceptible - App is doing something the user is aware of'**
  String get processStatePrcp;

  /// No description provided for @processStateSvcb.
  ///
  /// In en, this message translates to:
  /// **'Service B - App has a bound service'**
  String get processStateSvcb;

  /// No description provided for @processStateHome.
  ///
  /// In en, this message translates to:
  /// **'Home - Home/Launcher app'**
  String get processStateHome;

  /// No description provided for @processStateHvy.
  ///
  /// In en, this message translates to:
  /// **'Heavy Weight - Heavy weight app process'**
  String get processStateHvy;

  /// No description provided for @processStatePsvc.
  ///
  /// In en, this message translates to:
  /// **'Persistent Service - App has a persistent service'**
  String get processStatePsvc;

  /// No description provided for @processStatePers.
  ///
  /// In en, this message translates to:
  /// **'Persistent - System persistent process'**
  String get processStatePers;

  /// No description provided for @processStateCchEmpty.
  ///
  /// In en, this message translates to:
  /// **'Cached Empty - Cached process with no activities'**
  String get processStateCchEmpty;

  /// No description provided for @processStateCchAct.
  ///
  /// In en, this message translates to:
  /// **'Cached Activity - Cached process with activities'**
  String get processStateCchAct;

  /// No description provided for @processStateCchClient.
  ///
  /// In en, this message translates to:
  /// **'Cached Client - Cached process as service client'**
  String get processStateCchClient;

  /// No description provided for @processStateCch.
  ///
  /// In en, this message translates to:
  /// **'Cached - Process is cached in memory'**
  String get processStateCch;

  /// No description provided for @processStateBfgs.
  ///
  /// In en, this message translates to:
  /// **'Bound Foreground Service - Bound to a foreground service'**
  String get processStateBfgs;

  /// No description provided for @processStateRcvr.
  ///
  /// In en, this message translates to:
  /// **'Receiver - App is running a broadcast receiver'**
  String get processStateRcvr;

  /// No description provided for @processStateTop.
  ///
  /// In en, this message translates to:
  /// **'Top - App is at the top of the activity stack'**
  String get processStateTop;

  /// No description provided for @processStateBtop.
  ///
  /// In en, this message translates to:
  /// **'Bound Top - Bound to a top app'**
  String get processStateBtop;

  /// No description provided for @processStateImpf.
  ///
  /// In en, this message translates to:
  /// **'Important Foreground - Important foreground process'**
  String get processStateImpf;

  /// No description provided for @processStateImpb.
  ///
  /// In en, this message translates to:
  /// **'Important Background - Important background process'**
  String get processStateImpb;

  /// No description provided for @processStateUnknown.
  ///
  /// In en, this message translates to:
  /// **'Process state: {state}'**
  String processStateUnknown(String state);

  /// No description provided for @workingMode.
  ///
  /// In en, this message translates to:
  /// **'Working Mode'**
  String get workingMode;

  /// No description provided for @rootMode.
  ///
  /// In en, this message translates to:
  /// **'Root'**
  String get rootMode;

  /// No description provided for @shizukuMode.
  ///
  /// In en, this message translates to:
  /// **'Shizuku'**
  String get shizukuMode;

  /// No description provided for @selectWorkingMode.
  ///
  /// In en, this message translates to:
  /// **'Select Working Mode'**
  String get selectWorkingMode;

  /// No description provided for @available.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get available;

  /// No description provided for @notAvailable.
  ///
  /// In en, this message translates to:
  /// **'Not Available'**
  String get notAvailable;

  /// No description provided for @modeNotAvailable.
  ///
  /// In en, this message translates to:
  /// **'This mode is not available'**
  String get modeNotAvailable;

  /// No description provided for @noModeAvailable.
  ///
  /// In en, this message translates to:
  /// **'No permission mode available'**
  String get noModeAvailable;

  /// No description provided for @commandLogs.
  ///
  /// In en, this message translates to:
  /// **'Command Logs'**
  String get commandLogs;

  /// No description provided for @commandOutput.
  ///
  /// In en, this message translates to:
  /// **'Command Output'**
  String get commandOutput;

  /// No description provided for @noCommandLogs.
  ///
  /// In en, this message translates to:
  /// **'No commands executed yet'**
  String get noCommandLogs;

  /// No description provided for @clearLogs.
  ///
  /// In en, this message translates to:
  /// **'Clear Logs'**
  String get clearLogs;

  /// No description provided for @clearLogsConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear all command logs?'**
  String get clearLogsConfirm;

  /// No description provided for @executedAt.
  ///
  /// In en, this message translates to:
  /// **'Executed at'**
  String get executedAt;

  /// No description provided for @command.
  ///
  /// In en, this message translates to:
  /// **'Command'**
  String get command;

  /// No description provided for @noOutput.
  ///
  /// In en, this message translates to:
  /// **'No output'**
  String get noOutput;

  /// No description provided for @executeCommand.
  ///
  /// In en, this message translates to:
  /// **'Execute'**
  String get executeCommand;

  /// No description provided for @processes.
  ///
  /// In en, this message translates to:
  /// **'Processes'**
  String get processes;

  /// No description provided for @processesDescription.
  ///
  /// In en, this message translates to:
  /// **'All running processes for this app from memory info.'**
  String get processesDescription;

  /// No description provided for @noProcessesFound.
  ///
  /// In en, this message translates to:
  /// **'No processes found'**
  String get noProcessesFound;

  /// No description provided for @usedBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Used Breakdown'**
  String get usedBreakdown;

  /// No description provided for @freeBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Free Breakdown'**
  String get freeBreakdown;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @usedPss.
  ///
  /// In en, this message translates to:
  /// **'Used PSS'**
  String get usedPss;

  /// No description provided for @kernel.
  ///
  /// In en, this message translates to:
  /// **'Kernel'**
  String get kernel;

  /// No description provided for @cachedPss.
  ///
  /// In en, this message translates to:
  /// **'Cached PSS'**
  String get cachedPss;

  /// No description provided for @cachedKernel.
  ///
  /// In en, this message translates to:
  /// **'Cached Kernel'**
  String get cachedKernel;

  /// No description provided for @actualFree.
  ///
  /// In en, this message translates to:
  /// **'Actual Free'**
  String get actualFree;

  /// No description provided for @gpu.
  ///
  /// In en, this message translates to:
  /// **'GPU'**
  String get gpu;

  /// No description provided for @lostRam.
  ///
  /// In en, this message translates to:
  /// **'Lost RAM'**
  String get lostRam;

  /// No description provided for @zramPhysical.
  ///
  /// In en, this message translates to:
  /// **'ZRAM Physical'**
  String get zramPhysical;

  /// No description provided for @zramSwapUsed.
  ///
  /// In en, this message translates to:
  /// **'ZRAM Swap Used'**
  String get zramSwapUsed;

  /// No description provided for @zramTotalSwap.
  ///
  /// In en, this message translates to:
  /// **'ZRAM Total Swap'**
  String get zramTotalSwap;

  /// No description provided for @oomThreshold.
  ///
  /// In en, this message translates to:
  /// **'OOM Threshold'**
  String get oomThreshold;

  /// No description provided for @restoreLimit.
  ///
  /// In en, this message translates to:
  /// **'Restore Limit'**
  String get restoreLimit;

  /// No description provided for @zramSection.
  ///
  /// In en, this message translates to:
  /// **'ZRAM'**
  String get zramSection;

  /// No description provided for @memoryThresholds.
  ///
  /// In en, this message translates to:
  /// **'Memory Thresholds'**
  String get memoryThresholds;

  /// No description provided for @boundServiceCannotStop.
  ///
  /// In en, this message translates to:
  /// **'This service is bound by another process and cannot be stopped directly. You can stop the entire app instead.'**
  String get boundServiceCannotStop;

  /// No description provided for @memoryInfo.
  ///
  /// In en, this message translates to:
  /// **'Memory Info'**
  String get memoryInfo;

  /// No description provided for @viewRawOutput.
  ///
  /// In en, this message translates to:
  /// **'View Raw'**
  String get viewRawOutput;

  /// No description provided for @hideRawOutput.
  ///
  /// In en, this message translates to:
  /// **'Hide Raw'**
  String get hideRawOutput;

  /// No description provided for @compareWithOther.
  ///
  /// In en, this message translates to:
  /// **'Compare'**
  String get compareWithOther;

  /// No description provided for @memoryCategories.
  ///
  /// In en, this message translates to:
  /// **'Memory Categories'**
  String get memoryCategories;

  /// No description provided for @appSummary.
  ///
  /// In en, this message translates to:
  /// **'App Summary'**
  String get appSummary;

  /// No description provided for @objects.
  ///
  /// In en, this message translates to:
  /// **'Objects'**
  String get objects;

  /// No description provided for @memoryComparison.
  ///
  /// In en, this message translates to:
  /// **'Memory Comparison'**
  String get memoryComparison;

  /// No description provided for @selectAppToCompare.
  ///
  /// In en, this message translates to:
  /// **'Select an app to compare'**
  String get selectAppToCompare;

  /// No description provided for @selectApp.
  ///
  /// In en, this message translates to:
  /// **'Select app...'**
  String get selectApp;

  /// No description provided for @totalPss.
  ///
  /// In en, this message translates to:
  /// **'Total PSS'**
  String get totalPss;

  /// No description provided for @totalRss.
  ///
  /// In en, this message translates to:
  /// **'Total RSS'**
  String get totalRss;

  /// No description provided for @javaHeap.
  ///
  /// In en, this message translates to:
  /// **'Java Heap'**
  String get javaHeap;

  /// No description provided for @nativeHeap.
  ///
  /// In en, this message translates to:
  /// **'Native Heap'**
  String get nativeHeap;

  /// No description provided for @code.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get code;

  /// No description provided for @graphics.
  ///
  /// In en, this message translates to:
  /// **'Graphics'**
  String get graphics;

  /// No description provided for @current.
  ///
  /// In en, this message translates to:
  /// **'Current'**
  String get current;

  /// No description provided for @allApps.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allApps;

  /// No description provided for @userApps.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get userApps;

  /// No description provided for @systemApps.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemApps;

  /// No description provided for @compareWith.
  ///
  /// In en, this message translates to:
  /// **'Compare with'**
  String get compareWith;

  /// No description provided for @stats.
  ///
  /// In en, this message translates to:
  /// **'Stats'**
  String get stats;

  /// No description provided for @statsLiveRamArea.
  ///
  /// In en, this message translates to:
  /// **'Live System RAM'**
  String get statsLiveRamArea;

  /// No description provided for @statsLiveRamAreaSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Used RAM over time'**
  String get statsLiveRamAreaSubtitle;

  /// No description provided for @statsRamDistribution.
  ///
  /// In en, this message translates to:
  /// **'System RAM Distribution'**
  String get statsRamDistribution;

  /// No description provided for @statsRamDistributionTotal.
  ///
  /// In en, this message translates to:
  /// **'Total: {size}'**
  String statsRamDistributionTotal(String size);

  /// No description provided for @statsRamLabel.
  ///
  /// In en, this message translates to:
  /// **'RAM'**
  String get statsRamLabel;

  /// No description provided for @statsZram.
  ///
  /// In en, this message translates to:
  /// **'ZRAM'**
  String get statsZram;

  /// No description provided for @statsUserVsSystemRam.
  ///
  /// In en, this message translates to:
  /// **'User vs System Apps RAM'**
  String get statsUserVsSystemRam;

  /// No description provided for @statsAppStateDistribution.
  ///
  /// In en, this message translates to:
  /// **'App State Distribution'**
  String get statsAppStateDistribution;

  /// No description provided for @statsActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get statsActive;

  /// No description provided for @statsBackground.
  ///
  /// In en, this message translates to:
  /// **'Background'**
  String get statsBackground;

  /// No description provided for @statsCached.
  ///
  /// In en, this message translates to:
  /// **'Cached'**
  String get statsCached;

  /// No description provided for @statsAppsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Apps'**
  String statsAppsCount(int count);

  /// No description provided for @statsSystemVsUserAnalysis.
  ///
  /// In en, this message translates to:
  /// **'System vs User Analysis'**
  String get statsSystemVsUserAnalysis;

  /// No description provided for @statsAppCount.
  ///
  /// In en, this message translates to:
  /// **'App Count'**
  String get statsAppCount;

  /// No description provided for @statsTotalRam.
  ///
  /// In en, this message translates to:
  /// **'Total RAM'**
  String get statsTotalRam;

  /// No description provided for @statsPerformance.
  ///
  /// In en, this message translates to:
  /// **'Performance'**
  String get statsPerformance;

  /// No description provided for @statsRamDistributionScatter.
  ///
  /// In en, this message translates to:
  /// **'RAM Distribution Scatter'**
  String get statsRamDistributionScatter;

  /// No description provided for @statsRamDistributionScatterSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Y: RAM, X: App Index'**
  String get statsRamDistributionScatterSubtitle;

  /// No description provided for @statsTopRamConsumers.
  ///
  /// In en, this message translates to:
  /// **'Top RAM Consumers'**
  String get statsTopRamConsumers;

  /// No description provided for @statsServicesVsRamCorrelation.
  ///
  /// In en, this message translates to:
  /// **'Services vs RAM Correlation'**
  String get statsServicesVsRamCorrelation;

  /// No description provided for @statsServicesVsRamSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Y: RAM, X: Service Count, Bubble: Process Count'**
  String get statsServicesVsRamSubtitle;

  /// No description provided for @statsRamHistogram.
  ///
  /// In en, this message translates to:
  /// **'RAM Frequency Histogram'**
  String get statsRamHistogram;

  /// No description provided for @statsRamHistogramSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Count of Apps by Memory Size'**
  String get statsRamHistogramSubtitle;

  /// No description provided for @statsMemoryHeatmap.
  ///
  /// In en, this message translates to:
  /// **'Memory Heatmap'**
  String get statsMemoryHeatmap;

  /// No description provided for @statsMemoryHeatmapSubtitle.
  ///
  /// In en, this message translates to:
  /// **'All Apps Sorted by RAM Intensity'**
  String get statsMemoryHeatmapSubtitle;

  /// No description provided for @statsTopAppsRelativeImpact.
  ///
  /// In en, this message translates to:
  /// **'Top Apps Relative Impact'**
  String get statsTopAppsRelativeImpact;

  /// No description provided for @statsGanttSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Gantt-style Visualization of RAM Share'**
  String get statsGanttSubtitle;

  /// No description provided for @statsStackedAreaChart.
  ///
  /// In en, this message translates to:
  /// **'RAM Breakdown Over Time'**
  String get statsStackedAreaChart;

  /// No description provided for @statsStackedAreaSubtitle.
  ///
  /// In en, this message translates to:
  /// **'User, System, and Kernel RAM'**
  String get statsStackedAreaSubtitle;

  /// No description provided for @statsPolarChart.
  ///
  /// In en, this message translates to:
  /// **'Process State Distribution'**
  String get statsPolarChart;

  /// No description provided for @statsPolarSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Polar view of app states'**
  String get statsPolarSubtitle;

  /// No description provided for @statsTreemap.
  ///
  /// In en, this message translates to:
  /// **'RAM Distribution Treemap'**
  String get statsTreemap;

  /// No description provided for @statsTreemapSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Proportional RAM usage by app'**
  String get statsTreemapSubtitle;

  /// No description provided for @statsFunnelChart.
  ///
  /// In en, this message translates to:
  /// **'RAM Usage Tiers'**
  String get statsFunnelChart;

  /// No description provided for @statsFunnelSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Apps grouped by memory size'**
  String get statsFunnelSubtitle;

  /// No description provided for @statsWaterfallChart.
  ///
  /// In en, this message translates to:
  /// **'RAM Allocation Waterfall'**
  String get statsWaterfallChart;

  /// No description provided for @statsWaterfallSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Breakdown from total to components'**
  String get statsWaterfallSubtitle;

  /// No description provided for @statsGaugeChart.
  ///
  /// In en, this message translates to:
  /// **'RAM Usage Gauge'**
  String get statsGaugeChart;

  /// No description provided for @statsGaugeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Overall system memory utilization'**
  String get statsGaugeSubtitle;

  /// No description provided for @statsTiny.
  ///
  /// In en, this message translates to:
  /// **'Tiny'**
  String get statsTiny;

  /// No description provided for @statsSmall.
  ///
  /// In en, this message translates to:
  /// **'Small'**
  String get statsSmall;

  /// No description provided for @statsMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get statsMedium;

  /// No description provided for @statsLarge.
  ///
  /// In en, this message translates to:
  /// **'Large'**
  String get statsLarge;

  /// No description provided for @statsHuge.
  ///
  /// In en, this message translates to:
  /// **'Huge'**
  String get statsHuge;

  /// No description provided for @statsNoData.
  ///
  /// In en, this message translates to:
  /// **'No data available'**
  String get statsNoData;

  /// No description provided for @statsWaitingForData.
  ///
  /// In en, this message translates to:
  /// **'Waiting for data...'**
  String get statsWaitingForData;

  /// No description provided for @statsRamDistributionPie.
  ///
  /// In en, this message translates to:
  /// **'System RAM Distribution'**
  String get statsRamDistributionPie;

  /// No description provided for @statsRamDistributionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Used, Free, and ZRAM'**
  String get statsRamDistributionSubtitle;

  /// No description provided for @statsUsed.
  ///
  /// In en, this message translates to:
  /// **'Used'**
  String get statsUsed;

  /// No description provided for @statsFree.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get statsFree;

  /// No description provided for @statsUserVsSystemPie.
  ///
  /// In en, this message translates to:
  /// **'User vs System Apps RAM'**
  String get statsUserVsSystemPie;

  /// No description provided for @statsUserVsSystemSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Compare user and system app memory'**
  String get statsUserVsSystemSubtitle;

  /// No description provided for @statsProcessStateBar.
  ///
  /// In en, this message translates to:
  /// **'App State Distribution'**
  String get statsProcessStateBar;

  /// No description provided for @statsProcessStateSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Active, Background, and Cached apps'**
  String get statsProcessStateSubtitle;

  /// No description provided for @statsScatterChart.
  ///
  /// In en, this message translates to:
  /// **'RAM Distribution Scatter'**
  String get statsScatterChart;

  /// No description provided for @statsScatterSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Y: RAM (MB), X: App Index'**
  String get statsScatterSubtitle;

  /// No description provided for @core.
  ///
  /// In en, this message translates to:
  /// **'Core'**
  String get core;

  /// No description provided for @coreAppInfoLimited.
  ///
  /// In en, this message translates to:
  /// **'Limited info available for system processes'**
  String get coreAppInfoLimited;

  /// No description provided for @showCoreApps.
  ///
  /// In en, this message translates to:
  /// **'Show Core Apps'**
  String get showCoreApps;

  /// No description provided for @usefulCommands.
  ///
  /// In en, this message translates to:
  /// **'Useful Commands'**
  String get usefulCommands;

  /// No description provided for @commands.
  ///
  /// In en, this message translates to:
  /// **'Commands'**
  String get commands;

  /// No description provided for @addCommand.
  ///
  /// In en, this message translates to:
  /// **'Add Command'**
  String get addCommand;

  /// No description provided for @placeholders.
  ///
  /// In en, this message translates to:
  /// **'Placeholders'**
  String get placeholders;

  /// No description provided for @commandTitle.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get commandTitle;

  /// No description provided for @commandDescription.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get commandDescription;

  /// No description provided for @reExecute.
  ///
  /// In en, this message translates to:
  /// **'Re-execute'**
  String get reExecute;

  /// No description provided for @statsProcessVsRamLine.
  ///
  /// In en, this message translates to:
  /// **'Process vs RAM Correlation'**
  String get statsProcessVsRamLine;

  /// No description provided for @statsProcessVsRamLineSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Blue: RAM, Dashed: Process Count'**
  String get statsProcessVsRamLineSubtitle;

  /// No description provided for @statsUserVsSystemBar.
  ///
  /// In en, this message translates to:
  /// **'User vs System Comparison'**
  String get statsUserVsSystemBar;

  /// No description provided for @statsUserVsSystemBarSubtitle.
  ///
  /// In en, this message translates to:
  /// **'App Count, Total RAM, Average RAM'**
  String get statsUserVsSystemBarSubtitle;

  /// No description provided for @statsRamTrendScatter.
  ///
  /// In en, this message translates to:
  /// **'RAM Trend Analysis'**
  String get statsRamTrendScatter;

  /// No description provided for @statsRamTrendScatterSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Services vs RAM with Trend Line'**
  String get statsRamTrendScatterSubtitle;

  /// No description provided for @statsServicesVsProcesses.
  ///
  /// In en, this message translates to:
  /// **'Services vs Processes'**
  String get statsServicesVsProcesses;

  /// No description provided for @statsServicesVsProcessesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Correlation between Service and Process counts'**
  String get statsServicesVsProcessesSubtitle;

  /// No description provided for @statsProcessStateRam.
  ///
  /// In en, this message translates to:
  /// **'RAM by Process State'**
  String get statsProcessStateRam;

  /// No description provided for @statsProcessStateRamSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Average RAM usage per process state'**
  String get statsProcessStateRamSubtitle;

  /// No description provided for @myCommands.
  ///
  /// In en, this message translates to:
  /// **'My Commands'**
  String get myCommands;

  /// No description provided for @defaultCommands.
  ///
  /// In en, this message translates to:
  /// **'Default Commands'**
  String get defaultCommands;

  /// No description provided for @resetDefaults.
  ///
  /// In en, this message translates to:
  /// **'Reset Defaults'**
  String get resetDefaults;

  /// No description provided for @memoryDistribution.
  ///
  /// In en, this message translates to:
  /// **'Memory Distribution'**
  String get memoryDistribution;

  /// No description provided for @memoryProfileComparison.
  ///
  /// In en, this message translates to:
  /// **'Memory Profile Comparison'**
  String get memoryProfileComparison;

  /// No description provided for @stack.
  ///
  /// In en, this message translates to:
  /// **'Stack'**
  String get stack;

  /// No description provided for @privateOther.
  ///
  /// In en, this message translates to:
  /// **'Private Other'**
  String get privateOther;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get unknown;

  /// No description provided for @totalPssLabel.
  ///
  /// In en, this message translates to:
  /// **'Total PSS: {size}'**
  String totalPssLabel(String size);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'bn',
    'en',
    'hi',
    'ja',
    'pt',
    'ru',
    'zh',
  ].contains(locale.languageCode);

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
    case 'hi':
      return AppLocalizationsHi();
    case 'ja':
      return AppLocalizationsJa();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
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
