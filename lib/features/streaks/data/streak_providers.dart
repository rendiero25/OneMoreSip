import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onemoresip/core/flags/feature_flags.dart';
import 'package:onemoresip/features/profile/data/profile_repository.dart';
import 'package:onemoresip/features/stats/data/history_providers.dart';
import 'package:onemoresip/features/streaks/domain/streak.dart';

/// The current profile's BR-07 streak, recomputed whenever a log is added,
/// edited, deleted or restored. Under a fluid restriction a day counts when
/// anything was logged (D-31).
///
/// No freezes yet: T-035 wires the freeze balance (F-15).
final currentStreakProvider = FutureProvider<StreakResult>((ref) async {
  final days = await ref.watch(loggedDaysProvider.future);
  final profile = await ref.watch(currentProfileProvider.future);
  return computeStreak(
    days: [
      for (final day in days)
        (
          date: day.date,
          hydrationMl: day.hydrationMl,
          goalMl: day.goalMl,
          logCount: day.logs.length,
        ),
    ],
    today: ref.watch(clockProvider)(),
    freezesAvailable: 0,
    fluidRestricted: profile?.fluidRestrictionMl != null,
  );
});
