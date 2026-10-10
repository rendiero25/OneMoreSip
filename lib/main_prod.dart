import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onemoresip/app/app.dart';
import 'package:onemoresip/core/analytics/telemetry.dart';

Future<void> main() async {
  await runWithTelemetry(const ProviderScope(child: App()));
}
