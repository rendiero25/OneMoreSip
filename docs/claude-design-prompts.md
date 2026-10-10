# Claude Design Prompts — One More Sip

> Related: [CLAUDE.md](../CLAUDE.md) · [PRD](PRD.md) · [Design System](design-system.md) · [Tasks](task.md) (T-008, T-009)

How to run (owner):
1. Run **UI-00** first and save the result as the project's **design system** (set it as default). Attach the 15 reference images from the project when you run it.
2. Run each screen prompt (UI-01 … UI-18) as its own design, using that design system. Priority **P1** first — those are the risky screens worth testing with real users (T-009). **P2** screens can also be built directly in Flutter from the design system if time is short.
3. For every design ask for: light + dark, and a **200% text size** frame for the main screen. Phone frame 390 × 844 (iPhone) unless stated.
4. When a design changes a token, update `docs/design-system.md` (owner approves) before coding.

Every UI-xx ID matches the screen IDs used in PRD §9 (user flows) and task.md.

## Screen inventory

| ID | Screens | Priority | PRD |
|---|---|---|---|
| UI-00 | Design system: tokens, type, components, Sippy states | P1 | DS-1…DS-10 |
| UI-01 | Splash, welcome | P2 | F-01 |
| UI-02 | Onboarding (11 steps) | **P1** | F-01, F-28 |
| UI-03 | Home (Normal) + **UI-03b Simple Mode** | **P1** | F-02, F-11, F-29 |
| UI-04 | Log drink sheet + undo | **P1** | F-02 |
| UI-05 | Drink picker / search / custom drink | P2 | F-03 |
| UI-06 | AI photo: camera, analyzing, confirm, free demo, consent | **P1** | F-18, F-21 |
| UI-07 | Ask Sippy chat + quota | P2 | F-20, F-21 |
| UI-08 | Weekly insight | P2 | F-19 |
| UI-09 | Statistics + History (with ad slots) | P2 | F-14, F-24 |
| UI-10 | Paywall, Remove Ads, AI top-up, quota states | **P1** | F-21, F-22, F-23 |
| UI-11 | Challenges | P2 | F-17 |
| UI-12 | Family & caregiver, invite flow, kids profile | **P1** | F-12, F-13 |
| UI-13 | Fasting Mode setup + active day | **P1** | F-10 |
| UI-14 | Reminder settings + notification health check | **P1** | F-04, F-06 |
| UI-15 | Me/Settings, account & login, privacy center, delete account | P2 | F-25, F-27, F-32 |
| UI-16 | Streaks, achievements, daily tip | P2 | F-15, F-16 |
| UI-17 | Notifications, widgets, Live Activity, watch | **P1** | F-04, F-07, F-35 |
| UI-18 | Empty, offline, error, loading states | P2 | — |

---

## UI-00 — Design system

```
Create a mobile design system for "One More Sip", a water-intake reminder and tracking app for iOS and Android used by everyone from kids to grandparents. The home-screen label is "Sip!" and the mascot is "Sippy", a friendly water droplet. Style: clean, modern, warm, friendly — like the attached references (bento grid cards, very large hero numbers, floating dark pill-shaped bottom navbar with a center "+" button, black pill buttons). Avoid generic blue-gradient water apps.

Colors (light): background #F7F4EE (warm off-white), surface #FFFFFF, surfaceAlt #EFEBE3, ink #111312 (text, hero numbers, navbar, primary buttons), inkMuted #5B6160, accent #0B7F75 (progress fill, FAB, toggles — never as text), accentInk #0A6E66 (accent text/links), status: hydrated #D7F2EE bg with #075E56 text, getting-thirsty #FFE9C2 with #8A4F00, behind #FFE0D9 with #A8321F.
Colors (dark): bg #121413, surface #1C1F1E, ink #ECEEEC, inkMuted #9BA3A1, accent #4FD1C1 with text #0A1F1D on it, warn #F2B85C, danger #FF8F7A.

Typography: Plus Jakarta Sans, tabular numbers. hero 64/68 bold, display 40, h1 30, h2 24, title 20 semibold, body 17, label 15, caption 14 (minimum). Simple Mode scale: hero 88, body 22, button text 26 bold.
Spacing 4pt grid, side gutter 20. Radius: chips 12, inputs 20, cards 28, buttons and navbar fully rounded. Flat cards, soft shadow only on navbar, FAB and bottom sheets.

Components to show (light + dark): BentoCard, HeroNumber with unit, ProgressGlass (glass filling with water), ProgressRing, PillButton (primary black, secondary outline, destructive), FAB 72dp teal with "+", QuickAddChip (150/250/350/500 ml), FloatingNavBar (Home, Stats, Family, Me + center FAB), StatusBadge (always icon + text + color), QuotaMeter (normal / low / empty), UndoSnackbar, AdCard (bento card with small "Ad" label and "Report ad" menu), SippyBubble (mascot with speech bubble), BottomSheet, toggle, segmented control, text field, list row.

Sippy: a simple, geometric, rounded water drop with teal gradient (#0B7F75 to #4FD1C1), white highlight, two dot eyes and a small mouth. Gender-neutral, not babyish. Show 7 states: fresh, happy, thirsty, tired, sleeping, celebrating, waiting (patiently, for fasting hours).

Accessibility rules to bake in: touch targets ≥ 48dp, status never shown by color alone, text must reflow at 200% size.
```

