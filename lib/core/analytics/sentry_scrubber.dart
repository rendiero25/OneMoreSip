import 'package:sentry_flutter/sentry_flutter.dart';

/// `beforeSend` for Sentry (SD-7, SD-9): keeps what is needed to fix a
/// crash (type, stack, device/app context) and drops anything that could
/// carry health values, free text or identity.
SentryEvent scrubSentryEvent(SentryEvent event, Hint hint) {
  event
    ..user = null
    ..request = null
    // ignore: deprecated_member_use -- still sent if set; must be cleared.
    ..extra = null
    ..message = null
    ..serverName = null;
  for (final exception in event.exceptions ?? const <SentryException>[]) {
    // Messages may embed values (e.g. "250 ml"); type + stack are enough.
    exception.value = null;
  }
  for (final crumb in event.breadcrumbs ?? const <Breadcrumb>[]) {
    crumb
      ..message = null
      ..data = null;
  }
  return event;
}
