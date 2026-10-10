# Tasks — Phase 1 (until v1.0 is live in both stores)

> Related: [CLAUDE.md](../CLAUDE.md) · [Decisions](decisions.md) · [PRD](PRD.md) · [System Design](system-design.md) · [Design System](design-system.md) · [Store Compliance](store-compliance.md) · [Claude Design prompts](claude-design-prompts.md)

**Goal of Phase 1:** One More Sip v1.0 approved and released on the App Store and Google Play in the last week of January 2027, before Ramadan (~8 Feb 2027) — D-17.

**How to use this file** (see CLAUDE.md §7)
- Status: `[ ]` todo · `[~]` in progress · `[x]` done · `[!]` blocked (write why).
- Each task lists **Refs** (PRD `F-`/`BR-`, `SD-`, `DS-`, `SC-`, `UI-`), **Deps**, and **Verify** (definition of done).
- Owner = `Rendy` for non-code work; everything else is done with Claude Code and reviewed by Rendy.
- Dates are targets. If a milestone slips > 3 days, flag it to the owner.

## Timeline

| Milestone | Window | Exit criteria |
|---|---|---|
| M0 Foundation & design | 9 – 25 Oct | Project runs on both platforms, CI green, design system + key screens approved |
| M1 Core tracking | 19 Oct – 8 Nov | Onboarding, log, history, stats, Simple Mode work offline |
| M2 Reminders & widgets | 1 – 22 Nov | Reminders + actions + widgets on both platforms; 30-day reliability test started |
| M3 Accounts, sync, backend | 1 – 22 Nov | Auth, sync, RLS tests, website live |
| M4 Monetization | 16 Nov – 6 Dec | Sandbox purchases, entitlements, ads within policy |
| M5 Health, weather, fasting | 23 Nov – 13 Dec | Integrations + adaptive goal + Fasting Mode |
| M6 AI | 1 – 20 Dec | Photo, chat, insight, quota, top-up |
| M7 Family, kids, challenges | 7 – 27 Dec | Invite → consent → alert flow end-to-end |
| M8 Watch apps | 14 Dec – 3 Jan | Watch quick-add (checkpoint 20 Dec, Q-02) |
| M9 Quality | rolling, done by 3 Jan | i18n, a11y, security, performance signed off |
| M10 Beta & release | 2 – 29 Jan | Closed test 14 days, both stores approved, released |

---

## M0 — Foundation & design

- [~] **T-001 Create Flutter project** — flavors `dev`/`prod`, FVM pin, `very_good_analysis`, iOS 16 min, Android minSdk 28 + current required targetSdk, bundle/app IDs (owner confirms, e.g. `app.onemoresip`), display name `Sip!`.
  Refs: SD-2, SD-3.3, D-01 · Verify: both flavors run on iOS sim + Android emulator; label shows "Sip!".
  Note 2026-10-11: done per D-25 (targetSdk 36; dev label `Sip! Dev`). Android dev + prod verified on emulator. Open: iOS sim run needs a Mac (iOS flavors/schemes hand-written in `project.pbxproj`, not yet opened in Xcode). FVM symlink `.fvm/flutter_sdk` needs Windows Developer Mode; `fvm flutter …` works without it.
- [ ] **T-002 App skeleton** — folder layout, Riverpod, go_router with placeholder routes for UI-01…UI-18.
  Refs: SD-3.1–3.2 · Deps: T-001 · Verify: navigation smoke test passes.
- [ ] **T-003 CI** — GitHub Actions: format, analyze, test, secret scan, dependency audit.
  Refs: SD-11 · Verify: PR shows green checks; a planted fake secret fails the build.
- [ ] **T-004 Supabase projects** — `oms-dev`, `oms-prod`, CLI linked, `supabase/` folder, local stack.
  Refs: SD-11, Q-04 · Verify: `supabase start` + `db reset` work.
- [ ] **T-005 Telemetry wrappers** — Sentry + PostHog behind an allowlist API (only SD-9 events/props compile).
  Refs: SD-9, SC-13 · Verify: unit test rejects forbidden property names.
