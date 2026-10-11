// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get navHome => 'Início';

  @override
  String get navStats => 'Estatísticas';

  @override
  String get navFamily => 'Família';

  @override
  String get navMe => 'Eu';

  @override
  String get sippyFresh => 'Sippy está com energia';

  @override
  String get sippyHappy => 'Sippy está feliz';

  @override
  String get sippyThirsty => 'Sippy está com um pouco de sede';

  @override
  String get sippyTired => 'Sippy está sem energia';

  @override
  String get sippySleeping => 'Sippy está dormindo';

  @override
  String get sippyCelebrating => 'Sippy está comemorando';

  @override
  String get sippyWaiting => 'Sippy espera com paciência';

  @override
  String get fabLogLabel => 'Registrar bebida';

  @override
  String get statusHydrated => 'Hidratado';

  @override
  String get statusThirsty => 'Com um pouco de sede';

  @override
  String get statusBehind => 'Atrasado';

  @override
  String get undo => 'Desfazer';

  @override
  String get adLabel => 'Anúncio';

  @override
  String get adOptions => 'Opções do anúncio';

  @override
  String get adReport => 'Denunciar anúncio';

  @override
  String quotaLeft(int count) {
    return 'Restam $count';
  }

  @override
  String quotaResets(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.MMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Reinicia em $dateString';
  }

  @override
  String progressGlassLabel(String percent) {
    return 'Copo $percent cheio';
  }

  @override
  String get medicalDisclaimer =>
      'One More Sip não é um dispositivo médico. Se tiver dúvidas sobre sua saúde, fale com seu médico.';

  @override
  String get restrictionQuestion => 'Um médico limitou quanto você pode beber?';

  @override
  String get restrictionYes => 'Sim';

  @override
  String get restrictionNo => 'Não';

  @override
  String get restrictionLimitLabel => 'Limite diário (ml)';

  @override
  String get restrictionHint => 'Use o valor exato que seu médico informou.';

  @override
  String get restrictionReassurance =>
      'Nunca vamos pedir que você beba mais do que isso.';

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

    return 'Digite de $minString a $maxString ml, em passos de $step ml.';
  }

  @override
  String restrictionDecrease(int step) {
    return 'Diminuir $step ml';
  }

  @override
  String restrictionIncrease(int step) {
    return 'Aumentar $step ml';
  }

  @override
  String get overDrinkingHourlyTitle => 'Isso é muito para uma hora.';

  @override
  String get overDrinkingHourlyBody => 'Com calma: beba devagar.';

  @override
  String get overDrinkingDailyTitle => 'Isso é muito para um dia.';

  @override
  String get overDrinkingDailyBody =>
      'Vá com calma pelo resto do dia. Fale com um médico se você costuma sentir muita sede.';

  @override
  String get logSheetTitle => 'Adicionar uma bebida';

  @override
  String get logRecentDrinks => 'Bebidas recentes';

  @override
  String get logAllDrinks => 'Todas as bebidas';

  @override
  String get logAmount => 'Quantidade';

  @override
  String logVolumeMl(int volume) {
    final intl.NumberFormat volumeNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String volumeString = volumeNumberFormat.format(volume);

    return '$volumeString ml';
  }

  @override
  String get logCustom => 'Outra';

  @override
  String get logCustomAmount => 'Quantidade personalizada';

  @override
  String logDecrease(int step) {
    return 'Diminuir $step ml';
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

    return 'Conta como $countedString ml';
  }

  @override
  String logCountsAsWithSugar(int counted, int sugar) {
    final intl.NumberFormat countedNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countedString = countedNumberFormat.format(counted);

    return 'Conta como $countedString ml · $sugar g de açúcar';
  }

  @override
  String get drinkNotCounted => 'Registrado, não conta';

  @override
  String get logAddButton => 'Adicionar bebida';

  @override
  String logAdded(int volume, String drink) {
    final intl.NumberFormat volumeNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String volumeString = volumeNumberFormat.format(volume);

    return 'Adicionado: $volumeString ml de $drink';
  }

  @override
  String get logLoadError =>
      'Não foi possível carregar suas bebidas. Feche e tente de novo.';

  @override
  String get pickerTitle => 'Escolha uma bebida';

  @override
  String get pickerSearch => 'Buscar bebidas';

  @override
  String get pickerCategoryAll => 'Todas';

  @override
  String get drinkCategoryWater => 'Água';

  @override
  String get drinkCategoryCoconut => 'Coco';

  @override
  String get drinkCategoryCoffee => 'Café';

  @override
  String get drinkCategoryTea => 'Chá';

  @override
  String get drinkCategoryDairy => 'Leite';

  @override
  String get drinkCategoryPlantMilk => 'Bebida vegetal';

  @override
  String get drinkCategoryJuice => 'Suco';

  @override
  String get drinkCategorySmoothie => 'Smoothie';

  @override
  String get drinkCategorySoda => 'Refrigerante';

  @override
  String get drinkCategorySports => 'Isotônicos';

  @override
  String get drinkCategoryEnergy => 'Energéticos';

  @override
  String get drinkCategoryTraditional => 'Tradicionais';

  @override
  String get drinkCategoryAlcohol => 'Álcool';

  @override
  String get pickerAlcoholNote =>
      'O álcool fica registrado no seu histórico, mas nunca conta para sua meta de água.';

  @override
  String pickerPerGlass(int volume) {
    return 'Açúcar e cafeína por copo de $volume ml · valores estimados';
  }

  @override
  String drinkSugarBadge(int grams) {
    return '$grams g de açúcar';
  }

  @override
  String drinkCaffeineBadge(int mg) {
    return '$mg mg de cafeína';
  }

  @override
  String pickerNoResults(String query) {
    return 'Ainda não há bebida chamada “$query”.';
  }
}
