/// Analytics events allowed by SD-9. Anything not modelled here cannot be
/// sent: there is no API that takes a free-form event name or property map.
///
/// Property values are enums, booleans or small integers — never volumes,
/// drink IDs, goals, weight, fluid restriction, location or chat text.
/// `feature_discovered`, `paywall_viewed` and `purchase_started` are added
/// with T-038, T-081 and T-080, once their value sets exist.
library;

/// A typed SD-9 analytics event.
sealed class AnalyticsEvent {
  const new(this.name);

  /// PostHog event name.
  final String name;

  /// Event properties, already in wire format.
  Map<String, Object> get properties => const {};
}

/// `app_opened`.
final class AppOpened extends AnalyticsEvent {
  /// Creates the event.
  const new() : super('app_opened');
}

/// `onboarding_step_completed{step}`.
final class OnboardingStepCompleted extends AnalyticsEvent {
  /// Creates the event for onboarding [step] (1-based).
  const new(this.step) : super('onboarding_step_completed');

  /// Step number, 1-based.
  final int step;

  @override
  Map<String, Object> get properties => {'step': step};
}

/// Experience chosen at the end of onboarding (PRD F-01).
enum OnboardingExperience {
  /// Normal mode.
  normal,

  /// Simple Mode (F-11).
  simple,
}

/// `onboarding_completed{experience}`.
final class OnboardingCompleted extends AnalyticsEvent {
  /// Creates the event.
  const new(this.experience) : super('onboarding_completed');

  /// Chosen experience.
  final OnboardingExperience experience;

  @override
  Map<String, Object> get properties => {'experience': _wire(experience)};
}

/// Where a drink log came from (PRD F-02).
enum DrinkLogSource {
  /// Home, log sheet or Simple Mode.
  inApp,

  /// Notification action.
  notification,

  /// Home or lock-screen widget.
  widget,

  /// Siri / app shortcuts.
  voice,

  /// iOS Live Activity.
  liveActivity,

  /// Apple Watch or Wear OS.
  watch,

  /// AI photo (after confirmation).
  aiPhoto,

  /// Imported from Apple Health / Health Connect.
  healthImport,
}

/// `drink_logged{source}` — no volume, no drink type.
final class DrinkLogged extends AnalyticsEvent {
  /// Creates the event.
  const new(this.source) : super('drink_logged');

  /// Log source.
  final DrinkLogSource source;

  @override
  Map<String, Object> get properties => {'source': _wire(source)};
}

/// Reminder notification actions (PRD F-04).
enum ReminderAction {
  /// "✓ 250 ml" action.
  logged,

  /// "Later 15 min" action.
  later,
}

/// `reminder_action{action}`.
final class ReminderActionTaken extends AnalyticsEvent {
  /// Creates the event.
  const new(this.action) : super('reminder_action');

  /// Action taken.
  final ReminderAction action;

  @override
  Map<String, Object> get properties => {'action': _wire(action)};
}

/// `day_completed{goal_met}`.
final class DayCompleted extends AnalyticsEvent {
  /// Creates the event.
  const new({required this.goalMet}) : super('day_completed');

  /// Whether the day's goal was met.
  final bool goalMet;

  @override
  Map<String, Object> get properties => {'goal_met': goalMet};
}

/// Rewarded-ad rewards (PRD §8).
enum AdReward {
  /// +1 streak freeze.
  streakFreeze,

  /// Premium theme for 24 h.
  theme24h,
}

/// `ad_reward_claimed{reward}`.
final class AdRewardClaimed extends AnalyticsEvent {
  /// Creates the event.
  const new(this.reward) : super('ad_reward_claimed');

  /// Reward claimed.
  final AdReward reward;

  @override
  Map<String, Object> get properties => {'reward': _wire(reward)};
}

/// Issues found by the notification health check (PRD F-04).
enum NotificationHealthIssue {
  /// Notification permission disabled.
  permissionDisabled,

  /// Battery optimization on.
  batteryOptimization,

  /// Exact alarms denied.
  exactAlarmDenied,
}

/// `notification_health_fixed{issue}`.
final class NotificationHealthFixed extends AnalyticsEvent {
  /// Creates the event.
  const new(this.issue) : super('notification_health_fixed');

  /// Issue fixed.
  final NotificationHealthIssue issue;

  @override
  Map<String, Object> get properties => {'issue': _wire(issue)};
}

/// Fasting types (PRD F-10).
enum FastingType {
  /// Ramadan.
  ramadan,

  /// Monday & Thursday.
  mondayThursday,

  /// Ayyamul Bidh.
  ayyamulBidh,

  /// Custom days.
  customDays,

  /// Intermittent fasting window.
  intermittent,
}

/// `fasting_mode_enabled{type}`.
final class FastingModeEnabled extends AnalyticsEvent {
  /// Creates the event.
  const new(this.type) : super('fasting_mode_enabled');

  /// Fasting type.
  final FastingType type;

  @override
  Map<String, Object> get properties => {'type': _wire(type)};
}

/// `family_invite_sent`.
final class FamilyInviteSent extends AnalyticsEvent {
  /// Creates the event.
  const new() : super('family_invite_sent');
}

/// `family_invite_accepted`.
final class FamilyInviteAccepted extends AnalyticsEvent {
  /// Creates the event.
  const new() : super('family_invite_accepted');
}

/// AI features (PRD F-18…F-20).
enum AiKind {
  /// AI photo logging.
  photo,

  /// Ask Sippy chat.
  chat,

  /// Weekly insight.
  insight,
}

/// `ai_used{kind}`.
final class AiUsed extends AnalyticsEvent {
  /// Creates the event.
  const new(this.kind) : super('ai_used');

  /// AI feature used.
  final AiKind kind;

  @override
  Map<String, Object> get properties => {'kind': _wire(kind)};
}

/// AI quota meter states (DS-5, T-117).
enum QuotaState {
  /// Plenty left.
  normal,

  /// Running low.
  low,

  /// Used up.
  empty,
}

/// `quota_state{state}`.
final class QuotaStateChanged extends AnalyticsEvent {
  /// Creates the event.
  const new(this.state) : super('quota_state');

  /// New quota state.
  final QuotaState state;

  @override
  Map<String, Object> get properties => {'state': _wire(state)};
}

/// Enum value in snake_case, e.g. `DrinkLogSource.aiPhoto` -> `ai_photo`.
String _wire(Enum value) => value.name.replaceAllMapped(
  RegExp('[A-Z0-9]+'),
  (m) => '_${m[0]!.toLowerCase()}',
);
