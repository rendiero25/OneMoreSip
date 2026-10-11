// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get navHome => 'Inicio';

  @override
  String get navStats => 'Estadísticas';

  @override
  String get navFamily => 'Familia';

  @override
  String get navMe => 'Yo';

  @override
  String get sippyFresh => 'Sippy tiene energía';

  @override
  String get sippyHappy => 'Sippy está feliz';

  @override
  String get sippyThirsty => 'Sippy tiene un poco de sed';

  @override
  String get sippyTired => 'Sippy no tiene energía';

  @override
  String get sippySleeping => 'Sippy duerme';

  @override
  String get sippyCelebrating => 'Sippy celebra';

  @override
  String get sippyWaiting => 'Sippy espera con paciencia';

  @override
  String get fabLogLabel => 'Registrar bebida';

  @override
  String get statusHydrated => 'Hidratado';

  @override
  String get statusThirsty => 'Con algo de sed';

  @override
  String get statusBehind => 'Atrasado';

  @override
  String get undo => 'Deshacer';

  @override
  String get adLabel => 'Anuncio';

  @override
  String get adOptions => 'Opciones del anuncio';

  @override
  String get adReport => 'Denunciar anuncio';

  @override
  String quotaLeft(int count) {
    return 'Quedan $count';
  }

  @override
  String quotaResets(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.MMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Se reinicia el $dateString';
  }

  @override
  String progressGlassLabel(String percent) {
    return 'Vaso lleno al $percent';
  }

  @override
  String get medicalDisclaimer =>
      'One More Sip no es un dispositivo médico. Si tienes preguntas sobre tu salud, habla con tu médico.';

  @override
  String get restrictionQuestion =>
      '¿Un médico te ha limitado cuánto puedes beber?';

  @override
  String get restrictionYes => 'Sí';

  @override
  String get restrictionNo => 'No';

  @override
  String get restrictionLimitLabel => 'Límite diario (ml)';

  @override
  String get restrictionHint =>
      'Usa la cantidad exacta que te indicó tu médico.';

  @override
  String get restrictionReassurance =>
      'Nunca te pediremos que bebas más que esto.';

  @override
  String restrictionInvalid(int min, int max, int step) {
    final intl.NumberFormat minNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String minString = minNumberFormat.format(min);
    final intl.NumberFormat maxNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String maxString = maxNumberFormat.format(max);

    return 'Introduce de $minString a $maxString ml, en pasos de $step ml.';
  }

  @override
  String restrictionDecrease(int step) {
    return 'Bajar $step ml';
  }

  @override
  String restrictionIncrease(int step) {
    return 'Subir $step ml';
  }

  @override
  String get overDrinkingHourlyTitle => 'Es mucho para una hora.';

  @override
  String get overDrinkingHourlyBody => 'Con calma: bebe despacio.';

  @override
  String get overDrinkingDailyTitle => 'Es mucho para un día.';

  @override
  String get overDrinkingDailyBody =>
      'Tómatelo con calma el resto del día. Habla con un médico si a menudo sientes mucha sed.';
}
