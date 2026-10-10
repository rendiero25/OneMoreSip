# Design — One More Sip

> Related: [CLAUDE.md](../CLAUDE.md) · [Design System](../docs/design-system.md) · [Claude Design prompts](../docs/claude-design-prompts.md) · [PRD](../docs/PRD.md) · [Tasks](../docs/task.md)

Source of the UI: one Claude Design canvas.

| | |
|---|---|
| Canvas | https://claude.ai/artifact/XmqZ8oWS8QvnMB57M5ZUYi |
| Exported version | `1791533150-d062` (exported 2026-10-09) |
| Files | `source/` — 69 `.dc.html` artboards + `canvas.json` (index with titles and positions) |
| Status | **Draft — audited, awaiting owner approval** and the older-adult test (T-009) |

When the canvas changes, re-export everything into `source/` and update the version above. Code follows the exported version, not the live canvas.

## How to read the files

- Each `*.dc.html` is one artboard: HTML with **inline styles** (exact px sizes, colors, radii, gaps) and a `<script data-dc-script>` block whose `renderVals()` holds the **theme objects** (`t.bg`, `t.ink`, …) and the sample data/copy for each state.
- `Xxx.dc.html` = the screen component (often a clickable prototype with a `state`/`step`/`theme` prop). `Xxx-Light`, `Xxx-Dark`, `Xxx-200` (200% text), `Xxx-RTL` (Arabic) are wrappers that import it with different props.
- `<dc-import name="Sippy" state="…">` = use the Sippy component; `<sc-if>` / `<sc-for>` = conditionals and loops.
- These files are a **visual spec**, not code to port. Rebuild in Flutter with tokens from `docs/design-system.md`; never copy hex values that aren't tokens (see "Extended tokens" in DS-1b).
- They need the Claude Design runtime to render; to *see* a screen, open the canvas link.

## Screen index

| UI | Screens | Files in `source/` | Implements |
|---|---|---|---|
| UI-00 | Foundations, components (light/dark), Sippy 7 states + component | `Main`, `Components`, `Components-Dark`, `Sippy-States`, `Sippy` | T-010, T-011, T-013 |
| UI-01 | Splash, Welcome (+dark, 200%) | `Splash*`, `Welcome*` | T-030 |
| UI-02 | Onboarding 11 steps (prototype, light, dark, step 4 & 9 at 200%, step 8 RTL) | `Onboarding*` | T-030 |
| UI-03 | Home states a–e (prototype, light, dark, RTL, 200%) | `Home*` | T-031 |
| UI-03b | Simple Mode (prototype; before/after, light, dark, high contrast) | `SimpleHome`, `Simple-Variants` | T-037 |
| UI-04 | Add-a-drink sheet, undo, over-drinking warning | `LogSheet*` | T-032 |
| UI-05 | Drink picker, search, alcohol, custom drink, data sources | `DrinkPicker*` | T-021, T-032 |
| UI-06 | AI photo: consent, camera, analyzing, result, demo, quota low/empty | `PhotoLog*`, `DrinkPhoto` | T-111, T-113, T-117, T-118 |
| UI-07 | Ask Sippy chat + quota | `AskSippy*` | T-115 |
| UI-08 | Weekly insight | `WeeklyInsight*` | T-116 |
| UI-09 | Statistics + history (ads for free users) | `Stats*` | T-033, T-034, T-091, T-092 |
| UI-10 | Paywall, Remove ads, top-up, premium status | `Paywall*` | T-081, T-083, T-084 |
| UI-11 | Challenges | `Challenges*` | T-145 |
| UI-12 | Family, invite, consent (+200%), caregiver settings, kid profile | `Family*` | T-136…T-140 |
| UI-13 | Fasting Mode setup, active, iftar, Ramadan banner | `Fasting*` | T-123…T-125 |
| UI-14 | Reminder settings, health check, brand guide | `Reminders*` | T-045, T-046 |
| UI-15 | Me, sign-in, email code, privacy center, delete account | `Me*` | T-070…T-073 |
| UI-16 | Streaks, achievements, daily tip | `Streaks*` | T-035, T-036, T-093 |
| UI-17 | Notifications, widgets, Live Activity, watch | `Surfaces*` | T-044, T-051…T-053, T-151, T-152 |
| UI-18 | Empty, offline, error, loading | `States*` | all features |

## Audit (2026-10-09) against docs

Checked automatically over all 69 files, then by hand where flagged.

| Check | Result |
|---|---|
| All 19 screen groups present (UI-00…UI-18), light + dark, 200% and RTL frames | ✅ |
| Text/background contrast (inline pairs and theme objects) | ✅ no pair under 4.5:1 |
| Font size ≥ 14px | ✅ except 10px labels inside the miniature phone drawings in the Reminders brand guide (illustration, not UI) |
| Prices match D-08 (USD and IDR, incl. per-month equivalents) | ✅ |
| AI quotas match D-11/D-12 (150 photos, 60 chats, +50/+30 top-up) | ✅ |
| Ads only in allowed places (Stats/History, Me/Settings) — none on Home, Simple Mode, onboarding, paywall, kids, widgets | ✅ |
| Sippy: 7 states, geometric, non-babyish | ✅ (as inline SVG — usable as static fallback for T-013) |
| Colors outside DS-1 tokens | ⚠️ 50+ extra hexes: decorative tints, borders, dark-mode tints, high-contrast palette. None used for body text. Proposed as DS-1b (needs owner approval) |
| Touch targets ≥ 48dp | ⚠️ a few compact controls drawn smaller: toggles 34px, "Set it up" link 40px, "Try 7 days free" 44px, some Me-tab pills 42–44px. Rule for Flutter: visual size may stay, **hit area must be ≥ 48dp** (padding / `MaterialTapTargetSize.padded`) |
| Store-metadata wording ("for kids") | ℹ️ Appears only in the Foundations board description ("for kids to grandparents"); fine in design docs, **must not** be used in store listings (SC-11) |
| Canvas title says "UI-00 & UI-01" although it holds all screens | ℹ️ cosmetic; rename in Claude Design if you like |
