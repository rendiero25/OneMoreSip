import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onemoresip/core/sippy/sippy_state.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

/// Sippy mascot (F-29, DS-8).
///
/// Shows the static fallback for [state]. The Rive animation (O-11) will
/// replace it except under Reduce Motion, where the static art stays.
class Sippy extends StatelessWidget {
  /// Creates Sippy in [state], [size] logical pixels square.
  const new({required this.state, this.size = 120, super.key});

  /// Current state.
  final SippyState state;

  /// Width and height.
  final double size;

  /// Asset path of the static fallback for [state].
  static String assetFor(SippyState state) => 'assets/sippy/${state.name}.svg';

  @override
  Widget build(BuildContext context) {
    return Semantics(
      image: true,
      label: _label(AppLocalizations.of(context)),
      child: SvgPicture.asset(
        assetFor(state),
        width: size,
        height: size,
        excludeFromSemantics: true,
      ),
    );
  }

  String _label(AppLocalizations l10n) => switch (state) {
    SippyState.fresh => l10n.sippyFresh,
    SippyState.happy => l10n.sippyHappy,
    SippyState.thirsty => l10n.sippyThirsty,
    SippyState.tired => l10n.sippyTired,
    SippyState.sleeping => l10n.sippySleeping,
    SippyState.celebrating => l10n.sippyCelebrating,
    SippyState.waiting => l10n.sippyWaiting,
  };
}
