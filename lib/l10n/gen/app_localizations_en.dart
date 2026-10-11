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
}
