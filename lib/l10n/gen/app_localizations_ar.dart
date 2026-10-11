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
}
