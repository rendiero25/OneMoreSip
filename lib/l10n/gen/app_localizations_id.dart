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

  @override
  String get logSheetTitle => 'Tambah minuman';

  @override
  String get logRecentDrinks => 'Minuman terakhir';

  @override
  String get logAllDrinks => 'Semua minuman';

  @override
  String get logAmount => 'Jumlah';

  @override
  String logVolumeMl(int volume) {
    final intl.NumberFormat volumeNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String volumeString = volumeNumberFormat.format(volume);

    return '$volumeString ml';
  }

  @override
  String get logCustom => 'Atur sendiri';

  @override
  String get logCustomAmount => 'Jumlah sendiri';

  @override
  String logDecrease(int step) {
    return 'Kurangi $step ml';
  }

  @override
  String logIncrease(int step) {
    return 'Tambah $step ml';
  }

  @override
  String logCountsAs(int counted) {
    final intl.NumberFormat countedNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countedString = countedNumberFormat.format(counted);

    return 'Dihitung $countedString ml';
  }

  @override
  String logCountsAsWithSugar(int counted, int sugar) {
    final intl.NumberFormat countedNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countedString = countedNumberFormat.format(counted);

    return 'Dihitung $countedString ml · $sugar g gula';
  }

  @override
  String get drinkNotCounted => 'Dicatat, tidak dihitung';

  @override
  String get logAddButton => 'Tambahkan';

  @override
  String logAdded(int volume, String drink) {
    final intl.NumberFormat volumeNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String volumeString = volumeNumberFormat.format(volume);

    return '$volumeString ml $drink ditambahkan';
  }

  @override
  String get logLoadError => 'Gagal memuat minumanmu. Tutup lalu coba lagi.';

  @override
  String get pickerTitle => 'Pilih minuman';

  @override
  String get pickerSearch => 'Cari minuman';

  @override
  String get pickerCategoryAll => 'Semua';

  @override
  String get drinkCategoryWater => 'Air';

  @override
  String get drinkCategoryCoconut => 'Kelapa';

  @override
  String get drinkCategoryCoffee => 'Kopi';

  @override
  String get drinkCategoryTea => 'Teh';

  @override
  String get drinkCategoryDairy => 'Susu';

  @override
  String get drinkCategoryPlantMilk => 'Susu nabati';

  @override
  String get drinkCategoryJuice => 'Jus';

  @override
  String get drinkCategorySmoothie => 'Smoothie';

  @override
  String get drinkCategorySoda => 'Bersoda';

  @override
  String get drinkCategorySports => 'Isotonik';

  @override
  String get drinkCategoryEnergy => 'Energi';

  @override
  String get drinkCategoryTraditional => 'Tradisional';

  @override
  String get drinkCategoryAlcohol => 'Alkohol';

  @override
  String get pickerAlcoholNote =>
      'Alkohol dicatat untuk riwayatmu, tapi tidak pernah dihitung untuk target minum air.';

  @override
  String pickerPerGlass(int volume) {
    return 'Gula dan kafein per gelas $volume ml · nilai berupa perkiraan';
  }

  @override
  String drinkSugarBadge(int grams) {
    return '$grams g gula';
  }

  @override
  String drinkCaffeineBadge(int mg) {
    return '$mg mg kafein';
  }

  @override
  String pickerNoResults(String query) {
    return 'Belum ada minuman bernama “$query”.';
  }
}
