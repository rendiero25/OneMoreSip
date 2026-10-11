// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get navHome => 'Beranda';

  @override
  String get navStats => 'Statistik';

  @override
  String get navFamily => 'Keluarga';

  @override
  String get navMe => 'Saya';

  @override
  String get sippyFresh => 'Sippy terlihat segar';

  @override
  String get sippyHappy => 'Sippy senang';

  @override
  String get sippyThirsty => 'Sippy agak haus';

  @override
  String get sippyTired => 'Sippy lemas';

  @override
  String get sippySleeping => 'Sippy sedang tidur';

  @override
  String get sippyCelebrating => 'Sippy sedang merayakan';

  @override
  String get sippyWaiting => 'Sippy menunggu dengan sabar';

  @override
  String get fabLogLabel => 'Catat minuman';

  @override
  String get statusHydrated => 'Terhidrasi';

  @override
  String get statusThirsty => 'Mulai haus';

  @override
  String get statusBehind => 'Tertinggal';

  @override
  String get undo => 'Urungkan';

  @override
  String get adLabel => 'Iklan';

  @override
  String get adOptions => 'Opsi iklan';

  @override
  String get adReport => 'Laporkan iklan';

  @override
  String quotaLeft(int count) {
    return 'Sisa $count';
  }

  @override
  String quotaResets(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.MMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Direset $dateString';
  }

  @override
  String progressGlassLabel(String percent) {
    return 'Gelas terisi $percent';
  }
}
