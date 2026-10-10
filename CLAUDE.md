# CLAUDE.md — One More Sip

Behavioral guidelines to reduce common LLM coding mistakes. Merge with project-specific instructions as needed.

**Tradeoff:** These guidelines bias toward caution over speed. For trivial tasks, use judgment.

## 1. Think Before Coding

**Don't assume. Don't hide confusion. Surface tradeoffs.**

Before implementing:
- State your assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them - don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.

## 2. Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- If you write 200 lines and it could be 50, rewrite it.

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

## 3. Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:
- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- If you notice unrelated dead code, mention it - don't delete it.

When your changes create orphans:
- Remove imports/variables/functions that YOUR changes made unused.
- Don't remove pre-existing dead code unless asked.

The test: Every changed line should trace directly to the user's request.

## 4. Goal-Driven Execution

**Define success criteria. Loop until verified.**

Transform tasks into verifiable goals:
- "Add validation" → "Write tests for invalid inputs, then make them pass"
- "Fix the bug" → "Write a test that reproduces it, then make it pass"
- "Refactor X" → "Ensure tests pass before and after"

For multi-step tasks, state a brief plan:
```
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```

Strong success criteria let you loop independently. Weak criteria ("make it work") require constant clarification.

---

# Project-specific instructions

## 5. What this project is

**One More Sip** (home-screen label **"Sip!"**, mascot **Sippy**) is a water-intake reminder & tracking app for iOS and Android, built with **Flutter** + **Supabase**, sold globally as freemium (ads + subscriptions via **RevenueCat**). Target users range from kids to grandparents, so accessibility is a product requirement, not polish.

Owner / sole developer: Rendy ("rendiero"). Communication language with the owner: **Bahasa Indonesia**. Code, identifiers, commit messages and code comments: **English**.

## 6. Document map — read before you work

All docs are linked by stable IDs. Always cite the ID you are implementing.

| Doc | Purpose | ID prefix |
|---|---|---|
| [`docs/PRD.md`](docs/PRD.md) | What we build and why; features, rules, pricing, quotas | `F-xx` (features), `BR-xx` (business rules) |
| [`docs/system-design.md`](docs/system-design.md) | How we build it; architecture, data model, APIs, security | `SD-x` (sections) |
| [`docs/design-system.md`](docs/design-system.md) | Tokens, type scale, components, mascot, a11y rules | `DS-x` |
| [`docs/store-compliance.md`](docs/store-compliance.md) | App Store & Play rules we must pass | `SC-xx` |
| [`docs/task.md`](docs/task.md) | Phase 1 backlog until v1.0 release; status lives here | `T-xxx` |
| [`docs/decisions.md`](docs/decisions.md) | Why things are the way they are (decision log) | `D-xx` |
| [`docs/claude-design-prompts.md`](docs/claude-design-prompts.md) | Screen list + prompts used to create the UI in Claude Design | `UI-xx` |
| [`design/`](design/README.md) | Exported Claude Design screens (visual spec per `UI-xx`) + audit | `UI-xx` |

**UI work:** before building a screen, open its files listed in `design/README.md` (screen index). Treat them as the visual spec — rebuild in Flutter with tokens from `docs/design-system.md`; don't port the HTML or copy non-token hex values.
| [`data/`](data/README.md) | Drink database (draft, must be verified) | — |

Precedence when docs disagree: **decisions.md > PRD.md > system-design.md > design-system.md > task.md**. If you find a conflict, stop and report it — don't silently pick one.

## 7. Working loop

1. Open `docs/task.md`, pick the next `[ ]` task whose dependencies are done (or the one the owner names).
2. Read the linked `F-`, `SD-`, `DS-`, `SC-` sections before writing code.
3. State the plan with verify steps (section 4). For tasks touching security, payments, health data or store compliance, wait for the owner's OK on the plan.
4. Implement → run `flutter analyze` and tests → verify the task's acceptance criteria.
5. Update `docs/task.md`: `[ ]` → `[x]`, add a one-line note if something deviated. New decisions go to `docs/decisions.md` as a new `D-xx` (never edit an old one; supersede it).
6. Commit with a Conventional Commit message referencing the task, e.g. `feat(logging): quick-add drink sheet (T-031, F-02)`.

## 8. Non-negotiables (never trade these for speed)

- **No secrets in the app.** Only public keys ship in the binary (Supabase publishable key, RevenueCat public SDK key, AdMob app ID). AI, WeatherKit, FCM server, RevenueCat webhook secret → Supabase Edge Function secrets only. (SD-7)
- **Every table has RLS.** No exceptions; add a policy test for each new table. (SD-4, SD-7)
- **Server is the source of truth for money and quota.** Premium status, AI quota, top-up balance are read/written only by Edge Functions / `security definer` RPCs. Never trust a client flag. (SD-6)
- **Health data never reaches ads or analytics.** No volumes, drink types, goals or fluid-restriction values in AdMob, PostHog or Sentry payloads. (SC-07, SD-9)
- **No hidden or dormant features.** A feature flag may only turn OFF a reviewed feature or roll a reviewed feature out gradually. It must never enable functionality App Review hasn't seen. (SC-01, D-14)
- **Medical safety.** If a user has a doctor's fluid restriction, the goal equals that value, no auto-adjustment, and the app never nudges them to drink more. (F-28)
- **Accessibility.** Text scales with system font size up to 200% without clipping; touch targets ≥ 48dp; status is never color-only. (DS-6)
- **No ads** in: Home, onboarding, notifications, widgets, watch apps, Simple Mode, Kids profiles, or as interstitials. (F-24)
- **i18n from day one.** No hard-coded user-facing strings; everything goes through ARB files (EN, ID, AR, ES, PT). RTL must work. (F-27)

## 9. Tech conventions

- Flutter stable (pin with FVM), Dart null-safety, `very_good_analysis` lints.
- Architecture: feature-first folders, Riverpod for state, go_router for navigation, Drift (SQLCipher) for local DB. Details: SD-3.
- Prefer platform/package defaults over custom infrastructure. Check the latest package version and changelog before adding a dependency; justify every new dependency in the PR/commit body.
- Native code (Swift/Kotlin) only where Flutter can't: widgets, Live Activity, App Intents, watch apps, Health SDKs not covered by packages.
- Edge Functions: TypeScript (Deno), input validated with zod, one function per responsibility.
- Tests: unit tests for all business rules in PRD §6 (goal calc, catch-up, quota, fasting windows); widget tests for critical flows; RLS tests in SQL.

## 10. Ask the owner before

- Adding a dependency, a paid service, or a new permission (iOS `Info.plist` / Android manifest).
- Changing prices, quotas, ad placements, or anything in `docs/decisions.md`.
- Anything that sends data to a third party.
- Any destructive migration or data deletion.

## 11. Commands (fill in as the project grows)

```bash
fvm flutter pub get
fvm flutter analyze
fvm flutter test
fvm flutter run --flavor dev -t lib/main_dev.dart
supabase start                     # local stack
supabase db reset                  # re-run migrations + seed
supabase functions serve           # local edge functions
```
