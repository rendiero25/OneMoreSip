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

  @override
  String get medicalDisclaimer =>
      'One More Sip bukan alat medis. Untuk pertanyaan tentang kesehatanmu, bicarakan dengan doktermu.';

  @override
  String get restrictionQuestion =>
      'Apakah dokter membatasi berapa banyak kamu boleh minum?';

  @override
  String get restrictionYes => 'Ya';

  @override
  String get restrictionNo => 'Tidak';

  @override
  String get restrictionLimitLabel => 'Batas harian (ml)';

  @override
  String get restrictionHint => 'Gunakan angka persis dari doktermu.';

  @override
  String get restrictionReassurance =>
      'Kami tidak akan pernah memintamu minum lebih dari ini.';

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

    return 'Masukkan $minString–$maxString ml, kelipatan $step ml.';
  }

  @override
  String restrictionDecrease(int step) {
    return 'Kurangi $step ml';
  }

  @override
  String restrictionIncrease(int step) {
    return 'Tambah $step ml';
  }

  @override
  String get overDrinkingHourlyTitle => 'Itu cukup banyak dalam satu jam.';

  @override
  String get overDrinkingHourlyBody => 'Santai saja — minum pelan-pelan.';

  @override
  String get overDrinkingDailyTitle => 'Itu cukup banyak untuk satu hari.';

  @override
  String get overDrinkingDailyBody =>
      'Pelan-pelan saja untuk sisa hari ini. Bicarakan dengan dokter jika kamu sering merasa sangat haus.';
}
