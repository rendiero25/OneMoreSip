import 'package:flutter/material.dart';
import 'package:onemoresip/app/theme/app_colors.dart';
import 'package:onemoresip/app/theme/app_dimens.dart';
import 'package:onemoresip/app/theme/app_typography.dart';
import 'package:onemoresip/app/widgets/fab_log.dart';

/// One tab of the [FloatingNavBar].
class FloatingNavDestination {
  /// Creates a tab.
  const new({required this.icon, required this.label});

  /// Lucide icon.
  final IconData icon;

  /// Always-visible label.
  final String label;
}

/// DS-5 floating navbar: `nav` pill (min height 68) with always-visible
/// labels, the selected tab marked by an `accent` pill behind its icon,
/// and the [FabLog] raised in a centre gap.
class FloatingNavBar extends StatelessWidget {
  /// Creates the bar.
  const new({
    required this.destinations,
    required this.selectedIndex,
    required this.onSelected,
    required this.onLog,
    super.key,
  });

  /// Tabs in reading order; the FAB sits after the first half.
  final List<FloatingNavDestination> destinations;

  /// Index into [destinations]; -1 selects nothing.
  final int selectedIndex;

  /// Called with the tapped index.
  final ValueChanged<int> onSelected;

  /// Called by the centre log button.
  final VoidCallback onLog;

  /// How far the FAB rises above the bar.
  static const double _fabRise = 24;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    final tabs = [
      for (final (i, d) in destinations.indexed)
        Expanded(
          child: _NavTab(
            destination: d,
            selected: i == selectedIndex,
            onTap: () => onSelected(i),
          ),
        ),
    ];
    final split = (tabs.length + 1) ~/ 2;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: _fabRise),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(AppRadius.pill)),
              boxShadow: [AppElevation.soft],
            ),
            child: Material(
              color: c.nav,
              shape: const StadiumBorder(),
              clipBehavior: Clip.antiAlias,
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 68),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.s8,
                    vertical: AppSpacing.s4,
                  ),
                  child: Row(
                    children: [
                      ...tabs.take(split),
                      const SizedBox(width: 72 + AppSpacing.s8),
                      ...tabs.skip(split),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        FabLog(onPressed: onLog),
      ],
    );
  }
}

class _NavTab extends StatelessWidget {
  const new({
    required this.destination,
    required this.selected,
    required this.onTap,
  });

  final FloatingNavDestination destination;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    return Semantics(
      button: true,
      selected: selected,
      child: InkWell(
        onTap: onTap,
        customBorder: const StadiumBorder(),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 56),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 52,
                height: 32,
                decoration: selected
                    ? BoxDecoration(
                        color: c.accent,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(AppRadius.pill),
                        ),
                      )
                    : null,
                // Icon on the accent pill uses onAccent (DS-1).
                child: Icon(
                  destination.icon,
                  size: 24,
                  color: selected ? c.onAccent : c.navOff,
                ),
              ),
              const SizedBox(height: 2),
              // Tab labels scale up to 130% (like Material's NavigationBar)
              // and shrink to fit the tab instead of clipping.
              MediaQuery.withClampedTextScaling(
                maxScaleFactor: 1.3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.s4,
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      destination.label,
                      maxLines: 1,
                      style: AppTypography.label.copyWith(
                        color: selected ? c.navOn : c.navOff,
                        fontWeight: selected
                            ? FontWeight.w700
                            : FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
