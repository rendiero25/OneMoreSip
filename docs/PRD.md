# PRD — One More Sip

> Related: [CLAUDE.md](../CLAUDE.md) · [Decisions](decisions.md) · [System Design](system-design.md) · [Design System](design-system.md) · [Store Compliance](store-compliance.md) · [Tasks](task.md) · [Claude Design prompts](claude-design-prompts.md)

| | |
|---|---|
| Version | 1.0 (Phase 1 scope = app v1.0) |
| Status | Approved for development |
| Owner | Rendy (rendiero) |
| Last updated | 2026-10-09 |
| Target release | Last week of January 2027 (before Ramadan ~8 Feb 2027) — D-17 |

---

## 1. Overview

### 1.1 Problem
Most people forget to drink water, not because they don't want to. Existing apps either nag, bury the log button under ads, lock core features behind paywalls, break their reminders after a week, or are unusable for older eyes and hands. None handle fasting, tropical heat, or families looking after an elderly parent.

### 1.2 Vision
A warm, honest water companion for the whole family. Logging takes one tap from anywhere (notification, widget, voice). The app adapts to your body, your weather and your fasting schedule, and helps people understand *why* water matters.

### 1.3 Goals (v1.0)
1. Logging a drink takes **≤ 1 tap** from a notification or widget, **≤ 2 taps** in-app.
2. Reminders keep working after 30 days on the top Android brands in our markets (Xiaomi, Oppo, Vivo, Samsung, Realme) and on iOS.
3. A 75-year-old can onboard and log in Simple Mode without help.
4. Pass App Store and Google Play review on the first or second submission.
5. Ship before Ramadan 2027.

### 1.4 Non-goals (v1.0)
- Medical diagnosis or treatment advice of any kind.
- Calorie / full nutrition tracking.
- Social feed or public profiles.
- Web app (only a small marketing/legal website).

---

## 2. Users

| Persona | Needs | Key features |
|---|---|---|
| **Busy adult** (25–45, office/remote) | Forgets to drink during work; wants zero friction | Smart reminders, notification actions, widgets, AI photo log, office challenges |
| **Older adult** (60+) | Large text, simple flow, no confusing popups | Simple Mode, voice confirmation, caregiver link |
| **Caregiver** (adult child) | Peace of mind about parent's hydration from afar | Family Mode alerts, remote setup |
| **Parent of young kids** | Teach kids to drink water | Kids profile (managed), playful Sippy |
| **Fasting user** (Ramadan / intermittent) | Hydrate well in a short window | Fasting Mode with 2-4-2 split |
| **Hot-climate user** | Needs more water on hot days | Weather-adaptive goal |

Markets: global; first focus Indonesia + English-speaking tier-1 + Middle East / Muslim-majority markets (D-03).

---

## 3. Success metrics

| Metric | Target at 90 days post-launch |
|---|---|
| D1 / D7 / D30 retention | ≥ 40% / ≥ 20% / ≥ 10% |
| Users meeting daily goal ≥ 4 days/week (of WAU) | ≥ 35% |
| Reminder → log conversion | ≥ 25% |
| Trial → paid conversion | ≥ 35% |
| Free → paid (any purchase) | ≥ 3% of MAU |
| Store rating | ≥ 4.5 |
| Crash-free sessions | ≥ 99.5% |

Measured without sending health values to analytics (SD-9).

---

## 4. Positioning & differentiators

> "One more sip." — the friendliest water app, for every age.

1. **Ads never stand between you and your water.** No ads on Home, notifications, widgets, Simple Mode, kids.
2. **Built for grandparents too.** Simple Mode, large type, voice feedback, caregiver alerts.
3. **Knows your day.** Weather, activity and fasting-aware goals; smart catch-up.
4. **Knows your drinks.** Local drinks from 12 markets, sugar and caffeine estimates, AI photo logging.
5. **Reminders that keep working.** Brand-specific battery guidance and a notification health check.
6. **Honest money.** Remove Ads is permanent; AI top-ups never expire.

---

## 5. Features