## UI-01 — Splash & welcome (P2)

```
Using the One More Sip design system, design: (1) a splash screen with Sippy and the wordmark "One More Sip"; (2) a welcome screen with Sippy waving, headline "Your friendly water buddy", subline "Gentle reminders. One tap to log. For the whole family.", a black pill button "Get started" and a text button "I already have an account". Light and dark.
```

## UI-02 — Onboarding (P1)

```
Using the One More Sip design system, design an 11-step onboarding flow, one question per screen, large text, a progress indicator at top, a back arrow, and a full-width black pill "Continue" button at the bottom. Sippy appears small at the top of each step with a short friendly line.
Steps: 1) Language (English, Bahasa Indonesia, العربية, Español, Português). 2) "What should Sippy call you?" name field. 3) Units: ml or fl oz. 4) Weight with a large stepper and number keypad (skip option "Prefer not to say"). 5) Activity level: 3 big cards (Mostly sitting / Some movement / Very active). 6) Wake-up and bedtime with large time pickers. 7) Medical safety: "Has a doctor limited how much you can drink?" Yes / No; if Yes, field "Daily limit (ml)" and a note "We'll never ask you to drink more than this." 8) Choose experience: two large cards — "Normal" (full app) and "Simple" (one big button, larger text — great for parents and grandparents). 9) Goal result: big number "2,300 ml" with a short explanation "Based on your weight and activity" and "Edit" link, plus disclaimer "One More Sip is not a medical device." 10) Notification permission primer with Sippy holding a bell and a preview of a reminder notification with the "✓ 250 ml" action. 11) Android-only: "Keep reminders working" battery optimization guide with 3 numbered steps and a phone-brand selector (Xiaomi, Oppo, Vivo, Samsung, Realme, Other).
Also show step 4 and step 9 at 200% text size, and step 8 in Arabic (RTL).
```

## UI-03 — Home, Normal + Simple Mode (P1)

```
Using the One More Sip design system, design the Home screen.

Normal mode: greeting "Good morning, Rendy" with avatar; bento layout: hero card with "1,250 / 2,300 ml" (hero number), ProgressGlass, StatusBadge "Hydrated" and a one-line Sippy message; row of QuickAddChips (150, 250, 350, 500 ml); small cards: "Next reminder 10:30", "Today +300 ml for heat, 34°C" (with a tiny Apple Weather attribution), "Streak 6 days", "Daily tip: Coffee counts too". Floating dark pill navbar (Home, Stats, Family, Me) with the center teal "+" FAB. No ads on this screen.
Show 5 states: (a) morning, 10% done, Sippy fresh; (b) behind pace, Sippy thirsty, status "Getting thirsty", a gentle catch-up line "Two glasses before lunch keeps you on track"; (c) goal reached, Sippy celebrating; (d) Fasting Mode during fasting hours: Sippy waiting, "Iftar in 3h 12m", no reminders; (e) night, Sippy sleeping.
Also: Arabic RTL version of state (a), and state (a) at 200% text size.

Simple Mode (separate screen, for older adults): no navbar, no ads, no small text. Top: Sippy large with "Good morning, Grandma!". Middle: a big glass filling up and "3 of 8 glasses" in 88pt. Bottom: one giant full-width teal button (at least 120dp tall) "I drank 1 glass" with a glass icon, and below it a large secondary button "Undo". A small text button "Settings" in the corner. Show the moment right after tapping: confirmation "Saved! 4 of 8 glasses" and Sippy happy. Also high-contrast variant.
```

## UI-04 — Log drink sheet (P1)

```
Using the One More Sip design system, design the bottom sheet that opens from the center "+" FAB: title "Add a drink", a row of recent/favorite drinks (Water, Iced sweet tea, Coffee with milk, Coconut water) as big tappable tiles with icons, a volume selector with large preset chips (150/250/350/500 ml) and a "Custom" option that opens a large wheel or slider showing "330 ml", a note line "Counts as 297 ml · 25 g sugar" for non-water drinks, a camera button "Snap your drink (Premium)" and a black pill button "Add drink". After adding, show the Home screen with the UndoSnackbar "Added 250 ml water · Undo". Show an over-drinking warning variant: "That's a lot in one hour. Take it easy — sip slowly."
```

