/// Medical safety under a doctor's fluid restriction (F-28, BR-01a, D-34).
library;

/// Smallest restriction the user can enter (D-34).
const minRestrictionMl = 500;

/// Largest restriction the user can enter (D-34).
const maxRestrictionMl = 3000;

/// Restriction input step (D-34).
const restrictionStepMl = 50;

/// Where the − / + buttons start when the restriction field is empty.
const restrictionStartMl = 1500;

/// What the app may do for a user, given an optional doctor's fluid
/// restriction (BR-01a).
///
/// "Drink more" copy rule: ARB keys whose text nudges the user to drink
/// more start with `nudge` (e.g. `nudgeCatchUp`). Screens show them only
/// through [drinkMoreCopy], so they disappear under a restriction.
class SafetyPolicy {
  /// Creates the policy for [restrictionMl]; `null` means no restriction.
  const new({this.restrictionMl});

  /// The doctor's daily limit in ml, or `null`.
  final int? restrictionMl;

  /// Whether a doctor's limit is set.
  bool get isRestricted => restrictionMl != null;

  /// Weather and activity goal adjustments (F-09, BR-01b/c).
  bool get allowAdjustments => !isRestricted;

  /// Catch-up suggestions and the "a little behind" message (F-05, BR-02).
  bool get allowCatchUp => !isRestricted;

  /// Copy that nudges the user to drink more.
  bool get allowDrinkMoreCopy => !isRestricted;

  /// Today's goal: the doctor's value when restricted (no adjustments),
  /// otherwise [computedGoalMl].
  int effectiveGoal(int computedGoalMl) => restrictionMl ?? computedGoalMl;

  /// Returns [copy] (a `nudge*` ARB string) only when drink-more copy is
  /// allowed, otherwise `null`.
  String? drinkMoreCopy(String Function() copy) =>
      allowDrinkMoreCopy ? copy() : null;
}

/// Result of checking a typed restriction value (D-34).
enum RestrictionValidation {
  /// 500–3,000 ml in 50 ml steps.
  valid,

  /// Below 500 ml.
  belowMin,

  /// Above 3,000 ml.
  aboveMax,

  /// Not a multiple of 50 ml.
  offStep,
}

/// Checks [ml] against the allowed restriction range and step.
RestrictionValidation validateRestrictionMl(int ml) {
  if (ml < minRestrictionMl) return RestrictionValidation.belowMin;
  if (ml > maxRestrictionMl) return RestrictionValidation.aboveMax;
  if (ml % restrictionStepMl != 0) return RestrictionValidation.offStep;
  return RestrictionValidation.valid;
}

/// The value after one − ([up] false) or + ([up] true) press: one step
/// from [current], snapped to the 50 ml grid and kept in range. An empty
/// field ([current] `null`) starts at [restrictionStartMl].
int stepRestrictionMl(int? current, {required bool up}) {
  if (current == null) return restrictionStartMl;
  final snapped = current - current % restrictionStepMl;
  final next = up
      ? snapped + restrictionStepMl
      : (snapped == current ? snapped - restrictionStepMl : snapped);
  return next.clamp(minRestrictionMl, maxRestrictionMl);
}