Tier: **Free**, **Premium** (any premium plan or trial), **Family** (Family plan). Every feature below is in scope for v1.0 unless marked otherwise.

### Core

**F-01 Onboarding & personalized goal** — Free
Steps: language → name → units (ml / fl oz, auto from locale) → weight → activity level → wake & sleep time → "Has a doctor limited how much you can drink?" (yes → enter limit) → experience choice (**Normal** / **Simple**) → goal result with explanation → notification permission primer → (Android) battery-optimization guide → optional Health permission primer → optional account creation.
- Guest mode by default; no account required to use the app.
- Goal is calculated by BR-01. The user can override it manually.
- AC: completes in ≤ 90 s; every step works at 200% text size; can skip optional steps.

**F-02 Drink logging** — Free
- Quick-add buttons (default 150 / 250 / 350 / 500 ml, editable) and a custom volume picker.
- Drink type picker from the drink database (F-03); favorites and recents first.
- Every log shows an **Undo** snackbar for 5 s; logs can be edited or deleted from History.
- Sources: in-app, notification action, widget, voice, Live Activity, watch, AI photo, health import.
- AC: log from Home in ≤ 2 taps; offline logging always works.

**F-03 Drink database & hydration counting** — Free
- Bundled `data/drinks.json` (≥ 160 drinks, 12 markets). Shows sugar and caffeine estimates.
- Counting rule BR-03 (D-23). Alcohol can be logged but counts 0 and is never encouraged.
- Custom drinks: name, icon, water %, sugar, caffeine.
- "Data sources" screen credits USDA FoodData Central and others; values labeled as estimates.

