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
}
