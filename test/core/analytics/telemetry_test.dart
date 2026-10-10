import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/core/analytics/analytics_event.dart';
import 'package:onemoresip/core/analytics/telemetry.dart';

class _FakeSink implements AnalyticsSink {
  final captured = <(String, Map<String, Object>)>[];
  bool? enabled;

  @override
  Future<void> setEnabled({required bool enabled}) async =>
      this.enabled = enabled;

  @override
  Future<void> capture(String name, Map<String, Object> properties) async =>
      captured.add((name, properties));
}

void main() {
  test('sends nothing before consent (D-26)', () async {
    final sink = _FakeSink();
    await Telemetry(sink).track(const AppOpened());
    expect(sink.captured, isEmpty);
  });

  test('sends typed events after consent', () async {
    final sink = _FakeSink();
    final telemetry = Telemetry(sink);
    await telemetry.setAnalyticsConsent(granted: true);
    await telemetry.track(const DayCompleted(goalMet: true));

    expect(sink.enabled, isTrue);
    expect(sink.captured, hasLength(1));
    expect(sink.captured.single.$1, 'day_completed');
    expect(sink.captured.single.$2, {'goal_met': true});
  });

  test('stops sending when consent is withdrawn', () async {
    final sink = _FakeSink();
    final telemetry = Telemetry(sink);
    await telemetry.setAnalyticsConsent(granted: true);
    await telemetry.setAnalyticsConsent(granted: false);
    await telemetry.track(const AppOpened());

    expect(sink.enabled, isFalse);
    expect(sink.captured, isEmpty);
  });
}
