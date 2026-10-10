# Design System — One More Sip

> Related: [CLAUDE.md](../CLAUDE.md) · [Decisions](decisions.md) · [PRD](PRD.md) · [System Design](system-design.md) · [Claude Design prompts](claude-design-prompts.md) · [Tasks](task.md)

Source of truth for tokens. The Claude Design output must follow this file; Flutter `app/theme/` is generated from it (T-010). When the Claude Design file and this document differ, update this document first (owner approval), then the code.

Visual direction (D-21): bento cards, big hero numbers, floating dark pill navbar, black pill CTAs, warm off-white background, one teal accent, Sippy as the emotional anchor. References: the 15 images in the project (fitness/finance/mood dashboards, water trackers).

---

## DS-1 Color tokens

All pairs below were contrast-checked (WCAG 2.2). "AA" = ≥ 4.5:1 for normal text.

### Light
| Token | Hex | Use | Contrast |
|---|---|---|---|
| `bg` | `#F7F4EE` | app background (warm off-white) | — |
| `surface` | `#FFFFFF` | cards | — |
| `surfaceAlt` | `#EFEBE3` | inset areas, chips | — |
| `ink` | `#111312` | primary text, hero numbers, navbar, primary CTA fill | 16.99 on bg |
| `inkMuted` | `#5B6160` | secondary text | 5.76 on bg · 6.32 on surface · 5.31 on surfaceAlt |
| `onInk` | `#FFFFFF` | text on ink (navbar, CTA) | 18.65 |
| `accent` | `#0B7F75` | progress fill, FAB, toggles, accent fills | white text on it 4.88 |
| `accentInk` | `#0A6E66` | accent-colored **text/links** | 5.57 on bg · 6.11 on surface |
| `accentTint` | `#D7F2EE` | "hydrated" status bg | text `#075E56` 6.49 · ink 15.83 |
| `warnTint` / `warnInk` | `#FFE9C2` / `#8A4F00` | "getting thirsty" | 5.53 |
| `dangerTint` / `dangerInk` | `#FFE0D9` / `#A8321F` | "behind / warning" | 5.39 |

