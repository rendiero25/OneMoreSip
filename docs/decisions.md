# Decision Log — One More Sip

> Related: [CLAUDE.md](../CLAUDE.md) · [PRD](PRD.md) · [System Design](system-design.md) · [Design System](design-system.md) · [Store Compliance](store-compliance.md) · [Tasks](task.md)

Highest-precedence document. Each entry is immutable: to change a decision, add a new entry that **supersedes** the old one and mark the old one `Superseded by D-xx`.

Format: **ID — Decision** (date) · Why · Consequence.

---

**D-01 — Product name "One More Sip", home-screen label "Sip!", mascot "Sippy"** (2026-10-09)
Why: Shorter descriptive names (Plip, Pluvi, Drinkminder, HydraMate, Siply, etc.) were already taken in the stores. "One more sip" doubles as slogan and reminder copy.
Consequence: Store title `One More Sip: Water Reminder`; `CFBundleDisplayName` / `android:label` = `Sip!`. Trademark and domain checks still pending (owner task O-02).

**D-02 — Flutter for iOS + Android** (2026-10-08)
Why: Owner's existing skill; custom UI renders identically on both platforms.
Consequence: Widgets, Live Activity, App Intents, watch apps need native Swift/Kotlin.

**D-03 — Global market from day one** (2026-10-08)
Why: Tier-1 markets are worth ~4–5× Indonesia per user; Ramadan feature is relevant across many countries.
Consequence: i18n (EN, ID, AR, ES, PT) and RTL at launch; GDPR/CCPA/LGPD/UU PDP compliance; regional pricing.

**D-04 — Backend: Supabase (Postgres + RLS + Auth + Edge Functions)** (2026-10-08)
Why: Owner's existing stack; RLS gives per-row security; Edge Functions hide secrets.

**D-05 — Monetization: freemium with ads + subscriptions via RevenueCat** (2026-10-08)
Why: Ads are the largest revenue share in the model; RevenueCat unifies both stores.
Consequence: Ad placement rules in PRD F-24; prices in PRD §7.

**D-06 — Separate one-time "Remove Ads" purchase, permanent** (2026-10-08)
Why: Competitors drew complaints when paid ad removal "expired". Permanent purchase is a differentiator.

**D-07 — Premium plans 1 / 3 / 6 / 12 months + Family 12 months; no lifetime** (2026-10-08)
Why: Lifetime conflicts with recurring AI and server cost.

**D-08 — Final pricing** (2026-10-09)
ID: Remove Ads Rp29.000 · 1M Rp15.000 · 3M Rp39.000 · 6M Rp69.000 · 12M Rp99.000 · Family 12M Rp149.000 · AI Top-up Rp10.000.
Tier-1 (USD): $3.99 · $3.99 · $9.99 · $16.99 · $24.99 · $34.99 · $1.99.
Other countries: nearest store price tier / regional pricing. Validate later with RevenueCat Experiments (owner task O-09).

**D-09 — AI model: Claude Haiku 5.5 behind a provider abstraction** (2026-10-08)
Why: $0.10 / $0.50 per MTok, vision support; abstraction allows swapping models without an app update.
Consequence: Model ID lives in Edge Function config, not in the app.

**D-10 — AI is for paying subscribers only** (2026-10-08)
Why: Owner does not want to subsidize AI for free users.
Consequence: Free users see a pre-computed demo; trial gets a small quota (10 photos, 10 chats).

**D-11 — AI quotas** (2026-10-08)
Premium: 150 photos + 60 chats / month; daily caps 15 photos + 10 chats. Trial: 10 + 10. Family: same quota per member. Weekly insight automatic for premium.

**D-12 — Paid AI top-up pack, never expires** (2026-10-08, expiry rule corrected 2026-10-08)
+50 photos, +30 chats; premium only; consumed after the monthly quota; no expiry (Apple 3.1.1); balance stored server-side per account.

**D-13 — 7-day free trial on the 12-month Premium plan** (2026-10-08)

**D-14 — Ship all features at launch; feature flags are kill switches only** (2026-10-08, refined after review-guideline check)
Why: Owner wants the full feature set to drive downloads. Apple 2.3.1 forbids dormant features.
Consequence: Every shipped feature is visible to App Review. Flags may turn a feature off or ramp a reviewed feature; never enable unreviewed functionality.

**D-15 — Fasting Mode is free and available year-round** (2026-10-08)
Why: Hidden "turn on at Ramadan" violates 2.3.1; year-round fasting (Mon/Thu, Ayyamul Bidh, intermittent) is a real use case.
Consequence: Ramadan is a marketing moment (in-app banner, App Store In-App Event), not a feature switch.