- [ ] **T-006 i18n** — ARB for EN, ID, AR, ES, PT; RTL smoke screen; string extraction rule in CI (no hard-coded strings in `presentation/`).
  Refs: F-27, D-20 · Verify: Arabic renders mirrored; lint flags a literal string.
- [ ] **T-007 Env config** — `env/dev.json`, `env/prod.json` with public values only; `.gitignore` for secrets.
  Refs: SD-3.3, SD-7 · Verify: build fails if a key name matches secret patterns.
- [x] **T-008 Claude Design: design system + key screens** (owner runs prompts UI-00…UI-18).
  Refs: claude-design-prompts.md, DS-1…DS-10 · Owner: Rendy · Verify: screens exported, reviewed against DS-6 checklist.
  Note 2026-10-09: all UI-00…UI-18 exported to `design/source/` and audited (`design/README.md`). Open: owner approval of DS-1b extended tokens (T-008a).
- [ ] **T-008a Approve extended tokens DS-1b** — owner reviews the tokens found in the design export; on approval merge into DS-1 and add a decision D-xx.
  Refs: DS-1b, design/README.md · Owner: Rendy · Deps: T-008 · Verify: DS-1b marked approved.
- [ ] **T-009 Design test with older adults** — 3–5 people 60+ try Simple Mode + onboarding prototype.
  Refs: F-11, Goal 3 · Owner: Rendy · Verify: findings logged as D-xx or tasks.
- [ ] **T-010 Theme** — tokens from DS-1/DS-2/DS-4 to `app/theme/`, light/dark, fonts, icon set decision.
  Refs: DS-1…DS-4, DS-1b, DS-7, design/source/Main + Components · Deps: T-008a · Verify: golden tests light/dark.
- [ ] **T-011 Core components** — DS-5 list incl. `QuotaMeter`, `AdCard`, `FloatingNavBar`.
  Refs: DS-5, DS-6 · Verify: golden tests at 100% and 200% text, LTR + RTL.
- [ ] **T-012 Feature flag service (kill switch)** — fetch + cache + 6 h refresh; default ON for reviewed features.
  Refs: F-33, SD-11, D-14, SC-01 · Verify: turning a flag off hides the feature without a crash; no code path enables unreleased features.
- [ ] **T-013 Sippy integration** — Rive state machine inputs (DS-8), static fallbacks, Reduce Motion.
  Refs: F-29, DS-8, design/source/Sippy.dc.html (SVG of all 7 states → static fallbacks now; Rive animation later) · Deps: Sippy `.riv` asset (O-11) · Verify: each state reachable in a debug screen.

## M1 — Core tracking

- [ ] **T-020 Verify drink database** — run `data/verify_fdc.py`, review `confidence: low` rows, set `verified: true`.
  Refs: F-03, D-24 · Deps: O-07 · Verify: report attached; all rows verified or removed.
- [ ] **T-021 Drink catalog** — bundle `drinks.json`, loader, search, favorites/recents, custom drinks, "Data sources" screen.
  Refs: F-03, BR-03 · Verify: search finds "es teh manis" in ID and "iced sweet tea" in EN.
- [ ] **T-022 Review goal constants** — check BR-01 values against EFSA/IOM/NHS sources; owner signs off.
  Refs: BR-01, Q-03 · Owner: Rendy (approve) · Verify: sources listed in `core/config/goal_rules.dart` comments.
- [ ] **T-023 Goal calculator** — BR-01 (base, restriction, weather, activity, kids, caps) pure Dart.
  Refs: BR-01, D-22 · Verify: ≥ 30 unit tests incl. edge cases.
- [ ] **T-024 Medical safety** — fluid restriction flow, BR-06 warnings, disclaimers.
  Refs: F-28, BR-01a, BR-06, SC-03 · Verify: tests: restriction disables adjustments, catch-up nudges and "drink more" copy.
- [ ] **T-025 Domain rules** — BR-02 catch-up, BR-03 counting, BR-07 streak.
  Refs: BR-02, BR-03, BR-07 · Verify: unit tests.
- [ ] **T-026 Local DB** — Drift schema (SD-4.2) + SQLCipher + key in secure storage + migrations.
  Refs: SD-4.2, SD-7 · Verify: DB file unreadable without key; migration test.