**F-04 Reminders** — Free (smart features Free; text styles Free)
- Interval or fixed-time schedule, per weekday; wake/sleep window; quiet hours.
- **Smart skip**: no reminder if the user logged within the last 30 min (configurable).
- Default cap 8–12 reminders/day.
- Varied, customizable reminder texts in Sippy's voice; optional vibration patterns (short-short-long etc.) for smart bands.
- Notification actions: **"✓ 250 ml"** (user's default size) and **"Later 15 min"**.
- **Notification health check**: detects disabled permission, battery optimization, exact-alarm denial; guides the user per phone brand.
- AC: reminders still fire after 30 days in the device matrix (task T-160).

**F-05 Smart Catch-up** — Free
If the user is behind pace, the remaining amount is redistributed over the remaining waking hours (BR-02), never stacked into the last hour, and never above the safe hourly limit (BR-06).

**F-06 Notification center & categories** — Free
Categories, each toggleable: (1) Drink reminders, (2) Progress (Android ongoing notification, iOS Live Activity — default off), (3) Family alerts, (4) Weather goal change (max 1/day), (5) Achievements & weekly insight (digest), (6) Promotions (**default OFF**, explicit opt-in — SC-08).

**F-07 Widgets & Live Activity** — Free
- iOS: small/medium home widgets, lock-screen widgets, interactive quick-add (iOS 17+), Live Activity for today's progress.
- Android: home widgets (Glance) with quick-add buttons.
- No ads in any widget (SC-06).

**F-08 Health integrations** — Free (read activity for goal adjustment is Premium, see F-09)
- Apple Health (HealthKit): write water (and caffeine), read workouts/steps/active energy, read body mass.
- Health Connect: write `HydrationRecord`, read exercise sessions/steps, read weight.
- Samsung Health Data SDK: same data scope; **compiled into a release only after Samsung partner approval** (D-16).
- Fitbit: on Android via Health Connect when the user's Fitbit app syncs there. Fitbit on iOS → v2.
- Only data types listed here are requested (SC-12). AI-photo logs are written to Health only after user confirmation.

**F-09 Adaptive goal (weather + activity)** — Premium
- Weather: daily max temperature & humidity at the user's approximate location (WeatherKit) adjust the goal (BR-01b). Works for cold/dry and altitude too.
- Activity: workout minutes from Health sources adjust the goal (BR-01c).
- Each adjustment is explained ("34°C today, +500 ml") and can be turned off.
- Disabled automatically when a fluid restriction is set (F-28).

**F-10 Fasting Mode** — Free, available all year (D-15)
- Types: Ramadan, Monday–Thursday, Ayyamul Bidh, custom days, intermittent fasting window (e.g. 16:8).
- Suhoor/iftar times computed on-device (adhan algorithm) from location and a calculation method (auto by country, user-selectable).
- During fasting hours: no drink reminders; Sippy shows a "waiting" state; logging still allowed with no judgement.
- Eating window: goal split by BR-04 (default 2-4-2 pattern), reminders only inside the window.
- Ramadan promotion (banner, App Store In-App Event) is marketing, not a feature toggle.

**F-11 Simple Mode (older adults)** — Free
- One screen: Sippy, glass-fill progress, one giant button "I drank 1 glass" (default 250 ml), "Undo" button.
- Text scale baseline larger (DS-3), high-contrast option, voice confirmation ("Saved, one glass"), haptic feedback.
- No navbar, no ads, no swipe-only actions, no confirmation dialogs (Undo instead).
- Settings entry behind a long-press or a small "Settings" text button with a confirmation step; caregiver can configure remotely (F-13).

**F-12 Kids profile** — Family
- A managed profile under the parent's account (no separate login, no email). Age bracket goal (BR-01d).
- Playful Sippy, stickers for streaks; **no ads, no AI, no chat, no challenges with strangers**.
- The app is **not** listed in the Kids category and metadata never says "for kids" (SC-11).

**F-13 Family / Caregiver Mode** — Family
- Owner invites up to **4 members** (5 people total) by link/QR; invite tokens expire in 72 h and are single-use.
- Each member explicitly consents to what is shared: daily progress %, last drink time (never individual drinks).
- Caregiver alerts: "Mom hasn't logged a drink since 10:00" — rule per member: no log for N hours inside their waking window.
- Remote setup: with the member's permission, a caregiver can change the member's reminders, goal and Simple Mode.
- Members get Premium features through the Family entitlement.

**F-14 Statistics & history** — Free: last 7 days; Premium: full history, monthly/yearly, export CSV
- Day / week / month views, average, best day, goal-met days, caffeine & sugar totals.
- History list with edit/delete. Native ad slot in history for free users (F-24).

**F-15 Streaks & achievements** — Free
- Streak of goal-met days; **streak freeze** (1 free per month; extra via rewarded ad for free users, unlimited-ish 4/month for Premium).
- Achievements: first log, 7-day streak, early bird, Ramadan complete, etc.

**F-16 Daily micro-education** — Free
- One short fact per day (signs of dehydration, urine color guide, coffee myth…). Sources: WHO, EFSA, NHS, cited in-app. Each health tip ends with "consult your doctor" where relevant.

**F-17 Challenges** — Premium
- Create a challenge (7/14/30 days) with friends or an office team via invite code; leaderboard by **% of personal goal**, never by volume. Display names only.

### AI (Premium only — D-10)

**F-18 AI photo drink logging**
- Take/choose a photo → Edge Function → Haiku 5.5 returns `{drink_id or "custom", name, volume_ml, sugar_g, caffeine_mg, confidence}` mapped to the drink database → **user confirms/edits before saving**.
- Photos are resized on-device (max 1024 px, JPEG) and **not stored** on our server.
- Free users tapping the camera see a pre-computed demo (no API call) + paywall.
- Explicit consent screen before first use: photo is sent to a third-party AI provider (SC-09).

**F-19 AI weekly insight**
- Every Monday 06:00 local: a short personalized summary from aggregated stats (no raw logs, no identity). Delivered in-app + digest notification.

**F-20 Ask Sippy (chat)**
- Hydration Q&A with a strict system prompt: no diagnosis, no medication advice; redirects to a doctor; honors fluid restriction. Text only, no tools.
- Not available in Kids profiles.

**F-21 AI quota meter & top-up**
- Quotas per BR-05. Meter visible in Chat header, Camera header and Premium screen.
- States: Normal (> 20% left), Low (≤ 20%, one notification at 80% used), Empty (0 → camera falls back to manual picker, "Top up" button).
- Top-up pack (consumable) for Premium only; never expires; used after monthly quota.

### Monetization

**F-22 Subscriptions & paywall** — see §7
- RevenueCat offerings; plans 1/3/6/12 months + Family 12 months; 7-day trial on 12-month Premium.
- Paywall shows price, period, renewal terms, trial end date, Restore, Terms, Privacy, and what's included (incl. AI quotas) (SC-04).

**F-23 Remove Ads** — one-time, non-consumable, permanent, restorable.

**F-24 Ads (free version)** — see §8.

### Platform

**F-25 Accounts & auth** — Free
- Guest (local only) → upgrade any time without losing data.
- Email OTP (passwordless), Sign in with Apple, Google Sign-In (D-19).
- In-app account deletion + web deletion request page (SC-05).

**F-26 Offline-first sync** — Free (requires account)
- All features except AI, weather, family and challenges work offline. Sync when online (SD-5).

**F-27 Settings, i18n & accessibility** — Free
- Languages EN, ID, AR (RTL), ES, PT; units ml / fl oz; 12/24 h.
- Theme light/dark/system; text size (follows system + in-app boost); high contrast; reduce motion; haptics; sound.

**F-28 Medical safety** — Free
- Fluid restriction from a doctor overrides everything (BR-01a).
- Over-drinking warning (BR-06).
- Disclaimer in onboarding, About and AI screens: "One More Sip is not a medical device".

**F-29 Sippy mascot** — Free (extra themes/outfits Premium)
- Rive state machine with 6 core expressions + fasting-waiting (DS-8). Reacts to progress, night, fasting, celebration.

**F-30 Voice & shortcuts** — Free
- iOS App Intents / Siri: "Log a glass in Sip!". Android: app shortcuts (long-press icon) and Assistant integration if supported at implementation time (verify).

**F-31 Progressive feature discovery** — Free
- Day 1 shows only tracking + reminders. Over the first week, small dismissible Home cards introduce one feature per day. Simple Mode users never see them.

**F-32 Privacy center** — Free
- See what's stored, export my data (JSON/CSV), delete account, manage consents (ads, analytics, AI), manage Health permissions.

**F-33 Feature flags (kill switches)** — internal (D-14)

**F-34 Analytics & crash reporting** — internal, privacy-preserving (SD-9)

**F-35 Watch apps** — Free
- Apple Watch (SwiftUI) and Wear OS (Compose): today's progress, quick-add, complication/tile. No ads.
- Scope risk: see Open Questions Q-02.

**F-36 Marketing website** — internal
- `onemoresip.app` (Next.js on Vercel): landing, privacy policy, terms, account-deletion request, support, invite-link fallback, `apple-app-site-association`, `assetlinks.json`.

---

## 6. Business rules

**BR-01 Daily goal** (deterministic, D-22). Constants live in one config file and are unit-tested. Values are an initial heuristic to be reviewed against sources before release (T-022).
- **BR-01 base**: `weight_kg × 33 ml`, rounded to nearest 50 ml, clamped to **1,500–3,700 ml**. Without weight: 2,000 ml (women) / 2,500 ml (men) / 2,200 ml (unspecified), from EFSA adequate intake for total water × ~0.8 beverage share.
- **BR-01a fluid restriction**: if set → goal = doctor's value, no adjustments, no catch-up nudges, no "drink more" copy, over-drinking threshold = restriction value.
- **BR-01b weather** (Premium): daily max feels-like temp ≥ 27°C → +250 ml; ≥ 30°C → +500 ml; ≥ 33°C → +750 ml; relative humidity ≥ 70% and temp ≥ 27°C → extra +150 ml; altitude ≥ 2,500 m → +250 ml. Max total weather adjustment +1,000 ml.
- **BR-01c activity** (Premium): +350 ml per 30 min of recorded exercise, max +1,000 ml/day.
- **BR-01d kids** (by age bracket, beverage target): 4–8 y 1,200 ml; 9–13 y 1,500 ml; 14–17 y 1,800 ml. Weather/activity adjustments halved.
- Total goal never exceeds 5,000 ml.

**BR-02 Smart catch-up**: `remaining = goal − logged`; `slots = remaining waking hours`; suggested per reminder = `remaining / reminders_left`, capped at 500 ml per reminder and BR-06 hourly limit. If behind by > 40% at 3/4 of the waking window, show one gentle message, never shame.

**BR-03 Hydration counting**: `hydration_ml = volume_ml × min(water_pct/100, 1.0)`; alcohol → 0 and `counts_toward_goal=false`. Caffeine and sugar accumulate separately (shown, not penalized).

**BR-04 Fasting split**: eating window from iftar to imsak. Default pattern "2-4-2": 25% at iftar, 50% between iftar and sleep, 25% at suhoor. Goal unchanged unless the user lowers it. No reminders during fasting hours.

**BR-05 AI quota** (D-11, D-12)
| | Photo | Chat |
|---|---|---|
| Premium monthly | 150 | 60 |
| Daily cap | 15 | 10 |
| Trial (whole trial) | 10 | 10 |
| Top-up pack | +50 | +30 (no expiry) |
Order of consumption: monthly → top-up. Monthly resets on the 1st (account time zone). Daily cap resets at local midnight. Free users: 0. Enforced server-side only (SD-6).

**BR-06 Over-drinking warning**: > 1,000 ml logged within 60 min → gentle warning; daily total > max(goal × 1.6, 4,500 ml) → warning card with "talk to a doctor if you often feel very thirsty". Never blocks logging.

**BR-07 Streak**: day counts if hydration ≥ 100% of that day's goal (fasting days: of the window goal). Freeze auto-applies if available.

**BR-08 Family visibility**: caregivers see member's progress %, goal-met flag, last log time. Never individual drinks, volumes, or fluid restriction.

**BR-09 Reminder skip**: skip if a log happened in the last 30 min, during quiet hours, during fasting hours, or if goal reached (then one congratulation max).

---

## 7. Monetization

### 7.1 Free vs Premium

| Capability | Free | Premium | Family |
|---|---|---|---|
| Logging, reminders, catch-up, widgets, Live Activity, watch | ✓ | ✓ | ✓ |
| Fasting Mode, Simple Mode, micro-education, streaks | ✓ | ✓ | ✓ |
| Health sync (write water, read weight) | ✓ | ✓ | ✓ |
| Stats history | 7 days | Full + export | Full + export |
| Weather & activity adaptive goal | — | ✓ | ✓ |
| AI photo, AI insight, Ask Sippy | — | ✓ (BR-05) | ✓ per member |
| Challenges | — | ✓ | ✓ |
| Sippy themes / app themes | basic | all | all |
| Family / caregiver mode, kids profiles | — | — | ✓ (5 people) |
| Ads | yes (F-24) | none | none |

### 7.2 Products & prices (D-08)

| RevenueCat product ID | Type | Indonesia | Tier-1 (USD) | Entitlement |
|---|---|---|---|---|
| `oms_premium_1m` | auto-renew 1 month | Rp15.000 | $3.99 | `premium` |
| `oms_premium_3m` | auto-renew 3 months | Rp39.000 | $9.99 | `premium` |
| `oms_premium_6m` | auto-renew 6 months | Rp69.000 | $16.99 | `premium` |
| `oms_premium_12m` | auto-renew 12 months, 7-day trial | Rp99.000 | $24.99 | `premium` |
| `oms_family_12m` | auto-renew 12 months | Rp149.000 | $34.99 | `family` (+`premium` for members) |
| `oms_remove_ads` | non-consumable | Rp29.000 | $3.99 | `remove_ads` |
| `oms_ai_topup` | consumable | Rp10.000 | $1.99 | — (server credits) |

Premium and Family both remove ads. Other countries: store price tiers / regional pricing.

---

## 8. Ads policy (F-24)

**Allowed** (free users only, not Simple Mode, not kids):
- Native ad card in History, at most one per ~10 entries, styled as a bento card with a clear "Ad" label and a **Report ad** action.
- Adaptive banner at the bottom of Statistics and of Settings.
- Rewarded ads, always user-initiated: +1 streak freeze, premium theme for 24 h. (Never AI credits — D-10.)

**Forbidden**: Home, onboarding, paywall, notifications, widgets, Live Activity, watch, Simple Mode, kids profiles, interstitials of any kind, anything near the log button.

**Rules**: non-personalized / contextual ads only; no health data to the ad SDK; UMP consent (EEA/UK) and ATT (iOS) before ads load; frequency cap; rewarded grants verified server-side (SD-6.4).

---

## 9. User flows

| ID | Flow | Screens (UI-xx) |
|---|---|---|
| UF-01 | First launch → onboarding → first log | UI-01, UI-02, UI-03 |
| UF-02 | Log from notification action (app closed) | UI-17 |
| UF-03 | Log from widget / Live Activity / voice | UI-17 |
| UF-04 | Choose drink type & custom volume, undo | UI-04, UI-05 |
| UF-05 | Free user taps AI camera → demo → paywall → trial | UI-06, UI-10 |
| UF-06 | Premium AI photo → confirm → saved (+ Health) | UI-06 |
| UF-07 | Quota low → empty → top-up purchase | UI-06, UI-07, UI-10 |
| UF-08 | Guest → create account (email OTP / Apple / Google) → sync | UI-15 |
| UF-09 | Family owner invites parent → parent accepts & consents → caregiver alert | UI-12 |
| UF-10 | Caregiver remote-sets parent to Simple Mode | UI-12, UI-03 |
| UF-11 | Enable Fasting Mode → iftar/suhoor schedule | UI-13 |
| UF-12 | Notification health check fixes battery optimization | UI-14 |
| UF-13 | Buy Remove Ads; restore on a new phone | UI-10 |
| UF-14 | Export data; delete account (in-app and web) | UI-15 |
| UF-15 | Join an office challenge by code | UI-11 |

---

## 10. Non-functional requirements

- **Performance**: cold start ≤ 2 s on a mid-range Android (e.g. 4 GB RAM); log action ≤ 100 ms local.
- **Reliability**: crash-free ≥ 99.5%; reminders survive reboot, app update, time-zone change, DST.
- **Offline**: all Free core features offline.
- **Security**: SD-7. **Privacy**: GDPR, CCPA, LGPD, UU PDP 27/2022; data minimization.
- **Accessibility**: WCAG 2.2 AA contrast; Dynamic Type / font scale to 200%; VoiceOver/TalkBack labels; 48dp targets (DS-6).
- **Platforms**: iOS 16+ (interactive widgets iOS 17+); Android 9 / API 28+ (Health Connect minimum); watchOS 10+, Wear OS 4+ (verify at T-150).
- **Localization**: 5 languages, RTL, locale-aware numbers/dates/units.
- **App size**: ≤ 60 MB download.

---

## 11. Out of scope for v1.0 (→ v2)

- Fitbit on iOS (Google Health API) — D-16.
- Corporate wellness (B2B) dashboard.
- Smart-bottle hardware integration.
- Additional languages.

---

## 12. Open questions

| ID | Question | Default if unanswered |
|---|---|---|
| Q-01 | Kids profiles only in Family plan? | Yes (as written in F-12) |
| Q-02 | Watch apps (F-35) are the largest native-code item. If they threaten the January date, move them to v1.1? | Stay in v1.0; owner decides at checkpoint 2026-12-20 (T-153) |
| Q-03 | BR-01 constants need sign-off after source review (T-022). | Use values above |
| Q-04 | Supabase region: Singapore for latency vs EU for GDPR optics? | Singapore + SCCs in privacy policy |
| Q-05 | Samsung SDK approval not received by release? | Launch without it; ship in an update |

---

## 13. Glossary

Hydration ml — counted amount after BR-03. Goal — daily target after BR-01. Waking window — wake time → sleep time. Eating window — iftar → imsak in Fasting Mode. Entitlement — RevenueCat access right (`premium`, `family`, `remove_ads`).
