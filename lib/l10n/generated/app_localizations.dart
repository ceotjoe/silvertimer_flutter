import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
  ];

  /// The name of the application shown in titles and notifications.
  ///
  /// In en, this message translates to:
  /// **'SilverTimer'**
  String get appTitle;

  /// AppBar title on the Calculator screen.
  ///
  /// In en, this message translates to:
  /// **'SilverTimer'**
  String get calculatorTitle;

  /// Label above the PPM text field on the calculator.
  ///
  /// In en, this message translates to:
  /// **'Target Concentration'**
  String get targetConcentration;

  /// Unit suffix shown inside the PPM input field.
  ///
  /// In en, this message translates to:
  /// **'PPM'**
  String get ppmSuffix;

  /// Label on the primary action button that computes the electrolysis duration.
  ///
  /// In en, this message translates to:
  /// **'Calculate Time'**
  String get calculateButton;

  /// Label above the volume input field.
  ///
  /// In en, this message translates to:
  /// **'Water Volume'**
  String get waterVolume;

  /// Abbreviation for millilitres, used as field suffix and segment label.
  ///
  /// In en, this message translates to:
  /// **'mL'**
  String get unitMl;

  /// Abbreviation for litres, used as field suffix and segment label.
  ///
  /// In en, this message translates to:
  /// **'L'**
  String get unitL;

  /// Title inside the result card showing the computed run time.
  ///
  /// In en, this message translates to:
  /// **'Calculated Duration'**
  String get calculatedDuration;

  /// Button inside the result card that navigates to the timer screen.
  ///
  /// In en, this message translates to:
  /// **'Start Timer'**
  String get startTimer;

  /// Label on a PPM preset chip. ppm is an integer.
  ///
  /// In en, this message translates to:
  /// **'{ppm} PPM'**
  String ppmPresetLabel(int ppm);

  /// AppBar title on the Timer screen.
  ///
  /// In en, this message translates to:
  /// **'Timer'**
  String get timerTitle;

  /// SnackBar message shown when an electrode cleaning alarm fires in-app.
  ///
  /// In en, this message translates to:
  /// **'Time to clean electrodes! (Alarm #{alarmNumber})'**
  String cleanElectrodesSnackbar(int alarmNumber);

  /// Label for the SnackBar dismiss action.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get dismiss;

  /// Label for the elapsed-time stat below the circular timer.
  ///
  /// In en, this message translates to:
  /// **'Elapsed'**
  String get elapsed;

  /// Label for the total-duration stat below the circular timer.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// Placeholder button label when the timer is in idle state and no calculation has been loaded.
  ///
  /// In en, this message translates to:
  /// **'No Timer Loaded'**
  String get noTimerLoaded;

  /// Button label to start or resume a paused timer.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get startButton;

  /// Button label to reset the current timer back to idle.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get resetButton;

  /// Button label to pause a running timer.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pauseButton;

  /// Button label shown when the timer has completed, to return to the calculator.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get doneButton;

  /// Title of the confirmation dialog shown before resetting a running timer.
  ///
  /// In en, this message translates to:
  /// **'Reset Timer?'**
  String get resetTimerTitle;

  /// Body text of the reset confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'This will stop and reset the current timer.'**
  String get resetTimerBody;

  /// Generic cancel button label used in dialogs.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButton;

  /// Title of the dialog shown when the timer finishes.
  ///
  /// In en, this message translates to:
  /// **'Electrolysis Complete!'**
  String get electrolysisCompleteTitle;

  /// Body text of the completion dialog. totalTime is a pre-formatted duration string like '1h 23min 45sec'.
  ///
  /// In en, this message translates to:
  /// **'Your colloidal silver process is finished.\nTotal time: {totalTime}'**
  String electrolysisCompleteBody(String totalTime);

  /// Label shown below the countdown inside the circular timer.
  ///
  /// In en, this message translates to:
  /// **'remaining'**
  String get remaining;

  /// Label shown below the next-cleaning countdown inside the circular timer.
  ///
  /// In en, this message translates to:
  /// **'next clean'**
  String get nextClean;

  /// AppBar title on the History screen.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get historyTitle;

  /// Tooltip on the delete icon button in the History AppBar.
  ///
  /// In en, this message translates to:
  /// **'Clear all'**
  String get clearAll;

  /// Error message shown when history fails to load.
  ///
  /// In en, this message translates to:
  /// **'Failed to load history: {error}'**
  String historyLoadError(String error);

  /// Button label to retry a failed operation.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retryButton;

  /// Title of the confirmation dialog for clearing all history.
  ///
  /// In en, this message translates to:
  /// **'Clear All History?'**
  String get clearAllHistoryTitle;

  /// Body text of the clear-all-history confirmation dialog.
  ///
  /// In en, this message translates to:
  /// **'This will permanently delete all session records.'**
  String get clearAllHistoryBody;

  /// Destructive action button in the clear history dialog.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get clearAllButton;

  /// Heading in the empty state of the History screen.
  ///
  /// In en, this message translates to:
  /// **'No sessions yet'**
  String get noSessionsYet;

  /// Subtitle in the empty state of the History screen.
  ///
  /// In en, this message translates to:
  /// **'Completed electrolysis runs will appear here'**
  String get noSessionsSubtitle;

  /// AppBar title on the Settings screen.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// Section header for the Appearance group in Settings.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearanceSection;

  /// Label for the theme selector in Settings.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get themeLabel;

  /// Theme option that follows the system preference.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// Light theme option.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// Dark theme option.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// Section header for the Defaults group in Settings.
  ///
  /// In en, this message translates to:
  /// **'Defaults'**
  String get defaultsSection;

  /// Label for the volume unit selector in Settings.
  ///
  /// In en, this message translates to:
  /// **'Volume Unit'**
  String get volumeUnitLabel;

  /// Millilitres option in the volume unit dropdown.
  ///
  /// In en, this message translates to:
  /// **'mL'**
  String get volumeUnitMl;

  /// Litres option in the volume unit dropdown.
  ///
  /// In en, this message translates to:
  /// **'Liters'**
  String get volumeUnitLiters;

  /// Label for the default PPM input in Settings.
  ///
  /// In en, this message translates to:
  /// **'Default PPM'**
  String get defaultPpmLabel;

  /// Label for the default current (mA) input in Settings.
  ///
  /// In en, this message translates to:
  /// **'Default Current'**
  String get defaultCurrentLabel;

  /// Subtitle hint below the default current input.
  ///
  /// In en, this message translates to:
  /// **'Typical range: 0.5–3 mA'**
  String get typicalCurrentRange;

  /// Section header for the Electrode Cleaning Alarm group in Settings.
  ///
  /// In en, this message translates to:
  /// **'Electrode Cleaning Alarm'**
  String get electrodeCleaningSection;

  /// Switch title for enabling the electrode cleaning alarm.
  ///
  /// In en, this message translates to:
  /// **'Enable Cleaning Alarm'**
  String get enableCleaningAlarmLabel;

  /// Subtitle explaining the cleaning alarm switch.
  ///
  /// In en, this message translates to:
  /// **'Remind you to clean electrodes during a session'**
  String get enableCleaningAlarmSubtitle;

  /// Label for the cleaning interval dropdown in Settings.
  ///
  /// In en, this message translates to:
  /// **'Cleaning Interval'**
  String get cleaningIntervalLabel;

  /// Subtitle under the cleaning interval dropdown.
  ///
  /// In en, this message translates to:
  /// **'How often to be reminded'**
  String get cleaningIntervalSubtitle;

  /// 5-minute cleaning interval option.
  ///
  /// In en, this message translates to:
  /// **'5 min'**
  String get interval5min;

  /// 10-minute cleaning interval option.
  ///
  /// In en, this message translates to:
  /// **'10 min'**
  String get interval10min;

  /// 15-minute cleaning interval option.
  ///
  /// In en, this message translates to:
  /// **'15 min'**
  String get interval15min;

  /// 20-minute cleaning interval option.
  ///
  /// In en, this message translates to:
  /// **'20 min'**
  String get interval20min;

  /// 30-minute cleaning interval option.
  ///
  /// In en, this message translates to:
  /// **'30 min'**
  String get interval30min;

  /// Section header for the Notifications group in Settings.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsSection;

  /// Switch title for enabling OS notifications.
  ///
  /// In en, this message translates to:
  /// **'Enable Notifications'**
  String get enableNotificationsLabel;

  /// Subtitle explaining the notifications switch.
  ///
  /// In en, this message translates to:
  /// **'Alert when electrolysis is complete'**
  String get enableNotificationsSubtitle;

  /// Section header for the About group in Settings.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutSection;

  /// Title of the expandable Faraday formula section.
  ///
  /// In en, this message translates to:
  /// **'Calculation Formula'**
  String get calculationFormulaTitle;

  /// Multi-line description of the Faraday electrolysis formula. The apostrophe in Faraday's is escaped as '' per ICU rules.
  ///
  /// In en, this message translates to:
  /// **'Based on Faraday\'\'s Law of Electrolysis:\n\ntime (s) = (PPM × Volume (L) × F) / (M_ag × I (A) × 1000)\n\nwhere:\n  F = 96,485 C/mol (Faraday constant)\n  M_ag = 107.87 g/mol (molar mass of silver)\n  I = current in amperes\n  PPM = target concentration in mg/L'**
  String get calculationFormulaBody;

  /// Label for the version list tile in Settings.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get versionLabel;

  /// Milliamps unit suffix used in text fields.
  ///
  /// In en, this message translates to:
  /// **'mA'**
  String get maSuffix;

  /// Bottom navigation bar label for the Calculator tab.
  ///
  /// In en, this message translates to:
  /// **'Calculator'**
  String get navCalculator;

  /// Bottom navigation bar label for the Timer tab.
  ///
  /// In en, this message translates to:
  /// **'Timer'**
  String get navTimer;

  /// Bottom navigation bar label for the History tab.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get navHistory;

  /// OS notification title when the electrolysis timer completes.
  ///
  /// In en, this message translates to:
  /// **'SilverTimer Complete!'**
  String get notifCompleteTitle;

  /// OS notification body when the electrolysis timer completes.
  ///
  /// In en, this message translates to:
  /// **'Your colloidal silver electrolysis is finished.'**
  String get notifCompleteBody;

  /// OS notification title for electrode cleaning alarms.
  ///
  /// In en, this message translates to:
  /// **'Clean Electrodes'**
  String get notifCleanTitle;

  /// OS notification body for electrode cleaning alarms.
  ///
  /// In en, this message translates to:
  /// **'Time to clean your electrodes (alarm #{alarmNumber}).'**
  String notifCleanBody(int alarmNumber);

  /// Android notification channel description string (registered once by the OS on first install).
  ///
  /// In en, this message translates to:
  /// **'SilverTimer electrolysis completion notifications'**
  String get notifChannelDescription;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en', 'es', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
