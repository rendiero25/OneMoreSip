// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get navHome => 'الرئيسية';

  @override
  String get navStats => 'الإحصاءات';

  @override
  String get navFamily => 'العائلة';

  @override
  String get navMe => 'أنا';

  @override
  String get sippyFresh => 'سيبي يبدو منتعشًا';

  @override
  String get sippyHappy => 'سيبي سعيد';

  @override
  String get sippyThirsty => 'سيبي عطشان قليلًا';

  @override
  String get sippyTired => 'سيبي متعب';

  @override
  String get sippySleeping => 'سيبي نائم';

  @override
  String get sippyCelebrating => 'سيبي يحتفل';

  @override
  String get sippyWaiting => 'سيبي ينتظر بصبر';

  @override
  String get fabLogLabel => 'سجّل مشروبًا';

  @override
  String get statusHydrated => 'مرتوٍ';

  @override
  String get statusThirsty => 'بدأ العطش';

  @override
  String get statusBehind => 'متأخر';

  @override
  String get undo => 'تراجع';

  @override
  String get adLabel => 'إعلان';

  @override
  String get adOptions => 'خيارات الإعلان';

  @override
  String get adReport => 'الإبلاغ عن الإعلان';

  @override
  String quotaLeft(int count) {
    return 'متبقٍ $count';
  }

  @override
  String quotaResets(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.MMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'يُجدَّد $dateString';
  }

  @override
  String progressGlassLabel(String percent) {
    return 'الكوب ممتلئ بنسبة $percent';
  }

  @override
  String get medicalDisclaimer =>
      'One More Sip ليس جهازًا طبيًا. إذا كانت لديك أسئلة عن صحتك، تحدّث إلى طبيبك.';

  @override
  String get restrictionQuestion => 'هل حدّد لك طبيب كمية ما يمكنك شربه؟';

  @override
  String get restrictionYes => 'نعم';

  @override
  String get restrictionNo => 'لا';

  @override
  String get restrictionLimitLabel => 'الحد اليومي (مل)';

  @override
  String get restrictionHint => 'استخدم القيمة الدقيقة التي أعطاك إياها طبيبك.';

  @override
  String get restrictionReassurance => 'لن نطلب منك أبدًا أن تشرب أكثر من ذلك.';

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

    return 'أدخل من $minString إلى $maxString مل، بخطوات $step مل.';
  }

  @override
  String restrictionDecrease(int step) {
    return 'إنقاص $step مل';
  }

  @override
  String restrictionIncrease(int step) {
    return 'زيادة $step مل';
  }

  @override
  String get overDrinkingHourlyTitle => 'هذه كمية كبيرة في ساعة واحدة.';

  @override
  String get overDrinkingHourlyBody => 'على مهلك، اشرب ببطء.';

  @override
  String get overDrinkingDailyTitle => 'هذه كمية كبيرة ليوم واحد.';

  @override
  String get overDrinkingDailyBody =>
      'خفّف لبقية اليوم. تحدّث إلى طبيب إذا كنت تشعر بعطش شديد كثيرًا.';

  @override
  String get logSheetTitle => 'أضف مشروبًا';

  @override
  String get logRecentDrinks => 'المشروبات الأخيرة';

  @override
  String get logAllDrinks => 'كل المشروبات';

  @override
  String get logAmount => 'الكمية';

  @override
  String logVolumeMl(int volume) {
    final intl.NumberFormat volumeNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String volumeString = volumeNumberFormat.format(volume);

    return '$volumeString مل';
  }

  @override
  String get logCustom => 'مخصص';

  @override
  String get logCustomAmount => 'كمية مخصصة';

  @override
  String logDecrease(int step) {
    return 'إنقاص $step مل';
  }

  @override
  String logIncrease(int step) {
    return 'زيادة $step مل';
  }

  @override
  String logCountsAs(int counted) {
    final intl.NumberFormat countedNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countedString = countedNumberFormat.format(counted);

    return 'يُحتسب $countedString مل';
  }

  @override
  String logCountsAsWithSugar(int counted, int sugar) {
    final intl.NumberFormat countedNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countedString = countedNumberFormat.format(counted);

    return 'يُحتسب $countedString مل · $sugar غ سكر';
  }

  @override
  String get drinkNotCounted => 'مُسجَّل، لا يُحتسب';

  @override
  String get logAddButton => 'أضف المشروب';

  @override
  String logAdded(int volume, String drink) {
    final intl.NumberFormat volumeNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String volumeString = volumeNumberFormat.format(volume);

    return 'تمت إضافة $volumeString مل من $drink';
  }

  @override
  String get logLoadError => 'تعذّر تحميل مشروباتك. أغلق وحاول مرة أخرى.';

  @override
  String get pickerTitle => 'اختر مشروبًا';

  @override
  String get pickerSearch => 'ابحث عن مشروب';

  @override
  String get pickerCategoryAll => 'الكل';

  @override
  String get drinkCategoryWater => 'ماء';

  @override
  String get drinkCategoryCoconut => 'جوز الهند';

  @override
  String get drinkCategoryCoffee => 'قهوة';

  @override
  String get drinkCategoryTea => 'شاي';

  @override
  String get drinkCategoryDairy => 'حليب';

  @override
  String get drinkCategoryPlantMilk => 'حليب نباتي';

  @override
  String get drinkCategoryJuice => 'عصير';

  @override
  String get drinkCategorySmoothie => 'سموذي';

  @override
  String get drinkCategorySoda => 'مشروبات غازية';

  @override
  String get drinkCategorySports => 'رياضية';

  @override
  String get drinkCategoryEnergy => 'طاقة';

  @override
  String get drinkCategoryTraditional => 'تقليدية';

  @override
  String get drinkCategoryAlcohol => 'كحول';

  @override
  String get pickerAlcoholNote =>
      'يُسجَّل الكحول في سجلّك لكنه لا يُحتسب أبدًا ضمن هدف الماء.';

  @override
  String pickerPerGlass(int volume) {
    return 'السكر والكافيين لكل كوب $volume مل · القيم تقديرية';
  }

  @override
  String drinkSugarBadge(int grams) {
    return '$grams غ سكر';
  }

  @override
  String drinkCaffeineBadge(int mg) {
    return '$mg ملغ كافيين';
  }

  @override
  String pickerNoResults(String query) {
    return 'لا يوجد مشروب باسم “$query” بعد.';
  }
}