- [ ] **T-027 Repositories** — profiles, logs, settings, outbox writes in same transaction.
  Refs: SD-3.2, SD-5 · Verify: repository tests.
- [ ] **T-030 Onboarding** (UI-02).
  Refs: F-01, UF-01 · Deps: T-023, T-024 · Verify: completes ≤ 90 s; 200% text; skips work; widget test.
- [ ] **T-031 Home** (UI-03) — hero number, progress, status badge, Sippy, quick-add, FAB, education card slot.
  Refs: F-02, F-29, DS-5 · Verify: log in ≤ 2 taps; RTL + 200% goldens.
- [ ] **T-032 Log sheet, drink picker, custom volume, undo** (UI-04, UI-05).
  Refs: F-02, F-03, UF-04 · Verify: undo within 5 s restores state; works offline.
- [ ] **T-033 History** with edit/delete (UI-09).
  Refs: F-14 · Verify: edits recalculate today and streak.
- [ ] **T-034 Statistics** — 7-day free, full premium gate, CSV export (premium).
  Refs: F-14, §7.1 · Deps: T-085 for gate · Verify: free user sees lock card after 7 days.
- [ ] **T-035 Streaks & achievements**.
  Refs: F-15, BR-07 · Verify: freeze auto-applies; tests.
- [ ] **T-036 Micro-education** — 60 tips (EN + ID first, then translations), sources cited.
  Refs: F-16, SC-03 · Verify: owner review of content.
- [ ] **T-037 Simple Mode** (UI-03b).
  Refs: F-11, DS-3, DS-6 · Verify: TalkBack/VoiceOver walkthrough; no navbar/ads; voice confirmation.
- [ ] **T-038 Progressive discovery cards**.
  Refs: F-31 · Verify: one card/day for 7 days; never in Simple Mode.

## M2 — Reminders, notifications, widgets

- [ ] **T-040 Reminder planner** (domain) — schedule from settings, BR-09 skips, catch-up amounts, DST/time-zone.
  Refs: F-04, F-05, BR-02, BR-09, SD-8 · Verify: unit tests incl. DST and quiet hours.
- [ ] **T-041 Android scheduling** — channels, inexact alarms, optional `SCHEDULE_EXACT_ALARM` with rationale, boot receiver, WorkManager re-plan.
  Refs: SD-8, SC-22 · Verify: survives reboot and app update; never declares `USE_EXACT_ALARM`.
- [ ] **T-042 iOS scheduling** — rolling window under 64, BGAppRefresh, re-plan on log.
  Refs: SD-8 · Verify: 7-day simulated schedule never exceeds 64 pending.
- [ ] **T-043 Notification categories & settings** — promotions default OFF.
  Refs: F-06, SC-08 · Verify: each category toggle works independently.
- [ ] **T-044 Notification actions** — "✓ 250 ml" and "Later" without opening the app.
  Refs: F-04, UF-02, SD-3.4 · Verify: log appears after app opens from killed state, on both platforms.
- [ ] **T-045 Notification health check + brand guides** (UI-14).
  Refs: F-04, SD-8, SC-28 · Verify: detects disabled permission & battery optimization on a Xiaomi and a Samsung.
- [ ] **T-046 Reminder settings UI** (UI-14) — interval/fixed, weekdays, quiet hours, texts, vibration.
  Refs: F-04 · Verify: widget tests.
- [ ] **T-050 Shared-store bridge** — App Group / SharedPreferences, pending log queue import.
  Refs: SD-3.4 · Verify: logs from widget/action/intent are imported exactly once.
- [ ] **T-051 iOS widgets** — home (S/M), lock screen, interactive quick-add (iOS 17+).
  Refs: F-07, SC-06 · Verify: widget updates within 1 min of a log; no ads.
- [ ] **T-052 iOS Live Activity** — today's progress, quick-add.
  Refs: F-07 · Verify: starts/ends correctly; off by default.
- [ ] **T-053 Android widgets** (Glance) with quick-add.
  Refs: F-07 · Verify: works with app killed.
- [ ] **T-054 Android ongoing progress notification** (optional, default off).
  Refs: F-06 · Verify: toggle works; no FGS misuse.
