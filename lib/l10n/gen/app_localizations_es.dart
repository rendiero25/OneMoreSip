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

  @override
  String get logSheetTitle => 'Añadir una bebida';

  @override
  String get logRecentDrinks => 'Bebidas recientes';

  @override
  String get logAllDrinks => 'Todas las bebidas';

  @override
  String get logAmount => 'Cantidad';

  @override
  String logVolumeMl(int volume) {
    final intl.NumberFormat volumeNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String volumeString = volumeNumberFormat.format(volume);

    return '$volumeString ml';
  }

  @override
  String get logCustom => 'Otra';

  @override
  String get logCustomAmount => 'Cantidad personalizada';

  @override
  String logDecrease(int step) {
    return 'Reducir $step ml';
  }

  @override
  String logIncrease(int step) {
    return 'Aumentar $step ml';
  }

  @override
  String logCountsAs(int counted) {
    final intl.NumberFormat countedNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countedString = countedNumberFormat.format(counted);

    return 'Cuenta como $countedString ml';
  }

  @override
  String logCountsAsWithSugar(int counted, int sugar) {
    final intl.NumberFormat countedNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countedString = countedNumberFormat.format(counted);

    return 'Cuenta como $countedString ml · $sugar g de azúcar';
  }

  @override
  String get drinkNotCounted => 'Registrado, no cuenta';

  @override
  String get logAddButton => 'Añadir bebida';

  @override
  String logAdded(int volume, String drink) {
    final intl.NumberFormat volumeNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String volumeString = volumeNumberFormat.format(volume);

    return 'Añadido: $volumeString ml de $drink';
  }

  @override
  String get logLoadError =>
      'No se pudieron cargar tus bebidas. Cierra e inténtalo de nuevo.';

  @override
  String get pickerTitle => 'Elige una bebida';

  @override
  String get pickerSearch => 'Buscar bebidas';

  @override
  String get pickerCategoryAll => 'Todas';

  @override
  String get drinkCategoryWater => 'Agua';

  @override
  String get drinkCategoryCoconut => 'Coco';

  @override
  String get drinkCategoryCoffee => 'Café';

  @override
  String get drinkCategoryTea => 'Té';

  @override
  String get drinkCategoryDairy => 'Leche';

  @override
  String get drinkCategoryPlantMilk => 'Bebida vegetal';

  @override
  String get drinkCategoryJuice => 'Jugo';

  @override
  String get drinkCategorySmoothie => 'Batido';

  @override
  String get drinkCategorySoda => 'Refresco';

  @override
  String get drinkCategorySports => 'Isotónicas';

  @override
  String get drinkCategoryEnergy => 'Energéticas';

  @override
  String get drinkCategoryTraditional => 'Tradicionales';

  @override
  String get drinkCategoryAlcohol => 'Alcohol';

  @override
  String get pickerAlcoholNote =>
      'El alcohol se registra en tu historial, pero nunca cuenta para tu meta de agua.';

  @override
  String pickerPerGlass(int volume) {
    return 'Azúcar y cafeína por vaso de $volume ml · valores estimados';
  }

  @override
  String drinkSugarBadge(int grams) {
    return '$grams g de azúcar';
  }

  @override
  String drinkCaffeineBadge(int mg) {
    return '$mg mg de cafeína';
  }

  @override
  String pickerNoResults(String query) {
    return 'Aún no hay ninguna bebida llamada “$query”.';
  }

  @override
  String get historyTitle => 'Historial';

  @override
  String get historyToday => 'Hoy';

  @override
  String get historyYesterday => 'Ayer';

  @override
  String historyDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.MMMEd(localeName);
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }

  @override
  String historyDayTotal(int total, int goal) {
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);
    final intl.NumberFormat goalNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String goalString = goalNumberFormat.format(goal);

    return '$totalString / $goalString ml';
  }

  @override
  String historyDayTotalLimit(int total, int limit) {
    final intl.NumberFormat totalNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String totalString = totalNumberFormat.format(total);
    final intl.NumberFormat limitNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String limitString = limitNumberFormat.format(limit);

    return '$totalString / límite de $limitString ml';
  }

  @override
  String get historyGoalMet => 'Meta cumplida';

  @override
  String get historyNoDrinksToday => 'Aún no has registrado bebidas hoy.';

  @override
  String historyVolume(int volume) {
    final intl.NumberFormat volumeNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String volumeString = volumeNumberFormat.format(volume);

    return '$volumeString ml';
  }

  @override
  String historyCounts(int ml) {
    final intl.NumberFormat mlNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String mlString = mlNumberFormat.format(ml);

    return 'Cuenta $mlString ml';
  }

  @override
  String get historyNotCounted => 'Registrada, no cuenta';

  @override
  String get historyUnknownDrink => 'Bebida';

  @override
  String historyEditLog(String drink, String time) {
    return 'Editar $drink a las $time';
  }

  @override
  String historyDeleteLog(String drink, String time) {
    return 'Eliminar $drink a las $time';
  }

  @override
  String get historyDeleted => 'Bebida eliminada';

  @override
  String get historyEditTitle => 'Editar bebida';

  @override
  String get historyEditDrinkLabel => 'Bebida';

  @override
  String get historyEditChangeDrink => 'Cambiar bebida';

  @override
  String get historyEditSearch => 'Buscar bebidas';

  @override
  String get historyEditAmount => 'Cantidad';

  @override
  String historyEditDecrease(int step) {
    return 'Restar $step ml';
  }

  @override
  String historyEditIncrease(int step) {
    return 'Sumar $step ml';
  }

  @override
  String get historyEditTime => 'Hora';

  @override
  String get historyEditSave => 'Guardar';

  @override
  String get notificationChannelReminders => 'Recordatorios para beber';

  @override
  String get notificationChannelRemindersDescription =>
      'Recordatorios de Sippy a lo largo del día.';

  @override
  String get notificationChannelProgress => 'Progreso';

  @override
  String get notificationChannelProgressDescription =>
      'El progreso de hoy como notificación continua.';

  @override
  String get notificationChannelFamily => 'Alertas familiares';

  @override
  String get notificationChannelFamilyDescription =>
      'Novedades sobre los familiares que cuidas.';

  @override
  String get notificationChannelWeather => 'Cambios de meta por el clima';

  @override
  String get notificationChannelWeatherDescription =>
      'Cuando el clima de hoy cambia tu meta, como máximo una vez al día.';

  @override
  String get notificationChannelInsights => 'Logros y resúmenes';

  @override
  String get notificationChannelInsightsDescription =>
      'Rachas, logros y tu resumen semanal.';

  @override
  String get notificationChannelPromotions => 'Promociones';

  @override
  String get notificationChannelPromotionsDescription =>
      'Ofertas y novedades. Desactivadas salvo que las actives.';

  @override
  String get reminderNotificationTitle => 'Un mensaje de Sippy';

  @override
  String get reminderNotificationBody =>
      'Solo pasaba a saludar. Registra una bebida cuando tomes una.';

  @override
  String nudgeReminderNotificationBody(int ml) {
    final intl.NumberFormat mlNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String mlString = mlNumberFormat.format(ml);

    return 'Es hora de unos $mlString ml. ¡Tú puedes!';
  }
}
