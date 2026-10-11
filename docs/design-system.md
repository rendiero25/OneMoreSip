# Design System — One More Sip

> Related: [CLAUDE.md](../CLAUDE.md) · [Decisions](decisions.md) · [PRD](PRD.md) · [System Design](system-design.md) · [Claude Design prompts](claude-design-prompts.md) · [Tasks](task.md)

Source of truth for tokens. The Claude Design output must follow this file; Flutter `app/theme/` is generated from it (T-010). When the Claude Design file and this document differ, update this document first (owner approval), then the code.

Visual direction (D-21): bento cards, big hero numbers, floating dark pill navbar, black pill CTAs, warm off-white background, one teal accent, Sippy as the emotional anchor. References: the 15 images in the project (fitness/finance/mood dashboards, water trackers).

---

## DS-1 Color tokens

All pairs below were contrast-checked (WCAG 2.2): text ≥ 4.5:1, control boundaries and meaningful graphics ≥ 3:1 (1.4.11). rgba values were composited over their real background. Extended from the Claude Design export 2026-10-09 (formerly DS-1b, approved in D-28). `app/theme/` uses exactly these names.

### Base
| Token | Light | Dark | Use | Contrast (light / dark) |
|---|---|---|---|---|
| `bg` | `#F7F4EE` | `#121413` | app background | — |
| `surface` | `#FFFFFF` | `#1C1F1E` | cards | — |
| `surfaceAlt` | `#EFEBE3` | `#262A29` | inset areas, chips | ink 15.69 / 12.46 · inkMuted 5.31 / 5.64 |
| `ink` | `#111312` | `#ECEEEC` | primary text, hero numbers, primary CTA fill, snackbar | 16.99 / 15.86 on bg |
| `inkMuted` | `#5B6160` | `#9BA3A1` | secondary text on bg/surface/surfaceAlt (**not on tints**) | 5.76 / 7.18 on bg · 6.32 / 6.44 on surface |
| `onInk` | `#FFFFFF` | `#121413` | text on ink (CTA, snackbar); dark CTA is a light pill with dark text | 18.65 / 15.86 |
| `accent` | `#0B7F75` | `#4FD1C1` | progress fill, FAB, switch on, selected nav pill | — (light: never text, 4.44 on bg) |
| `onAccent` | `#FFFFFF` | `#0A1F1D` | text/icons on accent (also switch knob when on) | 4.88 / 9.15 |
| `accentInk` | `#0A6E66` | `#4FD1C1` | accent-colored text/links | 5.57 / 9.89 on bg · 6.11 / 8.88 on surface |
| `line` | `#89867F` | `#6E7371` | control boundaries: inputs, radio rings, code boxes, secondary outlines, switch off-track, sheet handle | 3.63 / 3.44 on surface · 3.31 / 3.84 on bg · 3.06 / 3.01 on surfaceAlt |
| `track` | `#E2DDD3` | `#3A3F3D` | progress bar/ring track, skeletons | accent fill on it 3.60 / 5.73 |
| `divider` | `rgba(17,19,18,.08)` | `rgba(236,238,236,.10)` | list separators, chart grid (decorative only) | — |
| `scrim` | `rgba(17,19,18,.45)` | `rgba(0,0,0,.6)` | behind sheets/dialogs | — |
| `fabShadow` | `rgba(11,127,117,.35)` | `rgba(0,0,0,.5)` | FAB glow (exception to DS-4 shadow) | — |

### Tints (cards, tiles, selected rows)
Text on a tint is `ink`; secondary text on a tint is `mutedOnTint` (never `inkMuted`: 3.84 on dark mint).

| Token | Light | Dark | Use | ink / mutedOnTint (light; dark) |
|---|---|---|---|---|
| `accentTint` | `#E3F5F1` | `#163330` | soft accent backgrounds, selected rows, Sippy chat bubble | 16.52 / 7.29 ; 11.62 / 8.13 |
| `mint` | `#BFEAE3` | `#1F4A45` | hero/illustration cards, Sippy avatar | 14.30 / 6.31 ; 8.48 / 5.93 |
| `sunTint` | `#FFEFC7` | `#3A3019` | streak, weather, warm cards | 16.37 / 7.22 ; 11.14 / 7.80 |
| `coralTint` | `#FFE1D8` | `#3D251F` | family alert, attention cards | 15.11 / 6.67 ; 12.14 / 8.50 |
| `nightTint` | `#DCE3F2` | `#1F2A44` | night, quiet hours, fasting night, Ramadan banner (dark value, white text 14.26) | 14.49 / 6.39 ; 12.23 / 8.56 |
| `mutedOnTint` | `#4A504F` | `#C3CAC8` | secondary text on any tint | ≥ 6.31 ; ≥ 5.93 |