- [ ] **T-055 Voice & shortcuts** — App Intents (Siri), Android app shortcuts (+ Assistant if supported).
  Refs: F-30 · Verify: "Log a glass in Sip!" works on iOS.

## M3 — Accounts, sync, backend, website

- [ ] **T-060 SQL migrations** — all tables in SD-4.1, triggers for `updated_at`.
  Refs: SD-4.1 · Verify: `supabase db reset` clean.
- [ ] **T-061 RLS + pgTAP tests** — every table; money/quota tables read-only for clients.
  Refs: SD-7, CLAUDE.md §8 · Verify: test suite in CI; stranger access denied everywhere.
- [ ] **T-062 Sync engine** — outbox push, incremental pull, LWW, soft deletes, guest re-key.
  Refs: F-26, SD-5 · Verify: offline 3 days → online → no duplicates/loss (integration test).
- [ ] **T-063 Edge Function shared lib** — auth, zod, error format, rate limit helper, logging scrubber.
  Refs: SD-6, SD-7 · Verify: deno tests.
- [ ] **T-064 Attestation** — App Attest + Play Integrity on client and verification on server; debug allowlist.
  Refs: SD-7 · Verify: request from curl without token is rejected.
- [ ] **T-065 Push** — Firebase project (FCM only), token registration, `push-send`.
  Refs: SD-6, SD-8 · Deps: O-10 · Verify: test push to both platforms; payload contains no health values.
- [ ] **T-066 Website** (`web/`, Next.js on Vercel) — landing, privacy, terms, support, delete-account form, `/i/:token` fallback, AASA, assetlinks.
  Refs: F-36, SC-26, SC-40 · Deps: O-03 · Verify: universal/app links open the app.
- [ ] **T-070 Auth** — guest → account; email OTP with Resend SMTP; Sign in with Apple; Google Sign-In; RevenueCat alias.
  Refs: F-25, D-19, SC-10 · Deps: O-10 · Verify: data survives guest → account upgrade.
- [ ] **T-071 Privacy center** — data view, export, consents (ads, analytics, AI), Health permissions shortcut.
  Refs: F-32, SC-05 · Verify: export contains only own data.
- [ ] **T-072 Account deletion** — in-app + web flow, `account-delete` function.
  Refs: F-25, SC-05, SC-26 · Verify: all rows gone; RevenueCat subscription note shown (cancel in store).
- [ ] **T-073 Settings** — language, units, theme, text size boost, high contrast, reduce motion, haptics.
  Refs: F-27, DS-6 · Verify: language switch without restart; RTL.

## M4 — Monetization

- [ ] **T-080 RevenueCat & store products** — products/entitlements/offering per PRD §7.2; trial on 12M.
  Refs: F-22, D-07, D-08, D-13 · Deps: O-04 · Verify: sandbox purchase of each product.
- [ ] **T-081 Paywall** (UI-10) — plans, trial terms, what's included, restore, terms/privacy, manage subscription.
  Refs: F-22, SC-04, SC-30 · Verify: copy matches SC-04 checklist in 5 languages.
- [ ] **T-082 `revenuecat-webhook`** — entitlements upsert, trial flag, family propagation, idempotency.
  Refs: SD-6.1 · Verify: replayed events don't double-apply; family members gain/lose premium.
- [ ] **T-083 Remove Ads purchase + Restore**.
  Refs: F-23, D-06, SC-14 · Verify: restore on second device removes ads.
- [ ] **T-084 AI top-up** — consumable purchase → server credits (idempotent).
  Refs: F-21, D-12, SC-14 · Verify: credits never expire; double webhook = single credit.
- [ ] **T-085 Entitlement gating** — providers for premium/family/remove_ads; server check for server features.
  Refs: SD-6.1 · Verify: tampered local flag cannot unlock server features.
- [ ] **T-090 AdMob + UMP + ATT** — non-personalized requests, consent before load.
  Refs: F-24, SC-06, SC-24 · Deps: O-04 · Verify: EEA test device sees UMP; no ad request before consent.
- [ ] **T-091 Native ad in History** (every ~10 entries) with "Report ad".
  Refs: PRD §8, SC-06 · Verify: matches AdCard spec.
