// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'SilverTimer';

  @override
  String get calculatorTitle => 'SilverTimer';

  @override
  String get targetConcentration => 'Target Concentration';

  @override
  String get ppmSuffix => 'PPM';

  @override
  String get calculateButton => 'Calculate Time';

  @override
  String get waterVolume => 'Water Volume';

  @override
  String get unitMl => 'mL';

  @override
  String get unitL => 'L';

  @override
  String get calculatedDuration => 'Calculated Duration';

  @override
  String get startTimer => 'Start Timer';

  @override
  String ppmPresetLabel(int ppm) {
    return '$ppm PPM';
  }

  @override
  String get timerTitle => 'Timer';

  @override
  String cleanElectrodesSnackbar(int alarmNumber) {
    return 'Time to clean electrodes! (Alarm #$alarmNumber)';
  }

  @override
  String get dismiss => 'Dismiss';

  @override
  String get elapsed => 'Elapsed';

  @override
  String get total => 'Total';

  @override
  String get noTimerLoaded => 'No Timer Loaded';

  @override
  String get startButton => 'Start';

  @override
  String get resetButton => 'Reset';

  @override
  String get pauseButton => 'Pause';

  @override
  String get doneButton => 'Done';

  @override
  String get resetTimerTitle => 'Reset Timer?';

  @override
  String get resetTimerBody => 'This will stop and reset the current timer.';

  @override
  String get cancelButton => 'Cancel';

  @override
  String get electrolysisCompleteTitle => 'Electrolysis Complete!';

  @override
  String electrolysisCompleteBody(String totalTime) {
    return 'Your colloidal silver process is finished.\nTotal time: $totalTime';
  }

  @override
  String get remaining => 'remaining';

  @override
  String get nextClean => 'next clean';

  @override
  String get historyTitle => 'History';

  @override
  String get clearAll => 'Clear all';

  @override
  String historyLoadError(String error) {
    return 'Failed to load history: $error';
  }

  @override
  String get retryButton => 'Retry';

  @override
  String get clearAllHistoryTitle => 'Clear All History?';

  @override
  String get clearAllHistoryBody => 'This will permanently delete all session records.';

  @override
  String get clearAllButton => 'Clear All';

  @override
  String get noSessionsYet => 'No sessions yet';

  @override
  String get noSessionsSubtitle => 'Completed electrolysis runs will appear here';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get appearanceSection => 'Appearance';

  @override
  String get themeLabel => 'Theme';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get defaultsSection => 'Defaults';

  @override
  String get volumeUnitLabel => 'Volume Unit';

  @override
  String get volumeUnitMl => 'mL';

  @override
  String get volumeUnitLiters => 'Liters';

  @override
  String get defaultPpmLabel => 'Default PPM';

  @override
  String get defaultCurrentLabel => 'Default Current';

  @override
  String get typicalCurrentRange => 'Typical range: 5 – 40 mA';

  @override
  String get electrodeCleaningSection => 'Electrode Cleaning Alarm';

  @override
  String get enableCleaningAlarmLabel => 'Enable Cleaning Alarm';

  @override
  String get enableCleaningAlarmSubtitle => 'Remind you to clean electrodes during a session';

  @override
  String get cleaningIntervalLabel => 'Cleaning Interval';

  @override
  String get cleaningIntervalSubtitle => 'How often to be reminded';

  @override
  String get interval5min => '5 min';

  @override
  String get interval10min => '10 min';

  @override
  String get interval15min => '15 min';

  @override
  String get interval20min => '20 min';

  @override
  String get interval30min => '30 min';

  @override
  String get notificationsSection => 'Notifications';

  @override
  String get enableNotificationsLabel => 'Enable Notifications';

  @override
  String get enableNotificationsSubtitle => 'Alert when electrolysis is complete';

  @override
  String get aboutSection => 'About';

  @override
  String get calculationFormulaTitle => 'Calculation Formula';

  @override
  String get calculationFormulaBody =>
      'Based on Faraday\'\'s Law of Electrolysis:\n\ntime (s) = (PPM × Volume (L) × F) / (M_ag × I (A) × 1000)\n\nwhere:\n  F = 96,485 C/mol (Faraday constant)\n  M_ag = 107.87 g/mol (molar mass of silver)\n  I = current in amperes\n  PPM = target concentration in mg/L';

  @override
  String get versionLabel => 'Version';

  @override
  String get maSuffix => 'mA';

  @override
  String get navCalculator => 'Calculator';

  @override
  String get navTimer => 'Timer';

  @override
  String get navHistory => 'History';

  @override
  String get notifCompleteTitle => 'SilverTimer Complete!';

  @override
  String get notifCompleteBody => 'Your colloidal silver electrolysis is finished.';

  @override
  String get notifCleanTitle => 'Clean Electrodes';

  @override
  String notifCleanBody(int alarmNumber) {
    return 'Time to clean your electrodes (alarm #$alarmNumber).';
  }

  @override
  String get notifChannelDescription => 'SilverTimer electrolysis completion notifications';

  @override
  String get navInfo => 'Info';

  @override
  String get infoTitle => 'Info';

  @override
  String get infoAuthor => 'by Jörg Holzapfel';

  @override
  String get infoHowToUse => 'How to use SilverTimer';
}