**D-16 — Health integrations in v1: Apple Health, Health Connect, Samsung Health Data SDK; Fitbit on iOS deferred to v2** (2026-10-08 / 2026-10-09)
Why: Fitbit Web API shut down (Oct 2026) and Google Health API isn't accepting new projects; Samsung SDK requires partner approval.
Consequence: Samsung SDK code is built but compiled into a release only after Samsung approves (no hidden toggle). Fitbit-on-Android works through Health Connect when the user's Fitbit app syncs there.

**D-17 — Release before Ramadan 2027 (expected ~8 Feb 2027)** (2026-10-08)
Consequence: target release last week of January 2027; Google Play closed test (≥12 testers, 14 days) must start by ~4 January 2027.

**D-18 — Developer accounts registered as an individual** (2026-10-09)
Consequence: Play closed-testing requirement applies; seller name = owner's legal name.

**D-19 — Auth: guest mode + email OTP (passwordless) + Sign in with Apple + Google Sign-In** (2026-10-09)
Consequence: Custom SMTP (Resend) required for Supabase Auth emails.

**D-20 — Launch languages: EN, ID, AR, ES, PT** (2026-10-09)

**D-21 — Visual direction: hybrid modern UI + one mascot (Sippy, Rive animations)** (2026-10-08)
Consequence: Bento cards, big hero numbers, floating dark pill navbar, warm off-white background, teal accent. See design-system.md.

**D-22 — No AI for anything rule-based** (2026-10-08)
Why: Cost, offline support and medical safety. Goal, reminders, catch-up, fasting windows are deterministic code.

**D-23 — Hydration counting is conservative: volume × water fraction, max factor 1.0; alcohol counts 0** (2026-10-08)
Why: Beverage Hydration Index multipliers >1 would nudge users toward milk/juice over water.

**D-24 — Drink database: USDA FoodData Central + national tables as reference; generic names only** (2026-10-08)
Consequence: `data/drinks.json` is a draft until verified (T-020).

**D-25 — App identifiers: `app.onemoresip` (prod), `app.onemoresip.dev` (dev); Flutter pinned to 3.47.2 via FVM** (2026-10-11)
Why: Matches the planned domain `onemoresip.app` (O-03); Play `applicationId` cannot change after the first upload. Dev flavor gets its own ID and the label `Sip! Dev` so both can be installed side by side. Dart package name is `onemoresip`.

**D-26 — Analytics off until consent; crash reporting on when configured** (2026-10-11)
Why: GDPR/EEA safety before the Privacy center (T-071) and UMP (T-090) exist. PostHog sends nothing until the user consents; Sentry runs whenever a DSN is set, with PII and health data scrubbed (no user, request, extras, messages, exception values or breadcrumb data). Supersedes the "opt-out" default in SD-9 for analytics. Both must be declared in App Privacy / Data safety (SC-13, SC-25).

**D-27 — Sippy never looks thirsty or tired under a fluid restriction** (2026-10-11)
Why: F-28 forbids nudging users with a doctor's limit to drink more; a thirsty/tired mascot is such a nudge. With `fluid_restricted`, `sippyStateFor` shows fresh instead. Extends DS-8.

**D-29 — Sippy is animated in Flutter from the SVG art, not Rive** (2026-10-11)
Why: No designer or `.riv` file is available; animating the existing SVG art in Flutter code avoids a dependency and keeps one art source.
Consequence: Supersedes the Rive part of D-21 and DS-8's Rive state machine; O-11 closes; no `rive` dependency.

**D-28 — DS-1b extended tokens approved; fonts bundled; Lucide icons** (2026-10-11)
Why: The Claude Design export (2026-10-09) needs more tokens than DS-1 had (dark values, tints, nav, high contrast). The T-008a audit found a name reused with a different value (`accentTint`) and WCAG failures: control borders `line`, `fieldBorder`, `handle`, `trackOff` at 1.3–2.1:1 (1.4.11 needs 3:1), white-92% text on light `accent` at 4.39:1, and the onboarding wheel picker (muted text at 60% on `mint`) at ~2.3:1. Font and icon choices were left open for T-010.
Consequence: DS-1b is merged into DS-1 (DS-1b keeps only a merge note). `line` becomes `#89867F` / `#6E7371` (≥ 3:1) and also serves inputs, sheet handle and switch off-track (`fieldBorder`, `handle`, `trackOff` dropped); `snack`/`onSnack` dropped (= `ink`/`onInk`); `halo` dropped (= `accentTint`/`mint`); status tokens renamed to `okBg/okFg`, `warnBg/warnFg`, `badBg/badFg` (replacing `warnTint/warnInk`, `dangerTint/dangerInk`, dark `warn`/`danger`, and `accentTint` as status bg), so `accentTint` now means `#E3F5F1` / `#163330`; `onAccent` and dark `accentInk` added; dark navbar is `#2B302E` without border; the selected nav tab gets the `accent` pill and labels are always visible, never color alone; secondary text on any tint uses `mutedOnTint`, with no text opacity; text on `sun` is `ink`. Fonts ship as bundled `.ttf` assets (no `google_fonts` runtime fetching): Plus Jakarta Sans (Latin) and IBM Plex Sans Arabic (Arabic). Icons: Lucide (`lucide_icons_flutter`). The export HTML stays the visual spec, but token values come from DS-1 wherever they differ; export colors outside DS-1 are mapped per the T-008a review, not copied.