### Status (always icon + text + color, never color alone)
| State | When | Bg / Fg light | Bg / Fg dark | Contrast (light; dark on surface / bg) | Icon |
|---|---|---|---|---|---|
| Hydrated | ≥ pace | `okBg` `#D7F2EE` / `okFg` `#075E56` | `rgba(79,209,193,.16)` / `#4FD1C1` | 6.49 ; 6.38 / 7.26 | drop-check |
| Getting thirsty | 10–30% behind pace | `warnBg` `#FFE9C2` / `warnFg` `#8A4F00` | `rgba(242,184,92,.18)` / `#F2B85C` | 5.53 ; 6.22 / 7.11 | drop-clock |
| Behind | > 30% behind / warning | `badBg` `#FFE0D9` / `badFg` `#A8321F` | `rgba(255,143,122,.16)` / `#FF8F7A` | 5.39 ; 5.58 / 6.33 | drop-alert |

`warnFg` / `badFg` are also the bar/ring colors for warning/empty states (e.g. QuotaMeter Low/Empty on `warnBg` / `badBg` tracks) and `badFg` is the destructive text color.

### Navigation & snackbar
| Token | Light | Dark | Use | Contrast |
|---|---|---|---|---|
| `nav` | `#111312` | `#2B302E` | floating navbar fill (no border) | — |
| `navOn` | `#FFFFFF` | `#ECEEEC` | selected tab icon + label | 18.65 / 11.51 |
| `navOff` | `rgba(255,255,255,.68)` | `rgba(236,238,236,.66)` | unselected tabs | 8.90 / 5.93 |
| `snackAction` | `#4FD1C1` | `#0A6E66` | "Undo" on the snackbar (`ink` bg, `onInk` text) | 9.97 / 5.24 |

Selected tab = `accent` pill behind the icon (DS-5) + `navOn`; never color/weight alone. Labels always visible.

### High contrast (Simple Mode option)
| Token | Light | Dark | Contrast |
|---|---|---|---|
| `bg` / `ink` | `#FFFFFF` / `#000000` | `#000000` / `#FFFFFF` | 21.00 |
| `button` / `onButton` | `#00524B` / `#FFFFFF` | `#7FF0E2` / `#000000` | 9.10 / 15.46 (button vs bg same) |
| card border | 3 px `#000000` | 3 px `#FFFFFF` | — |

### Decorative only (blobs behind Sippy, medals; never text color, never the only signal)
`sun #FFD27A`, `coral #FF9E87` (dark: translucent variants `rgba(242,184,92,.45–.6)`, `rgba(255,143,122,.45–.6)`), `waterSoft` `#4FD1C1` / `#9BE8DE` (second water tone in the glass). Exception: `sun` may fill a badge (e.g. "Premium") when its text is `ink` (13.10).

### Rules
- No text opacity: use `inkMuted` / `mutedOnTint` instead of faded text.
- Hit areas ≥ 48dp even where the design draws a smaller control (switches 34px, small pills 40–44px): pad the tap target in Flutter.
- Progress indicators always show their value as text.
- Platform brand buttons (Google Sign-In text `#1F1F1F`, Sign in with Apple) follow the platform's own guidelines, not these tokens.
- Colors not in this section (illustration fills, OS mock surfaces in the export) are never copied into `app/theme/`.

## DS-1b Extended tokens

Merged into DS-1 on 2026-10-11 (D-28, T-008a). Removed names and their replacements: `fieldBorder`, `handle`, `trackOff` → `line`; `snack` / `onSnack` → `ink` / `onInk`; `halo` → `accentTint` / `mint`; `accentTint` as status bg, `warnTint` / `warnInk`, `dangerTint` / `dangerInk`, dark `warn` / `danger` → `okBg` / `okFg`, `warnBg` / `warnFg`, `badBg` / `badFg`.

## DS-2 Typography

- Latin: **Plus Jakarta Sans** (400, 500, 600, 700, 800). Numbers use tabular figures (`fontFeatures: tnum`).
- Arabic: **IBM Plex Sans Arabic** (D-28).
- Both fonts ship as bundled `.ttf` assets (no runtime font fetching, e.g. no `google_fonts` downloads).
- All sizes in logical px (pt/sp) and scale with system text size.

| Style | Size / line | Weight | Use |
|---|---|---|---|
| `hero` | 64 / 68 | 700 | today's ml on Home |
| `display` | 40 / 44 | 700 | stat numbers |
| `h1` | 30 / 36 | 700 | screen titles |
| `h2` | 24 / 30 | 700 | card titles |
| `title` | 20 / 26 | 600 | list titles, buttons L |
| `body` | 17 / 24 | 400 | default text (minimum for paragraphs) |
| `bodyStrong` | 17 / 24 | 600 | |
| `label` | 15 / 20 | 500 | chips, secondary labels (absolute minimum 14) |
| `caption` | 14 / 18 | 500 | timestamps only; never essential info |

