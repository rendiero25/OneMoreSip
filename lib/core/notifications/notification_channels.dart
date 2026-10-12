import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

/// The notification categories of F-06, one Android channel each.
///
/// Only [reminders] is used so far (T-041). Promotions are OFF by default
/// at app level (SC-08): an Android channel cannot be created disabled, so
/// nothing may be posted on [promotions] until the user opts in with the
/// in-app toggle (T-043). The other channels get content in later tasks.
enum AppChannel {
  /// Drink reminders (F-04).
  reminders('drink_reminders'),

  /// Ongoing progress notification (default off, F-06).
  progress('progress'),

  /// Caregiver alerts (F-13).
  family('family_alerts'),

  /// Weather goal change, max once a day (F-09).
  weather('weather_goal'),

  /// Achievements and weekly insight digest.
  insights('achievements_insights'),

  /// Offers; explicit opt-in only (SC-08).
  promotions('promotions');

  new(this.id);

  /// Stable Android channel id; never rename (users' settings hang on it).
  final String id;

  /// The channel with names in the language of [l10n].
  AndroidNotificationChannel channel(AppLocalizations l10n) {
    final (name, description) = switch (this) {
      reminders => (
        l10n.notificationChannelReminders,
        l10n.notificationChannelRemindersDescription,
      ),
      progress => (
        l10n.notificationChannelProgress,
        l10n.notificationChannelProgressDescription,
      ),
      family => (
        l10n.notificationChannelFamily,
        l10n.notificationChannelFamilyDescription,
      ),
      weather => (
        l10n.notificationChannelWeather,
        l10n.notificationChannelWeatherDescription,
      ),
      insights => (
        l10n.notificationChannelInsights,
        l10n.notificationChannelInsightsDescription,
      ),
      promotions => (
        l10n.notificationChannelPromotions,
        l10n.notificationChannelPromotionsDescription,
      ),
    };
    return AndroidNotificationChannel(
      id,
      name,
      description: description,
      // Silent: the progress notification is ongoing (F-06). Channel
      // settings are fixed once created, so set it right from the start.
      importance: this == progress
          ? Importance.low
          : Importance.defaultImportance,
    );
  }
}
