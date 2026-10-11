// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get navHome => 'Inicio';

  @override
  String get navStats => 'Estadísticas';

  @override
  String get navFamily => 'Familia';

  @override
  String get navMe => 'Yo';

  @override
  String get sippyFresh => 'Sippy tiene energía';

  @override
  String get sippyHappy => 'Sippy está feliz';

  @override
  String get sippyThirsty => 'Sippy tiene un poco de sed';

  @override
  String get sippyTired => 'Sippy no tiene energía';

  @override
  String get sippySleeping => 'Sippy duerme';

  @override
  String get sippyCelebrating => 'Sippy celebra';

  @override
  String get sippyWaiting => 'Sippy espera con paciencia';

  @override
  String get fabLogLabel => 'Registrar bebida';

  @override
  String get statusHydrated => 'Hidratado';

  @override
  String get statusThirsty => 'Con algo de sed';

  @override
  String get statusBehind => 'Atrasado';

  @override
  String get undo => 'Deshacer';

  @override
  String get adLabel => 'Anuncio';

  @override
  String get adOptions => 'Opciones del anuncio';

  @override
  String get adReport => 'Denunciar anuncio';

  @override
  String quotaLeft(int count) {
    return 'Quedan $count';
  }

  @override
  String quotaResets(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.MMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Se reinicia el $dateString';
  }

  @override
  String progressGlassLabel(String percent) {
    return 'Vaso lleno al $percent';
  }
}
