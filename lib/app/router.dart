import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:onemoresip/app/app_shell.dart';
import 'package:onemoresip/app/debug/sippy_debug_screen.dart';
import 'package:onemoresip/app/placeholder_screen.dart';
import 'package:onemoresip/core/flags/feature_flag.dart';
import 'package:onemoresip/core/flags/feature_flags.dart';
import 'package:onemoresip/features/drinks/presentation/drink_picker_screen.dart';

/// Route paths, one per screen group in docs/claude-design-prompts.md.
///
/// UI-00 (design system), UI-17 (OS surfaces) and UI-18 (system states)
/// are not routes.
abstract final class Routes {
  /// UI-01 splash.
  static const splash = '/splash';

  /// UI-01 welcome.
  static const welcome = '/welcome';

  /// UI-02 onboarding.
  static const onboarding = '/onboarding';

  /// UI-03 home (navbar tab).
  static const home = '/home';

  /// UI-09 statistics & history (navbar tab).
  static const stats = '/stats';

  /// UI-12 family & caregiver (navbar tab).
  static const family = '/family';

  /// UI-15 me, settings, account & privacy (navbar tab).
  static const me = '/me';

  /// UI-03b Simple Mode â€” separate route tree, no navbar (SD-3.2, F-11).
  static const simple = '/simple';

  /// UI-05 drink picker (pops the chosen drink). UI-04, the log sheet, is
  /// a bottom sheet over the current tab, not a route.
  static const drinks = '/drinks';

  /// UI-06 AI photo logging.
  static const aiPhoto = '/ai/photo';

  /// UI-07 Ask Sippy chat.
  static const aiChat = '/ai/chat';

  /// UI-08 weekly insight.
  static const insight = '/insight';

  /// UI-10 paywall, Remove Ads, top-up.
  static const paywall = '/paywall';

  /// UI-11 challenges.
  static const challenges = '/challenges';

  /// UI-13 Fasting Mode.
  static const fasting = '/fasting';

  /// UI-14 reminders & notification health.
  static const reminders = '/reminders';

  /// UI-16 streaks, achievements, daily tip.
  static const streaks = '/streaks';

  /// Family invite deep link (SD-2, F-13).
  static const familyInvite = '/i/:token';

  /// Challenge join deep link (SD-2, F-17).
  static const challengeJoin = '/c/:code';

  /// Debug-only gallery of Sippy states (T-013); absent in release builds.
  static const debugSippy = '/debug/sippy';
}

/// App router. Every screen is a placeholder until its task replaces it.
/// Routes of switched-off features redirect to Home (F-33).
final routerProvider = Provider<GoRouter>((ref) {
  final flagsChanged = ValueNotifier(0);
  ref
    ..listen(featureFlagsProvider, (_, _) => flagsChanged.value++)
    ..onDispose(flagsChanged.dispose);

  GoRoute placeholder(String path, String id, [FeatureFlag? flag]) => GoRoute(
    path: path,
    redirect: flag == null
        ? null
        : (context, state) => ref.read(featureFlagsProvider).contains(flag)
              ? Routes.home
              : null,
    builder: (context, state) => PlaceholderScreen(key: ValueKey(id), id: id),
  );

  final router = GoRouter(
    initialLocation: Routes.home,
    refreshListenable: flagsChanged,
    routes: [
      placeholder(Routes.splash, 'UI-01-splash'),
      placeholder(Routes.welcome, 'UI-01-welcome'),
      placeholder(Routes.onboarding, 'UI-02'),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            AppShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(routes: [placeholder(Routes.home, 'UI-03')]),
          StatefulShellBranch(routes: [placeholder(Routes.stats, 'UI-09')]),
          StatefulShellBranch(
            routes: [placeholder(Routes.family, 'UI-12', FeatureFlag.family)],
          ),
          StatefulShellBranch(routes: [placeholder(Routes.me, 'UI-15')]),
        ],
      ),
      placeholder(Routes.simple, 'UI-03b'),
      GoRoute(
        path: Routes.drinks,
        builder: (context, state) => const DrinkPickerScreen(),
      ),
      placeholder(Routes.aiPhoto, 'UI-06', FeatureFlag.aiPhoto),
      placeholder(Routes.aiChat, 'UI-07', FeatureFlag.aiChat),
      placeholder(Routes.insight, 'UI-08', FeatureFlag.aiInsight),
      placeholder(Routes.paywall, 'UI-10'),
      placeholder(Routes.challenges, 'UI-11', FeatureFlag.challenges),
      placeholder(Routes.fasting, 'UI-13', FeatureFlag.fasting),
      placeholder(Routes.reminders, 'UI-14'),
      placeholder(Routes.streaks, 'UI-16'),
      placeholder(Routes.familyInvite, 'invite', FeatureFlag.family),
      placeholder(
        Routes.challengeJoin,
        'challenge-join',
        FeatureFlag.challenges,
      ),
      if (kDebugMode)
        GoRoute(
          path: Routes.debugSippy,
          builder: (context, state) => const SippyDebugScreen(),
        ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
});
