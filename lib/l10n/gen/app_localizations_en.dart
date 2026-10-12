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

  @override
  String get historyTitle => 'History';

  @override
  String get historyToday => 'Today';

  @override
  String get historyYesterday => 'Yesterday';

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

    return '$totalString / $limitString ml limit';
  }

  @override
  String get historyGoalMet => 'Goal met';

  @override
  String get historyNoDrinksToday => 'No drinks logged yet today.';

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

    return 'Counts $mlString ml';
  }

  @override
  String get historyNotCounted => 'Logged, not counted';

  @override
  String get historyUnknownDrink => 'Drink';

  @override
  String historyEditLog(String drink, String time) {
    return 'Edit $drink at $time';
  }

  @override
  String historyDeleteLog(String drink, String time) {
    return 'Delete $drink at $time';
  }

  @override
  String get historyDeleted => 'Drink deleted';

  @override
  String get historyEditTitle => 'Edit drink';

  @override
  String get historyEditDrinkLabel => 'Drink';

  @override
  String get historyEditChangeDrink => 'Change drink';

  @override
  String get historyEditSearch => 'Search drinks';

  @override
  String get historyEditAmount => 'Amount';

  @override
  String historyEditDecrease(int step) {
    return 'Decrease by $step ml';
  }

  @override
  String historyEditIncrease(int step) {
    return 'Increase by $step ml';
  }

  @override
  String get historyEditTime => 'Time';

  @override
  String get historyEditSave => 'Save';

  @override
  String get notificationChannelReminders => 'Drink reminders';

  @override
  String get notificationChannelRemindersDescription =>
      'Reminders from Sippy across your day.';

  @override
  String get notificationChannelProgress => 'Progress';

  @override
  String get notificationChannelProgressDescription =>
      'Today\'s progress as an ongoing notification.';

  @override
  String get notificationChannelFamily => 'Family alerts';

  @override
  String get notificationChannelFamilyDescription =>
      'Updates about the family members you care for.';

  @override
  String get notificationChannelWeather => 'Weather goal changes';

  @override
  String get notificationChannelWeatherDescription =>
      'When today\'s weather changes your goal, at most once a day.';

  @override
  String get notificationChannelInsights => 'Achievements & insights';

  @override
  String get notificationChannelInsightsDescription =>
      'Streaks, achievements and your weekly insight.';

  @override
  String get notificationChannelPromotions => 'Promotions';

  @override
  String get notificationChannelPromotionsDescription =>
      'Offers and news. Off unless you turn them on.';

  @override
  String get reminderNotificationTitle => 'A note from Sippy';

  @override
  String get reminderNotificationBody =>
      'A gentle check-in. Log a drink whenever you have one.';

  @override
  String nudgeReminderNotificationBody(int ml) {
    final intl.NumberFormat mlNumberFormat = intl.NumberFormat.decimalPattern(
      localeName,
    );
    final String mlString = mlNumberFormat.format(ml);

    return 'Time for about $mlString ml. You\'ve got this!';
  }
}
