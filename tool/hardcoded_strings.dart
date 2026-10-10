/// Finds user-facing string literals in Dart source (F-27, T-006).
///
/// A literal counts as user-facing when it contains a letter once
/// interpolations are removed. Directives (`import`, `export`, `part`,
/// `library`) and lines ending with `// i18n-ignore` are skipped.
library;

/// A string literal found on `line` (1-based).
typedef HardcodedString = ({int line, String literal});

/// Comment that whitelists the literals on its line.
const ignoreMarker = '// i18n-ignore';

final _letter = RegExp(r'\p{L}', unicode: true);
final _interpolation = RegExp(r'\$\{[^}]*\}|\$[A-Za-z_]\w*');
final _directive = RegExp(r'^\s*(import|export|part|library)\b');

/// Returns the user-facing string literals in [source].
List<HardcodedString> findHardcodedStrings(String source) {
  final lines = source.split('\n');
  final skipped = <int>{
    for (var i = 0; i < lines.length; i++)
      if (_directive.hasMatch(lines[i]) || lines[i].contains(ignoreMarker))
        i + 1,
  };

  final found = <HardcodedString>[];
  var line = 1;
  var i = 0;
  while (i < source.length) {
    final c = source[i];
    if (c == '\n') {
      line++;
      i++;
    } else if (source.startsWith('//', i)) {
      i = source.indexOf('\n', i);
      if (i == -1) break;
    } else if (source.startsWith('/*', i)) {
      final end = source.indexOf('*/', i + 2);
      final stop = end == -1 ? source.length : end + 2;
      line += '\n'.allMatches(source.substring(i, stop)).length;
      i = stop;
    } else if (c == "'" || c == '"' || _isRawStart(source, i)) {
      final raw = c == 'r';
      final start = raw ? i + 1 : i;
      final quote = source[start];
      final triple = source.startsWith(quote * 3, start);
      final delimiter = triple ? quote * 3 : quote;
      var j = start + delimiter.length;
      while (j < source.length && !source.startsWith(delimiter, j)) {
        if (!raw && source[j] == r'\') j++;
        j++;
      }
      final body = source.substring(
        start + delimiter.length,
        j.clamp(0, source.length),
      );
      final text = raw ? body : body.replaceAll(_interpolation, '');
      if (!skipped.contains(line) && _letter.hasMatch(text)) {
        found.add((line: line, literal: source.substring(i, j + 1)));
      }
      line += '\n'.allMatches(body).length;
      i = j + delimiter.length;
    } else {
      i++;
    }
  }
  return found;
}

bool _isRawStart(String s, int i) =>
    s[i] == 'r' &&
    i + 1 < s.length &&
    (s[i + 1] == "'" || s[i + 1] == '"') &&
    (i == 0 || !RegExp(r'\w').hasMatch(s[i - 1]));
