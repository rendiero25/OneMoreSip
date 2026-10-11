import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onemoresip/app/app.dart';
import 'package:onemoresip/app/theme/font_licenses.dart';
import 'package:onemoresip/core/analytics/telemetry.dart';

Future<void> main() async {
  registerFontLicenses();
  await runWithTelemetry(const ProviderScope(child: App()));
}
