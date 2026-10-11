/// Best IANA time-zone name available without a plugin, for the device's
/// current UTC offset. See [timezoneForOffset].
String deviceTimezone() => timezoneForOffset(DateTime.now().timeZoneOffset);

/// The fixed-offset IANA zone for [offset]: `Etc/GMT±N` (IANA `Etc` names
/// invert the sign: UTC+7 is `Etc/GMT-7`), or `UTC` for a zero offset or
/// one that is not whole hours (no `Etc` zone exists for it). It does not
/// follow DST. T-030 replaces it with the device's real zone (e.g.
/// `Asia/Jakarta`).
String timezoneForOffset(Duration offset) {
  final hours = offset.inHours;
  if (offset.inMinutes % 60 != 0 || hours == 0) return 'UTC';
  return hours > 0 ? 'Etc/GMT-$hours' : 'Etc/GMT+${-hours}';
}
