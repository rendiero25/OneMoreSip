// CI check (T-007): env/*.json may hold public values only.
// Usage: dart run tool/check_env.dart [dir=env]
import 'dart:io';

import 'env_check.dart';

void main(List<String> args) {
  final dir = Directory(args.isEmpty ? 'env' : args.first);
  final files = dir.listSync().whereType<File>().where(
    (f) => f.path.endsWith('.json'),
  );

  var count = 0;
  for (final file in files) {
    for (final problem in findEnvSecrets(file.readAsStringSync())) {
      count++;
      stderr.writeln('${file.path}: $problem');
    }
  }

  if (count > 0) {
    stderr.writeln(
      '\n$count secret-like entr(ies) in ${dir.path}/. Secrets belong in '
      'Supabase Edge Function secrets only (SD-7).',
    );
    exitCode = 1;
  } else {
    stdout.writeln('env/ holds public values only.');
  }
}
