/// BR-06 over-drinking warning (F-28, D-34). Warnings never block logging.
library;

import 'dart:math' as math;

import 'package:onemoresip/features/reminders/domain/catch_up.dart'
    show hourlyLimitMl;

/// Daily threshold floor without a restriction (BR-06).
const dailyWarningFloorMl = 4500;

/// Daily threshold as a multiple of the goal without a restriction (BR-06).
const dailyWarningGoalFactor = 1.6;

/// Which BR-06 warning to show.
enum OverDrinkingWarning {
  /// Nothing to show.
  none,

  /// Gentle "sip slowly" note: more than 1,000 ml within 60 minutes.
  hourly,

  /// Card with "talk to a doctor if you often feel very thirsty".
  daily,
}

/// Picks the BR-06 warning.
///
/// Hourly: [last60MinMl] > 1,000 ml, for everyone. Daily: [todayMl] above
/// [restrictionMl] when set (BR-01a), otherwise above
/// max([goalMl] × 1.6, 4,500 ml). When both apply the daily card wins: it
/// is the stronger message and already asks the user to go easy.
OverDrinkingWarning overDrinkingWarning({
  required int last60MinMl,
  required int todayMl,
  required int goalMl,
  int? restrictionMl,
}) {
  final dailyLimit =
      restrictionMl ??
      math.max<num>(goalMl * dailyWarningGoalFactor, dailyWarningFloorMl);
  if (todayMl > dailyLimit) return OverDrinkingWarning.daily;
  if (last60MinMl > hourlyLimitMl) return OverDrinkingWarning.hourly;
  return OverDrinkingWarning.none;
}
