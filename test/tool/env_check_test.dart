import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import '../../tool/env_check.dart';

String _jwt(Map<String, Object> claims) {
  String part(Object o) =>
      base64Url.encode(utf8.encode(jsonEncode(o))).replaceAll('=', '');
  return '${part({'alg': 'HS256'})}.${part(claims)}.signature';
}

void main() {
  test('accepts public client values', () {
    final json = jsonEncode({
      'APP_ENV': 'dev',
      'SUPABASE_URL': 'https://abc.supabase.co',
      'SUPABASE_PUBLISHABLE_KEY': 'sb_publishable_abc123', // gitleaks:allow
      'REVENUECAT_IOS_PUBLIC_KEY': 'appl_abc123',
      'POSTHOG_API_KEY': 'phc_abc123',
      'LEGACY_ANON_KEY': _jwt({'role': 'anon'}),
    });
    expect(findEnvSecrets(json), isEmpty);
  });

  test('rejects secret-looking key names', () {
    for (final name in [
      'SUPABASE_SECRET_KEY',
      'SUPABASE_SERVICE_ROLE_KEY',
      'ANTHROPIC_API_KEY',
      'REVENUECAT_WEBHOOK_SECRET',
      'WEATHERKIT_KEY_P8',
      'FCM_SERVICE_ACCOUNT',
      'GITHUB_TOKEN',
    ]) {
      expect(
        findEnvSecrets(jsonEncode({name: ''})),
        hasLength(1),
        reason: name,
      );
    }
  });

  test('rejects secret-looking values under innocent names', () {
    for (final value in [
      'sb_secret_abc123',
      'sk-ant-api03-abc',
      'sk_abc123',
      '-----BEGIN PRIVATE KEY-----',
      _jwt({'role': 'service_role'}),
    ]) {
      expect(
        findEnvSecrets(jsonEncode({'SOME_KEY': value})),
        hasLength(1),
        reason: value,
      );
    }
  });

  test('rejects a non-object file', () {
    expect(findEnvSecrets('[]'), isNotEmpty);
  });

  test('committed env files are clean', () {
    final files = Directory('env')
        .listSync()
        .whereType<File>()
        .where((f) => f.path.endsWith('.json'));
    expect(
      files.map((f) => f.uri.pathSegments.last),
      containsAll(['dev.json', 'prod.json']),
    );
    for (final file in files) {
      expect(
        findEnvSecrets(file.readAsStringSync()),
        isEmpty,
        reason: file.path,
      );
    }
  });
}
