// CI check (T-006): no hard-coded user-facing strings in `presentation/`.
// Usage: dart run tool/check_hardcoded_strings.dart [root=lib]
import 'dart:io';

import 'hardcoded_strings.dart';

void main(List<String> args) {
  final root = Directory(args.isEmpty ? 'lib' : args.first);
  final files = root
      .listSync(recursive: true)
      .whereType<File>()
      .where(
        (f) =>
            f.path.endsWith('.dart') &&
            f.uri.pathSegments.contains('presentation'),
      );

  var count = 0;
  for (final file in files) {
    for (final hit in findHardcodedStrings(file.readAsStringSync())) {
      count++;
      stderr.writeln('${file.path}:${hit.line}: ${hit.literal}');
    }
  }

  if (count > 0) {
    stderr.writeln(
      '\n$count hard-coded string(s) in presentation/. Move them to '
      'lib/l10n/app_en.arb, or end the line with "$ignoreMarker" if the '
      'text is not user-facing.',
    );
    exitCode = 1;
  } else {
    stdout.writeln('No hard-coded strings in presentation/.');
  }
}
