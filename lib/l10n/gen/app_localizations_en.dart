// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get navHome => 'Home';

  @override
  String get navStats => 'Stats';

  @override
  String get navFamily => 'Family';

  @override
  String get navMe => 'Me';

  @override
  String get sippyFresh => 'Sippy looks fresh';

  @override
  String get sippyHappy => 'Sippy is happy';

  @override
  String get sippyThirsty => 'Sippy is a little thirsty';

  @override
  String get sippyTired => 'Sippy is tired';

  @override
  String get sippySleeping => 'Sippy is sleeping';

  @override
  String get sippyCelebrating => 'Sippy is celebrating';

  @override
  String get sippyWaiting => 'Sippy is waiting patiently';

  @override
  String get fabLogLabel => 'Log drink';

  @override
  String get statusHydrated => 'Hydrated';

  @override
  String get statusThirsty => 'Getting thirsty';

  @override
  String get statusBehind => 'Behind';

  @override
  String get undo => 'Undo';

  @override
  String get adLabel => 'Ad';

  @override
  String get adOptions => 'Ad options';

  @override
  String get adReport => 'Report ad';

  @override
  String quotaLeft(int count) {
    return '$count left';
  }

  @override
  String quotaResets(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.MMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Resets $dateString';
  }

  @override
  String progressGlassLabel(String percent) {
    return 'Glass $percent full';
  }

  @override
  String get medicalDisclaimer =>
      'One More Sip is not a medical device. For questions about your health, talk to your doctor.';

  @override
  String get restrictionQuestion =>
      'Has a doctor limited how much you can drink?';

  @override
  String get restrictionYes => 'Yes';

  @override
  String get restrictionNo => 'No';

  @override
  String get restrictionLimitLabel => 'Daily limit (ml)';

  @override
  String get restrictionHint => 'Use the exact amount your doctor gave you.';

  @override
  String get restrictionReassurance =>
      'We\'ll never ask you to drink more than this.';

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

    return 'Enter $minString–$maxString ml, in steps of $step ml.';
  }

  @override
  String restrictionDecrease(int step) {
    return 'Decrease by $step ml';
  }

  @override
  String restrictionIncrease(int step) {
    return 'Increase by $step ml';
  }

  @override
  String get overDrinkingHourlyTitle => 'That\'s a lot in one hour.';

  @override
  String get overDrinkingHourlyBody => 'Take it easy — sip slowly.';

  @override
  String get overDrinkingDailyTitle => 'That\'s a lot for one day.';

  @override
  String get overDrinkingDailyBody =>
      'Go easy for the rest of today. Talk to a doctor if you often feel very thirsty.';

  @override
  String get logSheetTitle => 'Add a drink';

  @override
  String get logRecentDrinks => 'Recent drinks';

  @override
  String get logAllDrinks => 'All drinks';

  @override
  String get logAmount => 'Amount';

  @override
  String logVolumeMl(int volume) {
    final intl.NumberFormat volumeNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String volumeString = volumeNumberFormat.format(volume);

    return '$volumeString ml';
  }

  @override
  String get logCustom => 'Custom';

  @override
  String get logCustomAmount => 'Custom amount';

  @override
  String logDecrease(int step) {
    return 'Decrease by $step ml';
  }

  @override
  String logIncrease(int step) {
    return 'Increase by $step ml';
  }

  @override
  String logCountsAs(int counted) {
    final intl.NumberFormat countedNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countedString = countedNumberFormat.format(counted);

    return 'Counts as $countedString ml';
  }

  @override
  String logCountsAsWithSugar(int counted, int sugar) {
    final intl.NumberFormat countedNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countedString = countedNumberFormat.format(counted);

    return 'Counts as $countedString ml · $sugar g sugar';
  }

  @override
  String get drinkNotCounted => 'Logged, not counted';

  @override
  String get logAddButton => 'Add drink';

  @override
  String logAdded(int volume, String drink) {
    final intl.NumberFormat volumeNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String volumeString = volumeNumberFormat.format(volume);

    return 'Added $volumeString ml $drink';
  }

  @override
  String get logLoadError => 'Couldn\'t load your drinks. Close and try again.';

  @override
  String get pickerTitle => 'Choose a drink';

  @override
  String get pickerSearch => 'Search drinks';

  @override
  String get pickerCategoryAll => 'All';

  @override
  String get drinkCategoryWater => 'Water';

  @override
  String get drinkCategoryCoconut => 'Coconut';

  @override
  String get drinkCategoryCoffee => 'Coffee';

  @override
  String get drinkCategoryTea => 'Tea';

  @override
  String get drinkCategoryDairy => 'Milk';

  @override
  String get drinkCategoryPlantMilk => 'Plant milk';

  @override
  String get drinkCategoryJuice => 'Juice';

  @override
  String get drinkCategorySmoothie => 'Smoothie';

  @override
  String get drinkCategorySoda => 'Soda';

  @override
  String get drinkCategorySports => 'Sports';

  @override
  String get drinkCategoryEnergy => 'Energy';

  @override
  String get drinkCategoryTraditional => 'Traditional';

  @override
  String get drinkCategoryAlcohol => 'Alcohol';

  @override
  String get pickerAlcoholNote =>
      'Alcohol is logged for your records but never counts toward your water goal.';

  @override
  String pickerPerGlass(int volume) {
    return 'Sugar and caffeine per $volume ml glass · values are estimates';
  }

  @override
  String drinkSugarBadge(int grams) {
    return '$grams g sugar';
  }

  @override
  String drinkCaffeineBadge(int mg) {
    return '$mg mg caffeine';
  }

  @override
  String pickerNoResults(String query) {
    return 'No drink called “$query” yet.';
  }
}