## DS-3 Simple Mode scale
`hero` 88, `body` 22, button text 26 / 700, minimum any text 20. One primary action per screen.

## DS-4 Spacing, radius, elevation
- 4 pt grid: 4, 8, 12, 16, 20, 24, 32, 40, 56. Screen side gutter 20.
- Radius: `sm` 12 (chips), `md` 20 (inputs), `lg` 28 (bento cards), `pill` 999 (buttons, navbar).
- Elevation: flat; cards separated by color. Only navbar, FAB and bottom sheets get a soft shadow (y 8, blur 24, 12% ink). Exception: the FAB uses `fabShadow` (teal glow).

## DS-5 Components
| Component | Spec |
|---|---|
| `BentoCard` | surface, radius lg, padding 20, optional header row (icon 24 + title + chevron) |
| `HeroNumber` | value (hero) + unit (title, inkMuted) + caption line |
| `ProgressGlass` | vertical glass fill with wave (Rive or CustomPainter), percent label inside |
| `ProgressRing` | 12 px stroke, accent on `track` |
| `PillButton` | primary: ink bg / onInk text, height 56 (L) / 48 (M); secondary: surface + 1.5 px ink border; destructive: `badFg` text |
| `FabLog` | 72 dp circle, accent, "+" 32 icon, label "Log drink" for screen readers |
| `QuickAddChip` | 64 dp tall, shows volume + glass icon |
| `FloatingNavBar` | pill, `nav` bg, 4 icons + always-visible labels (Home, Stats, Family, Me) with center FAB gap; height 68; selected = accent pill behind icon |
| `QuotaMeter` | label "42 / 60 chats", bar 8 px, states Normal/Low/Empty (DS-1 status colors), reset date |
| `StatusBadge` | DS-1 status, icon + text |
| `UndoSnackbar` | ink bg, onInk text, "Undo" `snackAction`, 5 s |
| `AdCard` | BentoCard + "Ad" label top-left (label style) + "Report ad" overflow; same size as neighbors |
| `SippyBubble` | Sippy 48–96 dp + speech bubble (surface, radius lg) |
| `BottomSheet` | radius 28 top, drag handle, max 90% height |

## DS-6 Accessibility rules (blocking)
1. Text scales to **200%** without clipping or overlap; layouts reflow (cards stack, chips wrap).
2. Touch targets ≥ **48 dp**; primary actions ≥ 56 dp; Simple Mode main button ≥ 120 dp tall, full width.
3. Contrast per DS-1; no text below 14.
4. Every icon button has a semantic label; images have descriptions; Sippy state is announced ("Sippy looks thirsty").
5. No swipe-only or long-press-only actions for essential features.
6. Respect Reduce Motion: Sippy switches to static poses, no wave animation.
7. RTL: mirror layout and directional icons; numbers stay LTR.
8. Haptics on log (light impact) and goal reached (success), toggleable.

## DS-7 Iconography & illustration
- Icons: **Lucide** (package `lucide_icons_flutter`, D-28), rounded 2 px stroke, 24 dp default.
- Illustration intensity: Kids profile = high; Normal = Sippy at key moments (Home, empty states, celebrations); Stats/settings = clean, no illustration.

## DS-8 Sippy (mascot)
- Shape: simple rounded water drop, geometric, two dot eyes, small mouth; teal gradient body (`accent` → `#4FD1C1`), white highlight. No baby features (no pacifier, no blush-heavy cheeks). Gender-neutral, no cultural clothing.
- Rive state machine `sippy`:
  - inputs: `level` (number 0–100), `isNight` (bool), `isFasting` (bool), `celebrate` (trigger), `tap` (trigger)
  - states: **fresh** (level ≥ pace), **happy** (just logged), **thirsty** (behind 10–30%), **tired/lemas** (behind > 30%), **sleeping** (night / quiet hours), **celebrating** (goal reached), **waiting** (fasting hours).
- Static PNG/SVG fallbacks of each state for widgets, notifications (iOS attachment) and Reduce Motion.
- Voice: warm friend, short sentences, never guilt-tripping. Example copy lives in `lib/l10n/*.arb` under `sippy_*` keys.

## DS-9 Motion
Durations 150 / 250 / 400 ms; easing `easeOutCubic`. Log action: glass fills 400 ms + Sippy `happy`. Goal reached: confetti ≤ 1.2 s, skipped under Reduce Motion.

## DS-10 Copy tone
Friendly, short, encouraging, no shame. Use "you", avoid medical claims ("supports focus", not "cures headaches"). Every user-facing string goes through ARB.