## UI-05 — Drink picker & custom drink (P2)

```
Using the One More Sip design system, design a full-screen drink picker: search field, category chips (Water, Coffee, Tea, Milk, Juice, Soda, Sports, Traditional, Alcohol), a "Popular in Indonesia" section (Es teh manis, Es kopi susu gula aren, Kopi tubruk, Es kelapa muda, Wedang jahe), list rows with icon, name, local name and small badges for sugar and caffeine. Alcohol rows show "Logged, not counted". Also design "Create custom drink": name, icon picker, water %, sugar per 100 ml, caffeine per 100 ml, and a "Data sources" link screen crediting USDA FoodData Central with the note "Values are estimates".
```

## UI-06 — AI photo logging (P1)

```
Using the One More Sip design system, design the AI drink-photo flow:
1) One-time consent screen: Sippy with a camera, "Your photo is sent securely to our AI partner to recognize the drink. We don't keep the photo." with "Allow" and "Not now".
2) Camera screen: full-bleed camera view, rounded capture button, gallery button, and a QuotaMeter chip at the top "128 / 150 photos this month".
3) Analyzing state with Sippy looking through a magnifier.
4) Result card: photo thumbnail, "Iced coffee with milk & palm sugar", editable volume "≈ 300 ml", sugar ≈ 30 g, caffeine ≈ 90 mg, confidence "Medium", buttons "Looks right — add" and "Edit". 
5) Free-user demo: same result card with a sample photo and a label "Example", then a paywall teaser "Snap any drink with Premium — try 7 days free".
6) Quota low (chip turns amber "8 left · resets Nov 1") and quota empty: "You've used this month's photos. Resets Nov 1." with buttons "Add manually" and "Get 50 more photos".
```

## UI-07 — Ask Sippy chat (P2)

```
Using the One More Sip design system, design "Ask Sippy", a chat about hydration: header with Sippy avatar and a QuotaMeter "42 / 60 chats", suggested question chips ("Does coffee count?", "How much water when it's hot?", "Water during Ramadan?"), message bubbles (user in ink, Sippy in surface with avatar), a safety footer "Sippy isn't a doctor. For medical questions, talk to your doctor.", and an input bar with send button. Show the empty-quota state with a top-up button.
```

## UI-08 — Weekly insight (P2)

```
Using the One More Sip design system, design a weekly insight screen: headline card "Your week: 5 of 7 days on target", a small bar chart of 7 days, three observation cards ("You often forget between 1–3 pm", "Most of your sugar came from iced tea", "Weekends are your best days"), one tip card from Sippy, and a "Shared with no one" privacy note.
```

## UI-09 — Statistics & history (P2)

```
Using the One More Sip design system, design: (1) Statistics with a Day/Week/Month segmented control, a bar chart with goal line, KPI bento cards (average, best day, days on target, caffeine, sugar), and for a free user a lock card after 7 days "See your full history with Premium"; an adaptive banner ad at the very bottom labeled "Ad". (2) History list grouped by day with drink rows (icon, name, time, volume, edit/delete), and a native ad card styled like the other bento cards with an "Ad" label and a "Report ad" menu after about 10 entries. Show the premium version without ads.
```

## UI-10 — Paywall, Remove Ads, top-up (P1)

```
Using the One More Sip design system, design the paywall: Sippy celebrating, title "Get more from every sip", benefit list with icons (Snap drinks with AI — 150 photos/month, Ask Sippy — 60 chats/month, Weather & activity smart goal, Full history & export, Challenges, No ads), plan cards: 1 month $3.99, 3 months $9.99, 6 months $16.99, 12 months $24.99 with badge "7-day free trial · Best value" (selected), and a Family card "Family — up to 5 people $34.99/year". Below: primary black pill "Start free trial", the line "Free for 7 days, then $24.99/year. Cancel anytime in your store settings. Trial ends Oct 16.", links "Restore purchases · Terms · Privacy". Also show the Indonesian price version (Rp15.000 / Rp39.000 / Rp69.000 / Rp99.000 / Family Rp149.000).
Also design: (a) "Remove ads forever" sheet, one-time $3.99, "Pay once. Ads gone for good — even on a new phone."; (b) "Get more AI" top-up sheet "+50 photos & +30 chats — $1.99 — never expires"; (c) a Premium status screen with both QuotaMeters ("Monthly: 0 / 150 · Extra: 42") and renewal date.
```

## UI-11 — Challenges (P2)

```
Using the One More Sip design system, design: challenges list (active and past), create challenge (name, 7/14/30 days, invite code), join by code, and a challenge detail with a leaderboard ranked by "% of personal goal" (never ml), with avatars and display names, and a friendly note "Everyone's goal is different — we compare progress, not liters."
```

