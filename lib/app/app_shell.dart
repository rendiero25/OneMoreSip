import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:onemoresip/app/theme/app_dimens.dart';
import 'package:onemoresip/app/widgets/floating_nav_bar.dart';
import 'package:onemoresip/core/flags/feature_flag.dart';
import 'package:onemoresip/core/flags/feature_flags.dart';
import 'package:onemoresip/features/logging/presentation/log_sheet.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

/// Navbar tabs: Home, Stats, Family, Me (DS-5) around the log button.
/// The Family tab is hidden while [FeatureFlag.family] is off (F-33).
class AppShell extends ConsumerWidget {
  /// Wraps the router's tab branches.
  const new({required this.navigationShell, super.key});

  /// Branches in router order: home, stats, family, me.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final family = ref.watch(isFeatureEnabledProvider(FeatureFlag.family));
    final tabs = [
      (0, FloatingNavDestination(icon: LucideIcons.house, label: l10n.navHome)),
      (
        1,
        FloatingNavDestination(
          icon: LucideIcons.chartColumn,
          label: l10n.navStats,
        ),
      ),
      if (family)
        (
          2,
          FloatingNavDestination(
            icon: LucideIcons.users,
            label: l10n.navFamily,
          ),
        ),
      (3, FloatingNavDestination(icon: LucideIcons.user, label: l10n.navMe)),
    ];
    final current = navigationShell.currentIndex;
    return Scaffold(
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.gutter,
            0,
            AppSpacing.gutter,
            AppSpacing.s16,
          ),
          child: FloatingNavBar(
            destinations: [for (final (_, d) in tabs) d],
            selectedIndex: tabs.indexWhere((t) => t.$1 == current),
            onSelected: (i) {
              final branch = tabs[i].$1;
              navigationShell.goBranch(
                branch,
                initialLocation: branch == current,
              );
            },
            onLog: () => unawaited(showLogSheet(context)),
          ),
        ),
      ),
    );
  }
}