**D-30 — Exact decorative colors and display letter-spacing** (2026-10-11)
Why: T-011 needs the glass water colors and the decorative `sun`/`coral` values, which DS-1 gave only as ranges ("translucent variants .45–.6") or as an ambiguous pair (`waterSoft`). The export sets tighter letter-spacing on the big numbers than DS-2 recorded.
Consequence: Dark `sun` = `rgba(242,184,92,.5)`, dark `coral` = `rgba(255,143,122,.5)`; light stays `#FFD27A` / `#FF9E87`. `waterSoft` is two water tones used in the glass in both themes (not a light/dark pair): primary water `water` `#4FD1C1`, back wave `waterBack` `#9BE8DE`. DS-2 keeps its sizes and adds letter-spacing `hero` −0.02em and `display` −0.01em. All four colors are decorative only (never text, never the only signal) and live in `AppColors`.

**D-31 — Catch-up and streak rules clarified; fluid-restricted streaks count logged days** (2026-10-11)
Why: BR-02 and BR-07 left three points open, and a streak that requires reaching a doctor's limit would nudge restricted users to drink up to it (F-28).
Consequence: "Behind by > 40%" means more than 40 percentage points below linear pace at or after 3/4 of the waking window. Catch-up suggestions are rounded down to 50 ml (at least 50 ml), capped at 500 ml and by the BR-06 hourly limit, and never shown under a fluid restriction. Freezes keep a streak alive without adding to its length and are only spent when they cover a whole gap. Under a fluid restriction a day counts toward the streak when anything was logged.

**D-32 — Local DB encryption via SQLite3MultipleCiphers (sqlite3 3.x hooks)** (2026-10-11)
Why: `sqlcipher_flutter_libs` (and `sqlite3_flutter_libs`) are end-of-life; `package:sqlite3` 3.x bundles SQLite through Dart build hooks and drift ≥ 2.32 uses it. SQLite3MultipleCiphers is MIT-licensed, needs no OpenSSL and tracks current SQLite.
Consequence: Supersedes the SQLCipher / `sqlcipher_flutter_libs` wording in SD-2 and the T-026 line. `pubspec.yaml` sets `hooks: user_defines: sqlite3: source: sqlite3mc` (default cipher ChaCha20-Poly1305); the binaries are downloaded at build time from the sqlite3.dart GitHub releases and checked against sha256 hashes shipped in the pub package. The key is 32 random bytes (hex) in Keychain (`first_unlock_this_device`, not synced) / Android Keystore-backed storage via `flutter_secure_storage`, applied with `PRAGMA key` before any other statement; the app refuses to open the DB if the cipher is missing or the key is wrong.

**D-33 — Local DB excluded from device backups** (2026-10-11)
Why: The DB key lives in Keychain (`this_device`) / Android Keystore and is not backed up, so a restored DB file could never be opened (D-32). Account data comes back through sync (T-062) instead.
Consequence: Android excludes `app_flutter/onemoresip.sqlite` (+ `-journal`, `-wal`, `-shm`) via `fullBackupContent` (Android 11 and lower) and `dataExtractionRules` (12+, cloud backup and device transfer); `allowBackup` stays default and other app data is still backed up. iOS stores the DB in `Library/Application Support/db/`, created and marked `isExcludedFromBackup` by a method channel in `AppDelegate.swift`. Guests without an account lose their local data when moving to a new phone; signed-in users restore via sync.

**D-34 — Fluid restriction input range and over-drinking thresholds** (2026-10-11)
Why: F-28 and BR-01a/BR-06 did not say which restriction values the user may enter, nor how the BR-06 hourly and daily limits apply under a restriction (owner decision, T-024).
Consequence: The doctor's limit is entered in ml, 500–3,000 ml in 50 ml steps; other values show a validation message and are not saved. The BR-06 hourly warning stays > 1,000 ml within 60 min for everyone. The daily warning threshold is the restriction value when one is set (BR-01a), otherwise max(goal × 1.6, 4,500 ml); when both warnings apply, the daily card is shown. Warnings never block logging. Copy that nudges the user to drink more uses ARB keys starting with `nudge` and is shown only through `SafetyPolicy.drinkMoreCopy`, so it disappears under a restriction.
