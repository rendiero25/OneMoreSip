import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Adds the OFL licenses of the bundled fonts (DS-2, D-28) to the
/// licenses page. Call once at startup.
void registerFontLicenses() {
  LicenseRegistry.addLicense(() async* {
    for (final (family, path) in const [
      ('Plus Jakarta Sans', 'assets/fonts/plus_jakarta_sans/OFL.txt'),
      ('IBM Plex Sans Arabic', 'assets/fonts/ibm_plex_sans_arabic/OFL.txt'),
    ]) {
      final text = await rootBundle.loadString(path);
      yield LicenseEntryWithLineBreaks([family], text);
    }
  });
}
