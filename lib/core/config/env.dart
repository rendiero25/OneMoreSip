/// Build-time config from `--dart-define-from-file=env/<flavor>.json`
/// (SD-3.3). Public values only; secrets live in Edge Function secrets
/// (SD-7) and `tool/check_env.dart` fails CI if one slips in.
abstract final class Env {
  /// `dev` or `prod`.
  static const appEnv = String.fromEnvironment('APP_ENV', defaultValue: 'dev');

  /// Supabase project URL.
  static const supabaseUrl = String.fromEnvironment('SUPABASE_URL');

  /// Supabase publishable (client) key.
  static const supabasePublishableKey = String.fromEnvironment(
    'SUPABASE_PUBLISHABLE_KEY',
  );

  /// RevenueCat public SDK key for iOS.
  static const revenueCatIosPublicKey = String.fromEnvironment(
    'REVENUECAT_IOS_PUBLIC_KEY',
  );

  /// RevenueCat public SDK key for Android.
  static const revenueCatAndroidPublicKey = String.fromEnvironment(
    'REVENUECAT_ANDROID_PUBLIC_KEY',
  );

  /// Sentry DSN (client-side, public).
  static const sentryDsn = String.fromEnvironment('SENTRY_DSN');

  /// PostHog project API key (client-side, public).
  static const postHogApiKey = String.fromEnvironment('POSTHOG_API_KEY');

  /// PostHog host (EU cloud, SD-9).
  static const postHogHost = String.fromEnvironment('POSTHOG_HOST');
}
