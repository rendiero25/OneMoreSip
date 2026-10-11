import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:onemoresip/app/widgets/ad_card.dart';
import 'package:onemoresip/app/widgets/app_bottom_sheet.dart';
import 'package:onemoresip/app/widgets/bento_card.dart';
import 'package:onemoresip/app/widgets/fab_log.dart';
import 'package:onemoresip/app/widgets/floating_nav_bar.dart';
import 'package:onemoresip/app/widgets/hero_number.dart';
import 'package:onemoresip/app/widgets/pill_button.dart';
import 'package:onemoresip/app/widgets/progress_glass.dart';
import 'package:onemoresip/app/widgets/progress_ring.dart';
import 'package:onemoresip/app/widgets/quick_add_chip.dart';
import 'package:onemoresip/app/widgets/quota_meter.dart';
import 'package:onemoresip/app/widgets/sippy_bubble.dart';
import 'package:onemoresip/app/widgets/status_badge.dart';
import 'package:onemoresip/app/widgets/undo_snackbar.dart';
import 'package:onemoresip/core/sippy/sippy_state.dart';

import 'pump.dart';

void main() {
  testWidgets('BentoCard: header and tap', (tester) async {
    var taps = 0;
    await pumpComponent(
      tester,
      BentoCard(
        icon: LucideIcons.bell,
        title: 'Reminders',
        onTap: () => taps++,
        child: const Text('Every 60 min'),
      ),
    );

    expect(find.byIcon(LucideIcons.chevronRightDir), findsOneWidget);
    await tester.tap(find.text('Every 60 min'));
    expect(taps, 1);
  });

  testWidgets('BentoCard without onTap has no chevron', (tester) async {
    await pumpComponent(
      tester,
      const BentoCard(title: 'Today', child: SizedBox()),
    );
    expect(find.byIcon(LucideIcons.chevronRightDir), findsNothing);
  });

  testWidgets('HeroNumber shows value, unit and caption', (tester) async {
    await pumpComponent(
      tester,
      const HeroNumber(value: '1,250', unit: '/ 2,300 ml', caption: 'Today'),
    );
    expect(find.text('1,250'), findsOneWidget);
    expect(find.text('/ 2,300 ml'), findsOneWidget);
    expect(find.text('Today'), findsOneWidget);
  });

  testWidgets('PillButton: tap, 48dp minimum, button semantics', (
    tester,
  ) async {
    final handle = tester.ensureSemantics();
    var taps = 0;
    await pumpComponent(
      tester,
      PillButton(
        label: 'Edit goal',
        size: PillButtonSize.medium,
        variant: PillButtonVariant.secondary,
        onPressed: () => taps++,
      ),
    );

    await tester.tap(find.text('Edit goal'));
    expect(taps, 1);
    expect(tester.getSize(find.byType(PillButton)).height, 48);
    expect(
      tester.getSemantics(find.byType(PillButton)),
      matchesSemantics(
        label: 'Edit goal',
        isButton: true,
        hasTapAction: true,
        hasFocusAction: true,
        isFocusable: true,
      ),
    );
    handle.dispose();
  });

  testWidgets('FabLog: 72dp, labelled "Log drink", taps', (tester) async {
    final handle = tester.ensureSemantics();
    var taps = 0;
    await pumpComponent(tester, FabLog(onPressed: () => taps++));

    expect(tester.getSize(find.byType(FabLog)), const Size(72, 72));
    expect(find.bySemanticsLabel('Log drink'), findsOneWidget);
    await tester.tap(find.byType(FabLog));
    expect(taps, 1);
    handle.dispose();
  });

  testWidgets('QuickAddChip: 64dp tall, glass icon, taps', (tester) async {
    var taps = 0;
    await pumpComponent(
      tester,
      QuickAddChip(label: '250 ml', onPressed: () => taps++),
    );

    expect(tester.getSize(find.byType(QuickAddChip)).height, 64);
    expect(find.byIcon(LucideIcons.glassWater), findsOneWidget);
    await tester.tap(find.text('250 ml'));
    expect(taps, 1);
  });

  testWidgets('StatusBadge: every status has its own icon and text', (
    tester,
  ) async {
    const expected = {
      HydrationStatus.hydrated: (LucideIcons.check, 'Hydrated'),
      HydrationStatus.thirsty: (LucideIcons.clock, 'Getting thirsty'),
      HydrationStatus.behind: (LucideIcons.triangleAlert, 'Behind'),
    };
    for (final MapEntry(key: status, value: (icon, text)) in expected.entries) {
      await pumpComponent(tester, StatusBadge(status: status));
      expect(find.byIcon(icon), findsOneWidget, reason: status.name);
      expect(find.text(text), findsOneWidget, reason: status.name);
    }
  });

  testWidgets('QuotaMeter: low and empty show icon + "N left"', (tester) async {
    Widget meter(QuotaState state, int remaining) => QuotaMeter(
      title: 'AI chats',
      remaining: remaining,
      limit: 60,
      state: state,
      resetsOn: DateTime(2026, 11),
    );

    await pumpComponent(tester, meter(QuotaState.normal, 42));
    expect(find.text('42 / 60'), findsOneWidget);
    expect(find.text('Resets Nov 1'), findsOneWidget);

    await pumpComponent(tester, meter(QuotaState.low, 5));
    expect(find.byIcon(LucideIcons.clock), findsOneWidget);
    expect(find.text('5 left'), findsOneWidget);

    await pumpComponent(tester, meter(QuotaState.empty, 0));
    expect(find.byIcon(LucideIcons.ban), findsOneWidget);
    expect(find.text('0 left'), findsOneWidget);
  });

  testWidgets('ProgressRing shows its value as text', (tester) async {
    await pumpComponent(tester, const ProgressRing(progress: 0.68));
    expect(find.text('68%'), findsOneWidget);
  });

  testWidgets('ProgressGlass: label, wave runs with motion', (tester) async {
    final handle = tester.ensureSemantics();
    await pumpComponent(tester, const ProgressGlass(progress: 0.54));
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.bySemanticsLabel('Glass 54% full'), findsOneWidget);
    expect(tester.hasRunningAnimations, isTrue);
    handle.dispose();
  });

  testWidgets('ProgressGlass is static under Reduce Motion', (tester) async {
    await pumpComponent(
      tester,
      const ProgressGlass(progress: 0.54),
      reduceMotion: true,
    );
    await tester.pump();
    expect(tester.hasRunningAnimations, isFalse);
  });

  testWidgets('AdCard: "Ad" label and "Report ad" menu', (tester) async {
    var reports = 0;
    await pumpComponent(
      tester,
      AdCard(onReport: () => reports++, child: const Text('Advertiser')),
    );

    expect(find.text('Ad'), findsOneWidget);
    final menu = find.byType(PopupMenuButton<void>);
    expect(tester.getSize(menu).height, greaterThanOrEqualTo(48));
    expect(tester.getSize(menu).width, greaterThanOrEqualTo(48));
    expect(find.byTooltip('Ad options'), findsOneWidget);
    await tester.tap(menu);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Report ad'));
    await tester.pumpAndSettle();
    expect(reports, 1);
  });

  testWidgets('SippyBubble shows the message and Sippy', (tester) async {
    final handle = tester.ensureSemantics();
    await pumpComponent(
      tester,
      const SippyBubble(state: SippyState.happy, message: 'Nice pace!'),
      reduceMotion: true,
    );
    expect(find.text('Nice pace!'), findsOneWidget);
    expect(find.bySemanticsLabel('Sippy is happy'), findsOneWidget);
    handle.dispose();
  });

  testWidgets('FloatingNavBar: labels, selection, 48dp tabs, FAB', (
    tester,
  ) async {
    final handle = tester.ensureSemantics();
    int? selected;
    var logs = 0;
    await pumpComponent(
      tester,
      FloatingNavBar(
        destinations: const [
          FloatingNavDestination(icon: LucideIcons.house, label: 'Home'),
          FloatingNavDestination(icon: LucideIcons.user, label: 'Me'),
        ],
        selectedIndex: 0,
        onSelected: (i) => selected = i,
        onLog: () => logs++,
      ),
    );

    expect(
      tester.getSemantics(find.text('Home')),
      matchesSemantics(
        label: 'Home',
        isButton: true,
        isSelected: true,
        hasSelectedState: true,
        hasTapAction: true,
        hasFocusAction: true,
        isFocusable: true,
      ),
    );
    final tab = find.ancestor(
      of: find.text('Me'),
      matching: find.byType(InkWell),
    );
    expect(tester.getSize(tab).height, greaterThanOrEqualTo(48));
    expect(tester.getSize(tab).width, greaterThanOrEqualTo(48));

    await tester.tap(find.text('Me'));
    expect(selected, 1);
    await tester.tap(find.bySemanticsLabel('Log drink'));
    expect(logs, 1);
    handle.dispose();
  });

  testWidgets('UndoSnackbar: message, Undo, closes after 5 s', (tester) async {
    var undos = 0;
    await pumpComponent(
      tester,
      Builder(
        builder: (context) => TextButton(
          onPressed: () => showUndoSnackbar(
            context,
            message: 'Added 250 ml water',
            onUndo: () => undos++,
          ),
          child: const Text('show'),
        ),
      ),
    );

    await tester.tap(find.text('show'));
    await tester.pumpAndSettle();
    expect(find.text('Added 250 ml water'), findsOneWidget);
    await tester.tap(find.text('Undo'));
    await tester.pumpAndSettle();
    expect(undos, 1);

    await tester.tap(find.text('show'));
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();
    expect(find.text('Added 250 ml water'), findsNothing);
  });

  testWidgets('Bottom sheet: drag handle, at most 90% height', (tester) async {
    await pumpComponent(
      tester,
      Builder(
        builder: (context) => TextButton(
          onPressed: () => showAppBottomSheet<void>(
            context,
            builder: (_) => const SizedBox(height: 5000),
          ),
          child: const Text('open'),
        ),
      ),
    );

    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
    final screen = tester.view.physicalSize / tester.view.devicePixelRatio;
    expect(
      tester.widget<BottomSheet>(find.byType(BottomSheet)).showDragHandle,
      isTrue,
    );
    expect(
      tester.getSize(find.byType(BottomSheet)).height,
      lessThanOrEqualTo(screen.height * 0.9),
    );
  });
}