⚠️ `accent` (#0B7F75) as text on `bg` is only 4.44 — **never** use it for text; use `accentInk`.

### Dark
| Token | Hex | Contrast |
|---|---|---|
| `bg` | `#121413` | — |
| `surface` | `#1C1F1E` | — |
| `ink` | `#ECEEEC` | 15.86 on bg · 14.25 on surface |
| `inkMuted` | `#9BA3A1` | 7.18 on bg · 6.44 on surface |
| `accent` | `#4FD1C1` | 9.89 on bg; text on accent `#0A1F1D` 9.15 |
| `warn` | `#F2B85C` | 10.38 on bg |
| `danger` | `#FF8F7A` | 8.34 on bg |

Navbar in dark mode: `surface` with a 1 px `#2A2E2D` border (stays a pill).

### Status (always icon + text + color, never color alone)
| State | When | Light | Icon |
|---|---|---|---|
| Hydrated | ≥ pace | accentTint / `#075E56` | drop-check |
| Getting thirsty | 10–30% behind pace | warnTint / warnInk | drop-clock |
| Behind | > 30% behind / warning | dangerTint / dangerInk | drop-alert |

## DS-1b Extended tokens (from the Claude Design export — **proposed, pending owner approval**)

Found in the theme objects of `design/source/*.dc.html` (export 2026-10-09). Contrast checked: every text pair below is ≥ 4.5:1. Once approved, these join DS-1 and `app/theme/` uses these names.

| Token | Light | Dark | Use |
|---|---|---|---|
| `surfaceAlt` | `#EFEBE3` | `#262A29` | inset areas, chips (dark value is new) |
| `accentTint` | `#E3F5F1` | `#163330` | soft accent backgrounds (cards, selected rows) |
| `mint` | `#BFEAE3` | `#1F4A45` | hero/illustration cards behind Sippy |
| `sunTint` | `#FFEFC7` | `#3A3019` | streak / weather / warm cards |
| `coralTint` | `#FFE1D8` | `#3D251F` | family alert / attention cards |
| `nightTint` | `#DCE3F2` | `#1F2A44` | night, quiet hours, fasting night window |
| `mutedOnTint` | `#4A504F` | `#C3CAC8` | secondary text on tint cards (≥ 5.9:1 on all tints) |
| `okBg` / `okFg` | `#D7F2EE` / `#075E56` | `rgba(79,209,193,.16)` / `#4FD1C1` | status "Hydrated" (same as DS-1 accentTint/status) |
| `warnBg` / `warnFg` | `#FFE9C2` / `#8A4F00` | `rgba(242,184,92,.18)` / `#F2B85C` | status "Getting thirsty" |
| `badBg` / `badFg` | `#FFE0D9` / `#A8321F` | `rgba(255,143,122,.16)` / `#FF8F7A` | status "Behind" |
| `line` | `#C9C4BA` | `#4A504E` | outlines, secondary button border |
| `fieldBorder`, `handle` | `#D6D1C7` | `#3A3F3D` | inputs, sheet drag handle |
| `track` / `trackOff` | `#E2DDD3` / `#B9B4AB` | `#3A3F3D` / `#4A504E` | progress track / switch off |
| `divider` | `rgba(17,19,18,.08)` | `rgba(236,238,236,.10)` | list separators |
| `nav` / `navOn` / `navOff` | `#111312` / `#FFFFFF` / `rgba(255,255,255,.68)` | `#2B302E` / `#ECEEEC` / `rgba(236,238,236,.66)` | floating navbar |
| `onInk` | `#FFFFFF` | `#121413` | in dark mode the primary CTA inverts: light pill, dark text |
| `snack` / `onSnack` / `snackAction` | `#111312` / `#FFFFFF` / `#4FD1C1` | `#ECEEEC` / `#121413` / `#0A6E66` | undo snackbar |
| `scrim` | `rgba(17,19,18,.45)` | `rgba(0,0,0,.6)` | behind sheets/dialogs |
| `fabShadow` | `rgba(11,127,117,.35)` | `rgba(0,0,0,.5)` | FAB glow |
| High-contrast set | bg `#FFFFFF`, ink `#000000`, button `#00524B` / on `#FFFFFF` | bg `#000000`, ink `#FFFFFF`, button `#7FF0E2` / on `#000000` | Simple Mode high-contrast option |
| Decorative only | `sun #FFD27A`, `coral #FF9E87`, `halo #E3F5F1` | translucent variants | blobs behind Sippy; never for text |

Rule: hit areas ≥ 48dp even where the design draws a smaller control (switches 34px, small pills 40–44px) — pad the tap target in Flutter.

## DS-2 Typography

- Latin: **Plus Jakarta Sans** (400, 500, 600, 700, 800). Numbers use tabular figures (`fontFeatures: tnum`).
- Arabic: **IBM Plex Sans Arabic** (or Noto Sans Arabic — pick one at T-010, check license and glyph coverage).
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
- Elevation: flat; cards separated by color. Only navbar, FAB and bottom sheets get a soft shadow (y 8, blur 24, 12% ink).

## DS-5 Components
| Component | Spec |
|---|---|
| `BentoCard` | surface, radius lg, padding 20, optional header row (icon 24 + title + chevron) |
| `HeroNumber` | value (hero) + unit (title, inkMuted) + caption line |
| `ProgressGlass` | vertical glass fill with wave (Rive or CustomPainter), percent label inside |
| `ProgressRing` | 12 px stroke, accent on surfaceAlt track |
| `PillButton` | primary: ink bg / onInk text, height 56 (L) / 48 (M); secondary: surface + 1.5 px ink border; destructive: dangerInk text |
| `FabLog` | 72 dp circle, accent, "+" 32 icon, label "Log drink" for screen readers |
| `QuickAddChip` | 64 dp tall, shows volume + glass icon |
| `FloatingNavBar` | pill, ink bg, 4 icons + labels (Home, Stats, Family, Me) with center FAB gap; height 68; selected = accent pill behind icon |
| `QuotaMeter` | label "42 / 60 chats", bar 8 px, states Normal/Low/Empty (DS-1 status colors), reset date |
| `StatusBadge` | DS-1 status, icon + text |
| `UndoSnackbar` | ink bg, onInk text, "Undo" accent-on-dark `#4FD1C1`, 5 s |
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
- Icons: rounded 2 px stroke set (e.g. Phosphor or Lucide, decide at T-010), 24 dp default.
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
