import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onemoresip/core/sippy/sippy_state.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

/// Sippy mascot (F-29, DS-8).
///
/// Animated in code from the static art (D-29): a gentle idle bob and a
/// short cross-fade when [state] changes (DS-9). Under Reduce Motion only
/// the static art is shown.
class Sippy extends StatefulWidget {
  /// Creates Sippy in [state], [size] logical pixels square.
  const new({required this.state, this.size = 120, super.key});

  /// Current state.
  final SippyState state;

  /// Width and height.
  final double size;

  /// Asset path of the static fallback for [state].
  static String assetFor(SippyState state) => 'assets/sippy/${state.name}.svg';

  @override
  State<Sippy> createState() => _SippyState();
}

class _SippyState extends State<Sippy> with SingleTickerProviderStateMixin {
  late final AnimationController _idle = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1600),
  );

  bool get _reduceMotion =>
      MediaQuery.maybeDisableAnimationsOf(context) ?? false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_reduceMotion) {
      _idle.stop();
    } else if (!_idle.isAnimating) {
      _idle.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _idle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final art = SvgPicture.asset(
      Sippy.assetFor(widget.state),
      key: ValueKey(Sippy.assetFor(widget.state)),
      width: widget.size,
      height: widget.size,
      excludeFromSemantics: true,
    );
    return Semantics(
      image: true,
      label: _label(AppLocalizations.of(context)),
      child: _reduceMotion ? art : _animated(art),
    );
  }

  Widget _animated(Widget art) {
    final lift = widget.size * 0.025;
    return AnimatedBuilder(
      animation: _idle,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, -lift * Curves.easeInOut.transform(_idle.value)),
        child: child,
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeOutCubic,
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.9, end: 1).animate(animation),
            child: child,
          ),
        ),
        child: art,
      ),
    );
  }

  String _label(AppLocalizations l10n) => switch (widget.state) {
    SippyState.fresh => l10n.sippyFresh,
    SippyState.happy => l10n.sippyHappy,
    SippyState.thirsty => l10n.sippyThirsty,
    SippyState.tired => l10n.sippyTired,
    SippyState.sleeping => l10n.sippySleeping,
    SippyState.celebrating => l10n.sippyCelebrating,
    SippyState.waiting => l10n.sippyWaiting,
  };
}
