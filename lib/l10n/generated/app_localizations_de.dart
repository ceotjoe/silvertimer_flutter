// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'SilverTimer';

  @override
  String get calculatorTitle => 'SilverTimer';

  @override
  String get targetConcentration => 'Zielkonzentration';

  @override
  String get ppmSuffix => 'PPM';

  @override
  String get calculateButton => 'Zeit berechnen';

  @override
  String get waterVolume => 'Wasservolumen';

  @override
  String get unitMl => 'mL';

  @override
  String get unitL => 'L';

  @override
  String get calculatedDuration => 'Berechnete Dauer';

  @override
  String get startTimer => 'Timer starten';

  @override
  String ppmPresetLabel(int ppm) {
    return '$ppm PPM';
  }

  @override
  String get timerTitle => 'Timer';

  @override
  String cleanElectrodesSnackbar(int alarmNumber) {
    return 'Elektroden reinigen! (Alarm #$alarmNumber)';
  }

  @override
  String get dismiss => 'Schließen';

  @override
  String get elapsed => 'Verstrichen';

  @override
  String get total => 'Gesamt';

  @override
  String get noTimerLoaded => 'Kein Timer geladen';

  @override
  String get startButton => 'Start';

  @override
  String get resetButton => 'Zurücksetzen';

  @override
  String get pauseButton => 'Pause';

  @override
  String get doneButton => 'Fertig';

  @override
  String get resetTimerTitle => 'Timer zurücksetzen?';

  @override
  String get resetTimerBody =>
      'Damit wird der aktuelle Timer gestoppt und zurückgesetzt.';

  @override
  String get cancelButton => 'Abbrechen';

  @override
  String get electrolysisCompleteTitle => 'Elektrolyse abgeschlossen!';

  @override
  String electrolysisCompleteBody(String totalTime) {
    return 'Ihr kolloidaler Silberprozess ist beendet.\nGesamtzeit: $totalTime';
  }

  @override
  String get remaining => 'verbleibend';

  @override
  String get nextClean => 'nächste Reinigung';

  @override
  String get historyTitle => 'Verlauf';

  @override
  String get clearAll => 'Alle löschen';

  @override
  String historyLoadError(String error) {
    return 'Fehler beim Laden des Verlaufs: $error';
  }

  @override
  String get retryButton => 'Erneut versuchen';

  @override
  String get clearAllHistoryTitle => 'Gesamten Verlauf löschen?';

  @override
  String get clearAllHistoryBody =>
      'Alle Sitzungseinträge werden dauerhaft gelöscht.';

  @override
  String get clearAllButton => 'Alle löschen';

  @override
  String get noSessionsYet => 'Noch keine Sitzungen';

  @override
  String get noSessionsSubtitle =>
      'Abgeschlossene Elektrolysedurchläufe erscheinen hier';

  @override
  String get settingsTitle => 'Einstellungen';

  @override
  String get appearanceSection => 'Erscheinungsbild';

  @override
  String get themeLabel => 'Design';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get defaultsSection => 'Standardwerte';

  @override
  String get volumeUnitLabel => 'Volumeneinheit';

  @override
  String get volumeUnitMl => 'mL';

  @override
  String get volumeUnitLiters => 'Liter';

  @override
  String get defaultPpmLabel => 'Standard-PPM';

  @override
  String get defaultCurrentLabel => 'Standardstrom';

  @override
  String get typicalCurrentRange => 'Typischer Bereich: 0,5–3 mA';

  @override
  String get electrodeCleaningSection => 'Elektrodenreinigungsalarm';

  @override
  String get enableCleaningAlarmLabel => 'Reinigungsalarm aktivieren';

  @override
  String get enableCleaningAlarmSubtitle =>
      'Erinnert Sie während einer Sitzung daran, die Elektroden zu reinigen';

  @override
  String get cleaningIntervalLabel => 'Reinigungsintervall';

  @override
  String get cleaningIntervalSubtitle => 'Wie oft erinnert werden soll';

  @override
  String get interval5min => '5 Min.';

  @override
  String get interval10min => '10 Min.';

  @override
  String get interval15min => '15 Min.';

  @override
  String get interval20min => '20 Min.';

  @override
  String get interval30min => '30 Min.';

  @override
  String get notificationsSection => 'Benachrichtigungen';

  @override
  String get enableNotificationsLabel => 'Benachrichtigungen aktivieren';

  @override
  String get enableNotificationsSubtitle =>
      'Alarm bei Abschluss der Elektrolyse';

  @override
  String get aboutSection => 'Über';

  @override
  String get calculationFormulaTitle => 'Berechnungsformel';

  @override
  String get calculationFormulaBody =>
      'Basierend auf dem Faradayschen Gesetz der Elektrolyse:\n\nZeit (s) = (PPM × Volumen (L) × F) / (M_ag × I (A) × 1000)\n\nWobei:\n  F = 96.485 C/mol (Faraday-Konstante)\n  M_ag = 107,87 g/mol (Molmasse von Silber)\n  I = Strom in Ampere\n  PPM = Zielkonzentration in mg/L';

  @override
  String get versionLabel => 'Version';

  @override
  String get maSuffix => 'mA';

  @override
  String get navCalculator => 'Rechner';

  @override
  String get navTimer => 'Timer';

  @override
  String get navHistory => 'Verlauf';

  @override
  String get notifCompleteTitle => 'SilverTimer abgeschlossen!';

  @override
  String get notifCompleteBody =>
      'Ihre kolloidale Silberelektrolyse ist beendet.';

  @override
  String get notifCleanTitle => 'Elektroden reinigen';

  @override
  String notifCleanBody(int alarmNumber) {
    return 'Zeit, Ihre Elektroden zu reinigen (Alarm #$alarmNumber).';
  }

  @override
  String get notifChannelDescription =>
      'SilverTimer Elektrolyse-Abschlussbenachrichtigungen';
}