- [ ] **T-092 Banners** — bottom of Stats and Settings.
  Refs: PRD §8 · Verify: never overlaps controls at 200% text.
- [ ] **T-093 Rewarded ads + `admob-ssv`** — streak freeze, theme 24 h.
  Refs: SD-6.4, SC-15 · Verify: reward granted once per SSV transaction.
- [ ] **T-094 Ad guard tests** — no ad widgets in Home, onboarding, paywall, Simple Mode, kids, premium/remove_ads users.
  Refs: PRD §8 · Verify: widget tests enumerate routes.

## M5 — Health, weather, fasting

- [ ] **T-100 Apple Health** — write water/caffeine, read workouts/steps/active energy/weight.
  Refs: F-08, SC-07 · Verify: entries appear in Health; AI logs only after confirmation.
- [ ] **T-101 iOS permission strings** (localized) + primers.
  Refs: SC-12 · Verify: review all `Info.plist` usage descriptions.
- [ ] **T-102 Health Connect** — write HydrationRecord, read exercise/steps/weight; permission rationale activity.
  Refs: F-08, SC-21 · Verify: data visible in Health Connect app.
- [ ] **T-103 Samsung Health Data SDK** — platform channel + compile-time flag; excluded from release builds until approved.
  Refs: F-08, D-16, SC-01 · Deps: O-06 · Verify: release build without approval contains no Samsung UI/code path.
- [ ] **T-104 Activity-adaptive goal** (Premium).
  Refs: F-09, BR-01c · Verify: 60 min workout → +700 ml, capped.
- [ ] **T-120 Coarse location** — permission primer, geohash-5, manual city fallback.
  Refs: F-09, SC-12 · Verify: precise location never requested.
- [ ] **T-121 `weather` function** — WeatherKit REST (JWT), cache, attribution data.
  Refs: SD-6, SC-16 · Deps: O-10 · Verify: cache hit for same geohash/day; attribution shown.
- [ ] **T-122 Weather-adaptive goal + explanation UI**.
  Refs: F-09, BR-01b · Verify: disabled when fluid restriction set.
- [ ] **T-123 Fasting Mode settings** (UI-13) — types, calc method, adhan times, BR-04 split.
  Refs: F-10, BR-04, D-15 · Verify: times match a reference timetable for Jakarta, Riyadh, London, New York (±2 min).
- [ ] **T-124 Fasting reminders & Sippy waiting state**.
  Refs: F-10, BR-09, DS-8 · Verify: zero reminders during fasting hours (7-day sim).
- [ ] **T-125 Ramadan promo banner** — date-driven in-app banner pointing to the already-visible Fasting Mode.
  Refs: D-15 · Verify: banner is content only; feature works without it.

## M6 — AI (Premium)

- [ ] **T-110 AI provider abstraction** — `_shared/ai.ts`, Haiku 5.5 config, prompt caching, max_tokens.
  Refs: SD-10, D-09 · Deps: O-10 · Verify: model swap via env var only.
- [ ] **T-111 AI consent screen**.
  Refs: SC-09, F-18 · Verify: no AI request possible before consent.
- [ ] **T-112 Quota RPC** — `consume_ai_quota`, `refund_ai_quota`, daily/monthly/trial/credits.
  Refs: BR-05, SD-6.2 · Verify: pgTAP incl. 20 concurrent requests never over-consume.
- [ ] **T-113 AI photo** — `ai-photo` function + camera/picker UI + resize + confirm/edit (UI-06).
  Refs: F-18, SD-10 · Verify: photo not stored server-side; JSON validated; quota returned.
- [ ] **T-114 AI eval set** — 50 photos incl. local drinks; accuracy report.
  Refs: SD-10 · Verify: ≥ 80% category correct, volume ±30%; else tune prompt/candidates.
- [ ] **T-115 Ask Sippy chat** (UI-07) — `ai-chat`, safety prompt, quota header.
  Refs: F-20 · Verify: red-team list (diagnosis, medication, "ignore instructions") handled.
- [ ] **T-116 Weekly insight** — cron + function + UI (UI-08) + digest push.
  Refs: F-19, SD-6.3 · Verify: no identity in model input; restriction honored.
