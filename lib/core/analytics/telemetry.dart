import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onemoresip/core/analytics/analytics_event.dart';
import 'package:onemoresip/core/analytics/sentry_scrubber.dart';
import 'package:onemoresip/core/analytics/telemetry_guard.dart';
import 'package:onemoresip/core/config/env.dart';
import 'package:posthog_flutter/posthog_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// Where analytics events go. PostHog in the app, a fake in tests.
abstract interface class AnalyticsSink {
  /// Starts (true) or stops (false) collection.
  Future<void> setEnabled({required bool enabled});

  /// Sends one event.
  Future<void> capture(String name, Map<String, Object> properties);
}

/// Single entry point for analytics (SD-9). Sends nothing until the user
/// has consented (D-26) and only SD-9 events that pass the guard.
class Telemetry {
  /// Creates telemetry writing to the given sink.
  new(this._sink);

  final AnalyticsSink _sink;
  bool _consented = false;

  /// Whether analytics may be sent. Set by the consent flow (T-071, T-090).
  bool get analyticsConsented => _consented;

  /// Grants or withdraws analytics consent.
  Future<void> setAnalyticsConsent({required bool granted}) async {
    _consented = granted;
    await _sink.setEnabled(enabled: granted);
  }

  /// Sends [event] if consent was given and its properties are allowed.
  Future<void> track(AnalyticsEvent event) async {
    if (!_consented) return;
    final rejected = rejectedProperties(event.properties);
    if (rejected.isNotEmpty) {
      assert(false, 'Blocked ${event.name}: properties $rejected (SD-9)');
      return;
    }
    await _sink.capture(event.name, event.properties);
  }
}

/// PostHog EU, no autocapture, no replay, anonymous install ID only (SD-9).
class PostHogSink implements AnalyticsSink {
  bool _setUp = false;

  @override
  Future<void> setEnabled({required bool enabled}) async {
    if (Env.postHogApiKey.isEmpty) return;
    if (!enabled) {
      if (_setUp) await Posthog().optOut();
      return;
    }
    if (!_setUp) {
      final config = PostHogConfig(Env.postHogApiKey)
        ..host = Env.postHogHost
        ..captureApplicationLifecycleEvents = false
        ..sessionReplay = false
        ..surveys = false
        ..preloadFeatureFlags = false
        ..sendFeatureFlagEvent = false
        ..capturePushNotificationOpened = false
        ..capturePushNotificationSubscriptions = false
        ..personProfiles = PostHogPersonProfiles.never;
      await Posthog().setup(config);
      _setUp = true;
    }
    await Posthog().optIn();
  }

  @override
  Future<void> capture(String name, Map<String, Object> properties) =>
      Posthog().capture(eventName: name, properties: properties);
}

/// App-wide telemetry; analytics stay off until consent (D-26).
final telemetryProvider = Provider<Telemetry>(
  (ref) => Telemetry(PostHogSink()),
);

/// Runs [app] with crash reporting when a Sentry DSN is configured (D-26).
Future<void> runWithTelemetry(Widget app) async {
  if (Env.sentryDsn.isEmpty) {
    runApp(app);
    return;
  }
  await SentryFlutter.init(
    configureSentry,
    appRunner: () => runApp(SentryWidget(child: app)),
  );
}

/// Privacy-preserving Sentry options (SD-7, SD-9).
@visibleForTesting
void configureSentry(SentryFlutterOptions options) {
  options
    ..dsn = Env.sentryDsn
    ..environment = Env.appEnv
    ..sendDefaultPii = false
    ..attachScreenshot = false
    ..attachViewHierarchy = false
    ..enableUserInteractionBreadcrumbs = false
    ..beforeSend = scrubSentryEvent;
}
