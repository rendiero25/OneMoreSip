# Store Compliance — One More Sip

> Related: [CLAUDE.md](../CLAUDE.md) · [Decisions](decisions.md) · [PRD](PRD.md) · [System Design](system-design.md) · [Tasks](task.md)

Our working checklist for passing App Review and Google Play review. Sources: Apple **App Review Guidelines** (version updated 8 June 2026) and the **Google Play Console Help / Developer Policy Center**, checked 2026-10-08. **Policies change — re-check every source link before submission (T-180).**

- Apple: https://developer.apple.com/app-store/review/guidelines/
- Google Play Policy Center: https://play.google/developer-content-policy/
- Health Connect policy: https://developer.android.com/health-and-fitness/guides/health-connect
- Play testing requirement for new personal accounts: Play Console Help → "App testing requirements for new personal developer accounts"

---

## Apple App Store

| ID | Guideline | Requirement | How we comply | Task |
|---|---|---|---|---|
| SC-01 | 2.3.1 | No hidden, dormant or undocumented features | All features live at review; flags only disable (D-14); Fasting Mode year-round (D-15); Samsung SDK not compiled until approved | T-012, T-181 |
| SC-02 | 2.1 | App complete; IAP visible and functional for review | Demo accounts (Premium, Family owner + member) in Review Notes; sandbox products approved together with the build | T-181 |
| SC-03 | 1.4.1 | Health claims need supporting data; no inaccurate measurements | No diagnosis; drink values labeled estimates with sources; disclaimers; reminder "consult your doctor" | T-024, T-131 |
| SC-04 | 3.1.2 | Subscriptions ≥ 7 days, work on all user's devices; clear description before purchase | Paywall shows price/period/renewal/trial end/what's included; entitlements tied to account | T-081 |
| SC-05 | 5.1.1(v) | Account deletion in-app if accounts can be created; don't force login for non-account features | Guest mode; Delete account in Privacy center + web form | T-071, T-072 |
| SC-06 | 2.5.18 | Ads only in main app; not in extensions, widgets, notifications, watchOS; no targeting on health data; mechanism to report inappropriate ads | Ad placements per PRD §8; "Report ad"; non-personalized ads | T-090..T-094 |
| SC-07 | 5.1.3 | HealthKit data not for advertising/marketing; no false data written; no personal health info in iCloud | Health data stays on device + Supabase; AI logs written only after user confirms | T-100 |
| SC-08 | 4.5.4 | Push not for marketing unless explicit opt-in with opt-out | "Promotions" category default OFF | T-043 |
| SC-09 | 5.1.1 / 5.1.2 | Disclose and get permission before sharing personal data with third-party AI | AI consent screen before first photo/chat | T-111 |
| SC-10 | 4.8 | Third-party login → offer Sign in with Apple (or equivalent privacy option) | Sign in with Apple + email OTP | T-070 |
| SC-11 | 1.3 / 2.3.8 / 5.1.4 | Kids category rules; "for kids" wording reserved for Kids category | Not in Kids category; no "for kids" in name/subtitle/screenshots; kids profiles: no ads, no AI, no data collection beyond parent account | T-140, T-182 |
| SC-12 | 5.1.1 | Request only data needed; purpose strings | `NSHealthShareUsageDescription`, `NSHealthUpdateUsageDescription`, `NSCameraUsageDescription`, `NSPhotoLibraryUsageDescription`, `NSLocationWhenInUseUsageDescription` (coarse), `NSUserTrackingUsageDescription` — localized | T-101, T-120 |
| SC-13 | 5.1.2 / App Privacy | Accurate App Privacy "nutrition labels" incl. third-party SDKs | Inventory from SD-9 + SDK privacy manifests (PrivacyInfo.xcprivacy) | T-183 |
| SC-14 | 3.1.1 | Purchased credits must not expire; restore for non-consumables | AI top-up never expires (D-12); Restore button for Remove Ads | T-083, T-084 |
| SC-15 | 3.2.2 | Incentives allowed for specific actions like watching ads, not for reviews/downloads | Rewarded ads only for streak freeze/theme; no "rate us for rewards" | T-093 |
| SC-16 | 5.2.5 | Apple Weather data needs WeatherKit attribution | Apple Weather logo + legal link wherever weather is shown | T-121 |
| SC-17 | 4.2 / 4.3 | Minimum functionality; not a spam copy of templates | Original design, substantial features | — |
| SC-18 | Export compliance | Encryption declaration (HTTPS, SQLCipher) | Answer in App Store Connect; set `ITSAppUsesNonExemptEncryption` after review of exemption | T-183 |

## Google Play

| ID | Policy | Requirement | How we comply | Task |
|---|---|---|---|---|
| SC-20 | Health apps declaration | Complete the Health apps declaration form + privacy policy | Filled before first production release | T-184 |
| SC-21 | Health Connect | Declare each data type and its use; privacy policy link must match the one shown in Health Connect; only essential types | Hydration (write), Exercise/Steps (read), Weight (read) | T-102, T-184 |
| SC-22 | Exact alarm permissions | `USE_EXACT_ALARM` only for alarm/calendar apps; `SCHEDULE_EXACT_ALARM` must be user-granted | We use inexact alarms; optional `SCHEDULE_EXACT_ALARM` with rationale; never `USE_EXACT_ALARM` | T-041 |
| SC-23 | New personal account testing | Closed test with ≥ 12 testers opted in for ≥ 14 continuous days before production access | Recruit 15–20 testers; start by ~4 Jan 2027 | T-170, O-08 |
| SC-24 | Ads policy | No ads in system notifications; no deceptive/disruptive ads; no accidental clicks | PRD §8; no ads in Simple Mode/kids | T-090 |
| SC-25 | User Data / Data safety | Accurate Data safety form; prominent disclosure for sensitive data | Matches SD-9; in-app disclosure before Health/AI/location | T-184 |
| SC-26 | Account deletion | In-app deletion + web link declared in Play Console | `onemoresip.app/delete-account` | T-072 |
| SC-27 | Families policy | If children are a target audience, Families policy applies | Target audience 13+ / adults; kids only as parent-managed profiles; no ads/AI for them. Re-evaluate target audience answers with the form (T-184) | T-184 |
| SC-28 | Foreground services / battery | Only justified FGS; don't ask to ignore battery optimization unless core | Guide users to settings via the health check, no automatic request of `REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` unless policy allows for our use case (verify at T-045) | T-045 |
| SC-29 | Target API level | Must target the current required API level | Set at T-001, re-check before release | T-180 |
| SC-30 | Subscriptions policy | Clear terms, easy cancellation info | Paywall + "Manage subscription" link | T-081 |

## Both stores

| ID | Item | Task |
|---|---|---|
| SC-40 | Privacy policy & terms URLs live and localized (EN + ID minimum, all 5 ideally) | T-185 |
| SC-41 | Medical disclaimer in app + store description | T-131, T-186 |
| SC-42 | Metadata: no competitor names, no keyword stuffing, no "for kids", no medical claims; screenshots show real app | T-186 |
| SC-43 | Age rating questionnaires answered (alcohol logging = reference to alcohol, not promotion) | T-184 |
| SC-44 | Review notes: how to test reminders, fasting mode, family (two demo accounts), AI (demo premium), Health permissions | T-181 |

## Owner (non-code) prerequisites
O-01..O-10 in [task.md](task.md#owner-tasks-non-code).
