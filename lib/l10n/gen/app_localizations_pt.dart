// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get navHome => 'Início';

  @override
  String get navStats => 'Estatísticas';

  @override
  String get navFamily => 'Família';

  @override
  String get navMe => 'Eu';

  @override
  String get sippyFresh => 'Sippy está com energia';

  @override
  String get sippyHappy => 'Sippy está feliz';

  @override
  String get sippyThirsty => 'Sippy está com um pouco de sede';

  @override
  String get sippyTired => 'Sippy está sem energia';

  @override
  String get sippySleeping => 'Sippy está dormindo';

  @override
  String get sippyCelebrating => 'Sippy está comemorando';

  @override
  String get sippyWaiting => 'Sippy espera com paciência';

  @override
  String get fabLogLabel => 'Registrar bebida';

  @override
  String get statusHydrated => 'Hidratado';

  @override
  String get statusThirsty => 'Com um pouco de sede';

  @override
  String get statusBehind => 'Atrasado';

  @override
  String get undo => 'Desfazer';

  @override
  String get adLabel => 'Anúncio';

  @override
  String get adOptions => 'Opções do anúncio';

  @override
  String get adReport => 'Denunciar anúncio';

  @override
  String quotaLeft(int count) {
    return 'Restam $count';
  }

  @override
  String quotaResets(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.MMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Reinicia em $dateString';
  }

  @override
  String progressGlassLabel(String percent) {
    return 'Copo $percent cheio';
  }
}
