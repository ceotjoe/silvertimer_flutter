// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'SilverTimer';

  @override
  String get calculatorTitle => 'SilverTimer';

  @override
  String get targetConcentration => 'Concentración objetivo';

  @override
  String get ppmSuffix => 'PPM';

  @override
  String get calculateButton => 'Calcular tiempo';

  @override
  String get waterVolume => 'Volumen de agua';

  @override
  String get unitMl => 'mL';

  @override
  String get unitL => 'L';

  @override
  String get calculatedDuration => 'Duración calculada';

  @override
  String get startTimer => 'Iniciar temporizador';

  @override
  String ppmPresetLabel(int ppm) {
    return '$ppm PPM';
  }

  @override
  String get timerTitle => 'Temporizador';

  @override
  String cleanElectrodesSnackbar(int alarmNumber) {
    return '¡Hora de limpiar los electrodos! (Alarma #$alarmNumber)';
  }

  @override
  String get dismiss => 'Descartar';

  @override
  String get elapsed => 'Transcurrido';

  @override
  String get total => 'Total';

  @override
  String get noTimerLoaded => 'Ningún temporizador cargado';

  @override
  String get startButton => 'Iniciar';

  @override
  String get resetButton => 'Reiniciar';

  @override
  String get pauseButton => 'Pausar';

  @override
  String get doneButton => 'Listo';

  @override
  String get resetTimerTitle => '¿Reiniciar temporizador?';

  @override
  String get resetTimerBody =>
      'Esto detendrá y reiniciará el temporizador actual.';

  @override
  String get cancelButton => 'Cancelar';

  @override
  String get electrolysisCompleteTitle => '¡Electrólisis completa!';

  @override
  String electrolysisCompleteBody(String totalTime) {
    return 'Su proceso de plata coloidal ha finalizado.\nTiempo total: $totalTime';
  }

  @override
  String get remaining => 'restante';

  @override
  String get nextClean => 'próxima limpieza';

  @override
  String get historyTitle => 'Historial';

  @override
  String get clearAll => 'Borrar todo';

  @override
  String historyLoadError(String error) {
    return 'Error al cargar el historial: $error';
  }

  @override
  String get retryButton => 'Reintentar';

  @override
  String get clearAllHistoryTitle => '¿Borrar todo el historial?';

  @override
  String get clearAllHistoryBody =>
      'Se eliminarán permanentemente todos los registros de sesión.';

  @override
  String get clearAllButton => 'Borrar todo';

  @override
  String get noSessionsYet => 'Todavía no hay sesiones';

  @override
  String get noSessionsSubtitle =>
      'Las ejecuciones de electrólisis completadas aparecerán aquí';

  @override
  String get settingsTitle => 'Configuración';

  @override
  String get appearanceSection => 'Apariencia';

  @override
  String get themeLabel => 'Tema';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get defaultsSection => 'Valores predeterminados';

  @override
  String get volumeUnitLabel => 'Unidad de volumen';

  @override
  String get volumeUnitMl => 'mL';

  @override
  String get volumeUnitLiters => 'Litros';

  @override
  String get defaultPpmLabel => 'PPM predeterminado';

  @override
  String get defaultCurrentLabel => 'Corriente predeterminada';

  @override
  String get typicalCurrentRange => 'Rango típico: 0,5–3 mA';

  @override
  String get electrodeCleaningSection => 'Alarma de limpieza de electrodos';

  @override
  String get enableCleaningAlarmLabel => 'Activar alarma de limpieza';

  @override
  String get enableCleaningAlarmSubtitle =>
      'Le recuerda limpiar los electrodos durante una sesión';

  @override
  String get cleaningIntervalLabel => 'Intervalo de limpieza';

  @override
  String get cleaningIntervalSubtitle =>
      'Con qué frecuencia recibir recordatorios';

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
  String get notificationsSection => 'Notificaciones';

  @override
  String get enableNotificationsLabel => 'Activar notificaciones';

  @override
  String get enableNotificationsSubtitle =>
      'Alerta cuando la electrólisis esté completa';

  @override
  String get aboutSection => 'Acerca de';

  @override
  String get calculationFormulaTitle => 'Fórmula de cálculo';

  @override
  String get calculationFormulaBody =>
      'Basado en la Ley de Faraday de la Electrólisis:\n\ntiempo (s) = (PPM × Volumen (L) × F) / (M_ag × I (A) × 1000)\n\ndonde:\n  F = 96.485 C/mol (constante de Faraday)\n  M_ag = 107,87 g/mol (masa molar de la plata)\n  I = corriente en amperios\n  PPM = concentración objetivo en mg/L';

  @override
  String get versionLabel => 'Versión';

  @override
  String get maSuffix => 'mA';

  @override
  String get navCalculator => 'Calculadora';

  @override
  String get navTimer => 'Temporizador';

  @override
  String get navHistory => 'Historial';

  @override
  String get notifCompleteTitle => '¡SilverTimer completado!';

  @override
  String get notifCompleteBody =>
      'Su electrólisis de plata coloidal ha finalizado.';

  @override
  String get notifCleanTitle => 'Limpiar electrodos';

  @override
  String notifCleanBody(int alarmNumber) {
    return 'Es hora de limpiar sus electrodos (alarma #$alarmNumber).';
  }

  @override
  String get notifChannelDescription =>
      'Notificaciones de finalización de electrólisis SilverTimer';
}
