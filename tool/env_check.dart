/// Rejects secrets in `env/*.json` (T-007, SD-7).
///
/// Only public client values may ship in the app binary. A key fails when
/// its name looks like a secret, or its value looks like a known secret
/// format.
library;

import 'dart:convert';

/// Key names that indicate a secret.
final secretKeyName = RegExp(
  'SECRET|SERVICE_ROLE|PRIVATE|PASSWORD|PASSWD|TOKEN|CREDENTIAL|WEBHOOK|'
  r'ANTHROPIC|OPENAI|_P8\b|SERVICE_ACCOUNT|ADMIN',
  caseSensitive: false,
);

/// Value formats of server-side secrets.
final _secretValues = <String, RegExp>{
  'Supabase secret key': RegExp('^sb_secret_'),
  'Anthropic API key': RegExp('^sk-ant-'),
  'RevenueCat secret key': RegExp('^sk_'),
  'Private key': RegExp('-----BEGIN [A-Z ]*PRIVATE KEY-----'),
  'Supabase service_role JWT': RegExp(r'^eyJ[\w-]+\.(eyJ[\w-]+)\.'),
};

/// Returns one problem per offending key in [json]; empty when clean.
List<String> findEnvSecrets(String json) {
  final decoded = jsonDecode(json);
  if (decoded is! Map<String, dynamic>) {
    return ['env file must be a JSON object'];
  }

  final problems = <String>[];
  for (final MapEntry(:key, :value) in decoded.entries) {
    if (secretKeyName.hasMatch(key)) {
      problems.add('$key: key name looks like a secret');
    }
    if (value is! String) continue;
    for (final MapEntry(key: label, value: pattern) in _secretValues.entries) {
      if (pattern.hasMatch(value) && !_isPublicJwt(label, value)) {
        problems.add('$key: value looks like a $label');
      }
    }
  }
  return problems;
}

/// A JWT only counts as a secret when its role claim is `service_role`
/// (legacy Supabase anon keys are public JWTs).
bool _isPublicJwt(String label, String value) {
  if (label != 'Supabase service_role JWT') return false;
  try {
    final payload = value.split('.')[1];
    final claims = utf8.decode(base64Url.decode(base64Url.normalize(payload)));
    return !claims.contains('"service_role"');
  } on FormatException {
    return false;
  }
}
