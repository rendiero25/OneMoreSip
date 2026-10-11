import 'package:flutter/services.dart';

/// Loads the bundled fonts and the Lucide icon font so goldens show real
/// glyphs instead of the test font's boxes.
Future<void> loadAppFonts() async {
  const families = {
    'PlusJakartaSans': [
      'assets/fonts/plus_jakarta_sans/PlusJakartaSans-VariableFont_wght.ttf',
    ],
    'IBMPlexSansArabic': [
      'assets/fonts/ibm_plex_sans_arabic/IBMPlexSansArabic-Regular.ttf',
      'assets/fonts/ibm_plex_sans_arabic/IBMPlexSansArabic-Medium.ttf',
      'assets/fonts/ibm_plex_sans_arabic/IBMPlexSansArabic-SemiBold.ttf',
      'assets/fonts/ibm_plex_sans_arabic/IBMPlexSansArabic-Bold.ttf',
    ],
    'packages/lucide_icons_flutter/Lucide': [
      'packages/lucide_icons_flutter/assets/lucide.ttf',
    ],
  };
  for (final MapEntry(key: family, value: assets) in families.entries) {
    final loader = FontLoader(family);
    for (final asset in assets) {
      loader.addFont(rootBundle.load(asset));
    }
    await loader.load();
  }
}