- [ ] **T-117 Quota meter states** — Normal/Low/Empty, 80% notification, empty → manual fallback + top-up.
  Refs: F-21, DS-5 · Verify: goldens of three states.
- [ ] **T-118 Free AI demo** — pre-computed result + paywall, no API call.
  Refs: D-10, UF-05 · Verify: network inspector shows no AI request for free users.

## M7 — Family, kids, challenges

- [ ] **T-135 `family-invite` + deep links** — create/accept/revoke, hashed tokens, 72 h, single use.
  Refs: F-13, SD-6, SD-7 · Deps: T-066 · Verify: expired/used token rejected.
- [ ] **T-136 Family UI** (UI-12) — overview, member detail, invite share (link + QR).
  Refs: F-13, BR-08 · Verify: caregiver sees % and last log only.
- [ ] **T-137 Consent & sharing controls** — `share_progress`, `allow_remote_setup`, revoke any time.
  Refs: F-13, BR-08 · Verify: revoking hides data immediately.
- [ ] **T-138 Caregiver alerts** — `caregiver-check` cron + push.
  Refs: F-13, SD-6, SD-8 · Verify: alert fires once after N hours without logs, not during quiet/fasting hours.
- [ ] **T-139 Remote setup** — caregiver edits member reminders/goal/Simple Mode with permission.
  Refs: F-13, UF-10 · Verify: change syncs to member device; audit note shown to member.
- [ ] **T-140 Kids profiles** — managed profile, age-bracket goal, no ads/AI/chat.
  Refs: F-12, BR-01d, SC-11, SC-27 · Verify: ad guard + AI guard tests for child profile.
- [ ] **T-145 Challenges** (UI-11) — create/join by code, leaderboard by % of goal.
  Refs: F-17 · Verify: no volumes exposed via RPC.

## M8 — Watch apps

- [ ] **T-150 Confirm watch OS minimums & packages**.
  Refs: F-35, PRD §10 · Verify: decision noted in decisions.md.
- [ ] **T-151 Apple Watch app** — progress, quick-add, complication; WatchConnectivity + queue.
  Refs: F-35, SD-3.4 · Verify: log from watch appears on phone.
- [ ] **T-152 Wear OS app** — progress, quick-add, tile; Data Layer + queue.
  Refs: F-35, SD-3.4 · Verify: same as above.
- [ ] **T-153 Checkpoint 2026-12-20** — owner decides whether watch apps stay in v1.0.
  Refs: Q-02 · Owner: Rendy · Verify: decision recorded as D-xx.

## M9 — Quality

- [ ] **T-130 Translations** — all ARB keys in 5 languages; native-speaker review for health texts (at least ID, AR).
  Refs: F-27, D-20 · Verify: missing-key check = 0.
- [ ] **T-131 Health copy & disclaimers review** — onboarding, AI, education, store text.
  Refs: SC-03, SC-41, F-28 · Verify: no medical claims; disclaimer present.
- [ ] **T-132 RTL & 200% text audit** — every screen.
  Refs: DS-6 · Verify: golden set passes.
- [ ] **T-133 Screen reader pass** — VoiceOver + TalkBack on all flows UF-01…UF-15.
  Refs: DS-6 · Verify: checklist complete.
- [ ] **T-160 Reminder reliability matrix (30 days)** — Xiaomi, Oppo, Vivo, Samsung, Realme, Pixel, iPhone. **Start by 1 Dec** with internal builds.
  Refs: F-04, Goal 2, SD-12 · Owner: Rendy · Verify: ≥ 95% expected reminders fired per device.
- [ ] **T-161 Performance** — cold start ≤ 2 s on mid-range Android; app size ≤ 60 MB.
  Refs: PRD §10 · Verify: measurements recorded.
- [ ] **T-162 Security review** — secrets scan, RLS coverage, attestation, rate limits, logs scrubbed, dependency audit.
  Refs: SD-7 · Verify: checklist signed by owner.
- [ ] **T-163 Integration test suite** — UF-01…UF-15 critical paths on device farm or local devices.
  Refs: SD-12 · Verify: green on both platforms.

## M10 — Beta & release

