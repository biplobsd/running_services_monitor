import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';

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

  /// No description provided for @systemAppWarning.
  ///
  /// In en, this message translates to:
  /// **'⚠️ WARNING: This is a SYSTEM APP. Stopping it may cause your device to malfunction or become unstable. Only proceed if you know what you\'re doing!'**
  String get systemAppWarning;
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
      <String>['bn', 'en'].contains(locale.languageCode);

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
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
