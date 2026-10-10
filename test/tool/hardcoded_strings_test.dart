import 'package:flutter_test/flutter_test.dart';

import '../../tool/hardcoded_strings.dart';

void main() {
  List<String> literals(String source) =>
      findHardcodedStrings(source).map((h) => h.literal).toList();

  test('flags a literal string in a widget', () {
    const source = '''
Widget build(BuildContext context) {
  return Text('Good morning');
}
''';
    expect(findHardcodedStrings(source), [
      (line: 2, literal: "'Good morning'"),
    ]);
  });

  test('flags double-quoted, raw, triple-quoted and non-Latin text', () {
    const source = '''
a("Hello");
b(r'Raw text');
c(\'\'\'Multi
line\'\'\');
d('الرئيسية');
''';
    expect(literals(source), hasLength(4));
  });

  test('flags text around interpolation', () {
    expect(literals(r"Text('Hi $name')"), [r"'Hi $name'"]);
  });

  test('ignores strings without letters', () {
    expect(literals(r"Text('$count'); x('${a.b} / 2'); y('');"), isEmpty);
  });

  test('ignores directives, comments and ignored lines', () {
    const source = '''
import 'package:flutter/material.dart';
part 'home.g.dart';
// Text('commented out')
/* Text('block comment') */
const key = ValueKey('home-hero'); // i18n-ignore
''';
    expect(literals(source), isEmpty);
  });

  test('reports the right line after a multi-line string', () {
    const source = """
a('''one
two''');
b('three');
""";
    expect(findHardcodedStrings(source).last.line, 3);
  });
}