## UI-12 — Family & caregiver (P1)

```
Using the One More Sip design system, design the Family tab and flows:
1) Family overview: member cards (Mom, Dad, Kid profile "Alya, 7"), each with progress % ring, status badge and "Last drink 2h ago". A warning state: "Mom hasn't logged a drink since 10:00" with buttons "Call" and "Send a nudge".
2) Invite flow: "Invite family" with share link and QR code, note "Link expires in 72 hours".
3) Accept & consent screen on the invited person's phone, in large text: "Rendy wants to look after your hydration." toggles "Share my daily progress (not what I drink)" and "Let Rendy adjust my reminders", buttons "Accept" and "No thanks".
4) Member detail with caregiver alert settings: "Alert me if no drink for 3 hours (during waking time)", and remote setup: switch to Simple Mode, reminder times, glass size.
5) Kid profile creation: name, age, avatar sticker, note "No ads and no AI for kid profiles."
Show screen 3 at 200% text size.
```

## UI-13 — Fasting Mode (P1)

```
Using the One More Sip design system, design Fasting Mode: setup screen with fasting type cards (Ramadan, Monday & Thursday, Ayyamul Bidh, Custom days, Intermittent 16:8), location/city, calculation method dropdown (auto by country), and the "2-4-2" split preview: 2 glasses at iftar, 4 between iftar and sleep, 2 at suhoor. Then the active Home during fasting (Sippy waiting, "Iftar in 3h 12m · Maghrib 17:54", "Reminders paused while you fast") and at iftar ("Time to break your fast! Start with 2 glasses."), and a timeline card for tonight's window with suhoor time. Also an in-app Ramadan banner on Home: "Ramadan Mubarak — Fasting Mode is ready".
```

## UI-14 — Reminders & notification health (P1)

```
Using the One More Sip design system, design: (1) Reminder settings: mode Interval / Fixed times, interval chips (30, 45, 60, 90 min), weekday schedule, wake & sleep, quiet hours, "Skip if I drank in the last 30 min" toggle, reminder style (Friendly / Short / Funny) with a live preview of a notification, vibration pattern, notification categories list with toggles (Drink reminders, Progress, Family alerts, Weather, Insights & achievements, Promotions — off by default). (2) "Reminder health check" screen: checklist with status icons — Notifications allowed ✓, Battery optimization ✗ "Fix", Auto-start (Xiaomi) ✗ "Show me how", Exact timing (optional) — and a brand-specific step-by-step guide screen with illustrated steps.
```

## UI-15 — Me, settings, account & privacy (P2)

```
Using the One More Sip design system, design the "Me" tab: profile card, goal & body settings, Simple Mode switch, language, units, theme, text size and high contrast, haptics, connected health apps (Apple Health / Health Connect), account section. Account: sign-in sheet with "Continue with Apple", "Continue with Google", "Continue with email", and the email code screen with 6 large digit boxes. Privacy center: what we store, consents (ads, analytics, AI), "Download my data", "Delete account" with a clear warning and confirmation. Adaptive banner ad at the bottom for free users.
```

## UI-16 — Streaks, achievements, daily tip (P2)

```
Using the One More Sip design system, design: streak screen with a calendar of goal-met days, streak freezes count and a "Watch a short ad for 1 freeze" button (free users), achievements grid with unlocked/locked badges (First sip, 7-day streak, Early bird, Ramadan complete, Heatwave hero), and a daily tip detail with an illustration, 3 short paragraphs and a "Source: WHO" line.
```

## UI-17 — Notifications, widgets, Live Activity, watch (P1)

```
Using the One More Sip design system, design system-surface mockups (no ads anywhere):
1) iOS and Android reminder notifications with Sippy icon: "Sippy here 💧 One more sip?" with actions "✓ 250 ml" and "Later". Also a family alert "Check on Mom — no drink logged since 10:00" and a weather notice "Hot day: your goal is +500 ml today".
2) iOS widgets: small (progress ring + ml), medium (progress + 2 quick-add buttons), lock-screen circular and rectangular.
3) iOS Live Activity / Dynamic Island: progress bar, "1,250 / 2,300 ml", "+250" button.
4) Android widgets: 2x2 and 4x2 with quick-add.
5) Apple Watch and Wear OS: progress ring, big "+250 ml" button, complication/tile.
```

## UI-18 — System states (P2)

```
Using the One More Sip design system, design empty, offline, error and loading states with Sippy: first day with no logs ("Your first sip starts here"), offline banner ("You're offline — logging still works"), AI service error with retry and "Your quota wasn't used", sync conflict-free reassurance, and skeleton loading for Stats.
```
