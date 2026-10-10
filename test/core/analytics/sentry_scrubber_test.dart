import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/core/analytics/sentry_scrubber.dart';
import 'package:onemoresip/core/analytics/telemetry.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() {
  test('drops identity, free text and breadcrumb data', () {
    final event = SentryEvent(
      user: SentryUser(id: 'u1', email: 'a@b.c'),
      message: SentryMessage('Logged 250 ml'),
      // ignore: deprecated_member_use -- the scrubber must clear it.
      extra: {'goal_ml': 2300},
      exceptions: [SentryException(type: 'StateError', value: 'goal 2300')],
      breadcrumbs: [
        Breadcrumb(message: 'tap 250 ml', data: {'volume': 250}),
      ],
    );

    final scrubbed = scrubSentryEvent(event, Hint());

    expect(scrubbed.user, isNull);
    expect(scrubbed.message, isNull);
    // ignore: deprecated_member_use -- the scrubber must clear it.
    expect(scrubbed.extra, isNull);
    expect(scrubbed.exceptions!.single.type, 'StateError');
    expect(scrubbed.exceptions!.single.value, isNull);
    expect(scrubbed.breadcrumbs!.single.message, isNull);
    expect(scrubbed.breadcrumbs!.single.data, isNull);
  });

  test('Sentry options keep PII, screenshots and UI breadcrumbs off', () {
    final options = SentryFlutterOptions();
    configureSentry(options);

    expect(options.sendDefaultPii, isFalse);
    expect(options.attachScreenshot, isFalse);
    expect(options.attachViewHierarchy, isFalse);
    expect(options.enableUserInteractionBreadcrumbs, isFalse);
    expect(options.beforeSend, isNotNull);
  });
}