- [ ] **T-170 Play closed test** — ≥ 12 (aim 15–20) testers opted in for 14 continuous days. **Start no later than 4 Jan 2027.**
  Refs: SC-23, D-18 · Deps: O-08 · Verify: Play Console shows eligibility for production access.
- [ ] **T-171 TestFlight external beta** (beta app review).
  Refs: SD-11 · Verify: ≥ 10 iOS testers.
- [ ] **T-172 Beta fixes** — triage feedback, crash-free ≥ 99.5%.
  Refs: §3 · Verify: no open P0/P1.
- [ ] **T-180 Policy re-check** — re-read every source in store-compliance.md; target API level; update SC table.
  Refs: SC-29, all SC · Verify: dated note added to store-compliance.md.
- [ ] **T-181 Review notes & demo accounts** — Premium, Family owner, Family member; how to test each feature.
  Refs: SC-01, SC-02, SC-44 · Verify: a fresh person can test every feature from the notes.
- [ ] **T-182 Metadata check** — no "for kids", no competitor names, no medical claims.
  Refs: SC-11, SC-42 · Verify: checklist.
- [ ] **T-183 Apple privacy** — App Privacy labels, privacy manifests (all SDKs), encryption answer.
  Refs: SC-13, SC-18 · Verify: matches SD-9 inventory.
- [ ] **T-184 Play declarations** — Health apps, Health Connect, Data safety, target audience, content rating, ads declaration.
  Refs: SC-20, SC-21, SC-25, SC-27, SC-43 · Verify: all forms accepted.
- [ ] **T-185 Privacy policy & terms** — drafted, **reviewed by a lawyer**, published on website (EN + ID min).
  Refs: SC-40 · Owner: Rendy · Verify: URLs live; links in app and stores.
- [ ] **T-186 Store listings** — title "One More Sip: Water Reminder", subtitle, descriptions, keywords, screenshots (3–4 hero features), preview video, 5 languages.
  Refs: SC-42, D-01 · Verify: owner approval.
- [ ] **T-187 Submit iOS** (+ IAP products in the same submission).
  Refs: SC-02 · Target: 18–20 Jan · Verify: approved.
- [ ] **T-188 Play production** — staged rollout 10 → 50 → 100%.
  Refs: SD-11 · Target: after T-170 · Verify: live.
- [ ] **T-189 Launch day checks** — webhooks, push, AI budget alarm, Sentry alerts, kill switches tested in prod.
  Refs: SD-13 · Verify: checklist complete. **Phase 1 done.**

---

## Owner tasks (non-code)

- [ ] **O-01** Search "One More Sip" in App Store & Play Store (several countries).
- [ ] **O-02** Trademark search WIPO Global Brand Database + PDKI DJKI (class 9, also 42/44); consider filing in Indonesia.
- [ ] **O-03** Buy domain (`onemoresip.app` / `.com`), reserve `@onemoresip` on Instagram, TikTok, X, YouTube.
- [ ] **O-04** Apple Developer Program + Google Play Console (individual, D-18); App Store Connect app record (reserves the name); Paid Apps Agreement; tax (W-8BEN); bank accounts; Play payments profile. → unblocks T-080, T-090.
- [ ] **O-05** Apple Small Business Program; Google Play account group + 15% tier enrollment.
- [ ] **O-06** Apply for Samsung Health partnership. → unblocks T-103.
- [ ] **O-07** USDA FDC API key → unblocks T-020.
- [ ] **O-08** Recruit 15–20 Android testers + 10 iOS testers (Google accounts, active for 14 days). → unblocks T-170.
- [ ] **O-09** After launch: RevenueCat Experiments on tier-1 prices (D-08).
- [ ] **O-10** Service accounts: support email (`support@onemoresip.app`), Resend, Anthropic API (set budget cap), WeatherKit key, Firebase project (FCM), Sentry, PostHog, AdMob account. → unblocks T-065, T-070, T-110, T-121.
- [ ] **O-11** Sippy illustration & Rive file (designer or self-made) based on DS-8. → unblocks T-013.
- [ ] **O-12** Pajak, rekening, dan konsultasi pajak penghasilan (owner menangani sendiri).
