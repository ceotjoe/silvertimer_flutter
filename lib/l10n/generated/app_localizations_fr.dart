// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'SilverTimer';

  @override
  String get calculatorTitle => 'SilverTimer';

  @override
  String get targetConcentration => 'Concentration cible';

  @override
  String get ppmSuffix => 'PPM';

  @override
  String get calculateButton => 'Calculer la durée';

  @override
  String get waterVolume => 'Volume d\'\'eau';

  @override
  String get unitMl => 'mL';

  @override
  String get unitL => 'L';

  @override
  String get calculatedDuration => 'Durée calculée';

  @override
  String get startTimer => 'Démarrer le minuteur';

  @override
  String ppmPresetLabel(int ppm) {
    return '$ppm PPM';
  }

  @override
  String get timerTitle => 'Minuteur';

  @override
  String cleanElectrodesSnackbar(int alarmNumber) {
    return 'Nettoyez les électrodes ! (Alarme #$alarmNumber)';
  }

  @override
  String get dismiss => 'Ignorer';

  @override
  String get elapsed => 'Écoulé';

  @override
  String get total => 'Total';

  @override
  String get noTimerLoaded => 'Aucun minuteur chargé';

  @override
  String get startButton => 'Démarrer';

  @override
  String get resetButton => 'Réinitialiser';

  @override
  String get pauseButton => 'Pause';

  @override
  String get doneButton => 'Terminer';

  @override
  String get resetTimerTitle => 'Réinitialiser le minuteur ?';

  @override
  String get resetTimerBody => 'Cela arrêtera et réinitialisera le minuteur actuel.';

  @override
  String get cancelButton => 'Annuler';

  @override
  String get electrolysisCompleteTitle => 'Électrolyse terminée !';

  @override
  String electrolysisCompleteBody(String totalTime) {
    return 'Votre processus d\'\'argent colloïdal est terminé.\nDurée totale : $totalTime';
  }

  @override
  String get remaining => 'restant';

  @override
  String get nextClean => 'prochain nettoyage';

  @override
  String get historyTitle => 'Historique';

  @override
  String get clearAll => 'Tout effacer';

  @override
  String historyLoadError(String error) {
    return 'Échec du chargement de l\'\'historique : $error';
  }

  @override
  String get retryButton => 'Réessayer';

  @override
  String get clearAllHistoryTitle => 'Effacer tout l\'\'historique ?';

  @override
  String get clearAllHistoryBody =>
      'Tous les enregistrements de session seront définitivement supprimés.';

  @override
  String get clearAllButton => 'Tout effacer';

  @override
  String get noSessionsYet => 'Aucune session pour l\'\'instant';

  @override
  String get noSessionsSubtitle => 'Les cycles d\'\'électrolyse terminés apparaîtront ici';

  @override
  String get settingsTitle => 'Paramètres';

  @override
  String get appearanceSection => 'Apparence';

  @override
  String get themeLabel => 'Thème';

  @override
  String get themeSystem => 'Système';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get defaultsSection => 'Valeurs par défaut';

  @override
  String get volumeUnitLabel => 'Unité de volume';

  @override
  String get volumeUnitMl => 'mL';

  @override
  String get volumeUnitLiters => 'Litres';

  @override
  String get defaultPpmLabel => 'PPM par défaut';

  @override
  String get defaultCurrentLabel => 'Courant par défaut';

  @override
  String get typicalCurrentRange => 'Plage typique : 0,5–3 mA';

  @override
  String get electrodeCleaningSection => 'Alarme de nettoyage des électrodes';

  @override
  String get enableCleaningAlarmLabel => 'Activer l\'\'alarme de nettoyage';

  @override
  String get enableCleaningAlarmSubtitle =>
      'Vous rappelle de nettoyer les électrodes pendant une session';

  @override
  String get cleaningIntervalLabel => 'Intervalle de nettoyage';

  @override
  String get cleaningIntervalSubtitle => 'Fréquence de rappel';

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
  String get enableNotificationsLabel => 'Activer les notifications';

  @override
  String get enableNotificationsSubtitle => 'Alerte à la fin de l\'\'électrolyse';

  @override
  String get aboutSection => 'À propos';

  @override
  String get calculationFormulaTitle => 'Formule de calcul';

  @override
  String get calculationFormulaBody =>
      'Basé sur la loi de Faraday de l\'\'électrolyse :\n\ntemps (s) = (PPM × Volume (L) × F) / (M_ag × I (A) × 1000)\n\noù :\n  F = 96 485 C/mol (constante de Faraday)\n  M_ag = 107,87 g/mol (masse molaire de l\'\'argent)\n  I = courant en ampères\n  PPM = concentration cible en mg/L';

  @override
  String get versionLabel => 'Version';

  @override
  String get maSuffix => 'mA';

  @override
  String get navCalculator => 'Calculateur';

  @override
  String get navTimer => 'Minuteur';

  @override
  String get navHistory => 'Historique';

  @override
  String get notifCompleteTitle => 'SilverTimer terminé !';

  @override
  String get notifCompleteBody => 'Votre électrolyse d\'\'argent colloïdal est terminée.';

  @override
  String get notifCleanTitle => 'Nettoyer les électrodes';

  @override
  String notifCleanBody(int alarmNumber) {
    return 'Il est temps de nettoyer vos électrodes (alarme #$alarmNumber).';
  }

  @override
  String get notifChannelDescription => 'Notifications de fin d\'\'électrolyse SilverTimer';

  @override
  String get navInfo => 'Infos';

  @override
  String get infoTitle => 'Infos';

  @override
  String get infoAuthor => 'par Jörg Holzapfel';

  @override
  String get infoHowToUse => 'Comment utiliser SilverTimer';
}
