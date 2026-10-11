/// Sippy mascot states and how they are chosen (DS-8, F-29).
library;

/// The seven Sippy states from DS-8. Each has a static fallback in
/// `assets/sippy/<name>.svg`.
enum SippyState {
  /// On pace.
  fresh,

  /// Just logged a drink.
  happy,

  /// Behind pace by 10–30 points.
  thirsty,

  /// Behind pace by more than 30 points.
  tired,

  /// Night / quiet hours.
  sleeping,

  /// Goal reached.
  celebrating,

  /// Fasting hours (F-10).
  waiting,
}

/// Picks Sippy's state.
///
/// [level] is today's intake and [pace] the expected intake by now, both
/// in percent of the goal (0–100). "Behind" is `pace - level` in points.
/// Priority: waiting > sleeping > celebrating > happy > tired > thirsty >
/// fresh. With a doctor's [fluidRestricted] limit Sippy never looks thirsty
/// or tired, so the mascot never nudges the user to drink more (F-28,
/// D-27).
SippyState sippyStateFor({
  required int level,
  required int pace,
  bool isNight = false,
  bool isFasting = false,
  bool justLogged = false,
  bool fluidRestricted = false,
}) {
  if (isFasting) return SippyState.waiting;
  if (isNight) return SippyState.sleeping;
  if (level >= 100) return SippyState.celebrating;
  if (justLogged) return SippyState.happy;
  if (fluidRestricted) return SippyState.fresh;
  final behind = pace - level;
  if (behind > 30) return SippyState.tired;
  if (behind >= 10) return SippyState.thirsty;
  return SippyState.fresh;
}
