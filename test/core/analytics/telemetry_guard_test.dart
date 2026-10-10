import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/core/analytics/analytics_event.dart';
import 'package:onemoresip/core/analytics/telemetry_guard.dart';

void main() {
  test('rejects forbidden property names (SD-9)', () {
    const forbidden = [
      'volume',
      'volume_ml',
      'ml',
      'amount',
      'drink_id',
      'drinkId',
      'goal',
      'goal_ml',
      'weight',
      'weight_kg',
      'fluid_restriction',
      'location',
      'latitude',
      'lng',
      'geohash',
      'chat_text',
      'message',
      'email',
      'user_name',
    ];
    for (final name in forbidden) {
      expect(rejectedProperties({name: 1}), [name], reason: name);
      expect(forbiddenPropertyName.hasMatch(name), isTrue, reason: name);
    }
  });

  test('rejects names that are not on the SD-9 allowlist', () {
    expect(rejectedProperties({'screen': 'home'}), ['screen']);
  });

  test('allows every SD-9 property name, including goal_met', () {
    final props = {for (final name in allowedPropertyNames) name: 1};
    expect(rejectedProperties(props), isEmpty);
  });

  test('every typed event passes the guard', () {
    final events = <AnalyticsEvent>[
      const AppOpened(),
      const OnboardingStepCompleted(3),
      ...OnboardingExperience.values.map(OnboardingCompleted.new),
      ...DrinkLogSource.values.map(DrinkLogged.new),
      ...ReminderAction.values.map(ReminderActionTaken.new),
      const DayCompleted(goalMet: true),
      ...AdReward.values.map(AdRewardClaimed.new),
      ...NotificationHealthIssue.values.map(NotificationHealthFixed.new),
      ...FastingType.values.map(FastingModeEnabled.new),
      const FamilyInviteSent(),
      const FamilyInviteAccepted(),
      ...AiKind.values.map(AiUsed.new),
      ...QuotaState.values.map(QuotaStateChanged.new),
    ];
    for (final event in events) {
      expect(rejectedProperties(event.properties), isEmpty, reason: event.name);
    }
  });

  test('enum values go over the wire in snake_case', () {
    expect(const DrinkLogged(DrinkLogSource.aiPhoto).properties, {
      'source': 'ai_photo',
    });
    expect(const AdRewardClaimed(AdReward.theme24h).properties, {
      'reward': 'theme_24h',
    });
  });
}
