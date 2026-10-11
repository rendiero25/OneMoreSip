import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:onemoresip/app/theme/app_colors.dart';
import 'package:onemoresip/app/theme/app_dimens.dart';
import 'package:onemoresip/app/theme/app_typography.dart';
import 'package:onemoresip/features/safety/domain/safety_policy.dart';
import 'package:onemoresip/l10n/gen/app_localizations.dart';

/// The user's answer: whether a doctor set a limit and, if so, the limit
/// once it is valid (`validMl` is `null` while the field is empty or
/// invalid, and always `null` when `hasRestriction` is false).
typedef RestrictionAnswer = ({bool hasRestriction, int? validMl});

/// "Has a doctor limited how much you can drink?" with Yes / No and, on
/// Yes, a ml field with − / + buttons in 50 ml steps (F-01, F-28, D-34).
/// Reports every change through [onChanged]; it does not persist anything.
class FluidRestrictionField extends StatefulWidget {
  /// Creates the field. [initial] `null` leaves both answers unselected
  /// (onboarding); settings pass the stored answer.
  const new({required this.onChanged, this.initial, super.key});

  /// Called with the new answer after every change.
  final ValueChanged<RestrictionAnswer> onChanged;

  /// Starting answer.
  final RestrictionAnswer? initial;

  @override
  State<FluidRestrictionField> createState() => _FluidRestrictionFieldState();
}

class _FluidRestrictionFieldState extends State<FluidRestrictionField> {
  late bool? _hasRestriction = widget.initial?.hasRestriction;
  late final _ml = TextEditingController(
    text: widget.initial?.validMl?.toString() ?? '',
  );

  @override
  void dispose() {
    _ml.dispose();
    super.dispose();
  }

  int? get _typed => int.tryParse(_ml.text);

  bool get _isValid =>
      _typed != null &&
      validateRestrictionMl(_typed!) == RestrictionValidation.valid;

  void _report() {
    final has = _hasRestriction ?? false;
    widget.onChanged((
      hasRestriction: has,
      validMl: has && _isValid ? _typed : null,
    ));
  }

  void _answer({required bool hasRestriction}) {
    setState(() => _hasRestriction = hasRestriction);
    _report();
  }

  void _step({required bool up}) {
    _ml.text = stepRestrictionMl(_typed, up: up).toString();
    setState(() {});
    _report();
  }

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    final l10n = AppLocalizations.of(context);
    final showError = _ml.text.isNotEmpty && !_isValid;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Semantics(
          header: true,
          child: Text(
            l10n.restrictionQuestion,
            style: AppTypography.h2.copyWith(color: c.ink),
          ),
        ),
        const SizedBox(height: AppSpacing.s16),
        Row(
          children: [
            Expanded(
              child: _Choice(
                label: l10n.restrictionYes,
                selected: _hasRestriction ?? false,
                onTap: () => _answer(hasRestriction: true),
              ),
            ),
            const SizedBox(width: AppSpacing.s12),
            Expanded(
              child: _Choice(
                label: l10n.restrictionNo,
                selected: _hasRestriction == false,
                onTap: () => _answer(hasRestriction: false),
              ),
            ),
          ],
        ),
        if (_hasRestriction ?? false) ...[
          const SizedBox(height: AppSpacing.s20),
          ExcludeSemantics(
            child: Text(
              l10n.restrictionLimitLabel,
              style: AppTypography.label.copyWith(
                color: c.ink,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.s8),
          Row(
            children: [
              _StepButton(
                icon: LucideIcons.minus,
                tooltip: l10n.restrictionDecrease(restrictionStepMl),
                onPressed: () => _step(up: false),
              ),
              const SizedBox(width: AppSpacing.s8),
              Expanded(
                child: Semantics(
                  label: l10n.restrictionLimitLabel,
                  child: TextField(
                    controller: _ml,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(5),
                    ],
                    style: AppTypography.title.copyWith(
                      color: c.ink,
                      fontWeight: FontWeight.w700,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: c.surface,
                      enabledBorder: _border(c.line, 1.5),
                      focusedBorder: _border(c.ink, 2),
                    ),
                    onChanged: (_) {
                      setState(() {});
                      _report();
                    },
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.s8),
              _StepButton(
                icon: LucideIcons.plus,
                tooltip: l10n.restrictionIncrease(restrictionStepMl),
                onPressed: () => _step(up: true),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.s8),
          Text(
            l10n.restrictionHint,
            style: AppTypography.label.copyWith(color: c.inkMuted),
          ),
          if (showError) ...[
            const SizedBox(height: AppSpacing.s8),
            _Note(
              icon: LucideIcons.circleAlert,
              text: l10n.restrictionInvalid(
                minRestrictionMl,
                maxRestrictionMl,
                restrictionStepMl,
              ),
              color: c.badFg,
              liveRegion: true,
            ),
          ],
          if (_isValid) ...[
            const SizedBox(height: AppSpacing.s12),
            DecoratedBox(
              decoration: BoxDecoration(
                color: c.okBg,
                borderRadius: const BorderRadius.all(
                  Radius.circular(AppRadius.md),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.s16),
                child: _Note(
                  icon: LucideIcons.shieldCheck,
                  text: l10n.restrictionReassurance,
                  color: c.okFg,
                ),
              ),
            ),
          ],
        ],
      ],
    );
  }

  static OutlineInputBorder _border(Color color, double width) =>
      OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(AppRadius.md)),
        borderSide: BorderSide(color: color, width: width),
      );
}

/// One Yes / No option: selected shows an accent border, tint and a check
/// mark, so the state is never color alone.
class _Choice extends StatelessWidget {
  const new({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    return Semantics(
      button: true,
      inMutuallyExclusiveGroup: true,
      checked: selected,
      child: Material(
        color: selected ? c.accentTint : c.surface,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(AppRadius.md)),
          side: BorderSide(color: selected ? c.accent : c.line, width: 2),
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 64),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.s16,
                vertical: AppSpacing.s12,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      label,
                      style: AppTypography.title.copyWith(
                        color: c.ink,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.s8),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selected ? c.accent : null,
                      border: Border.all(
                        color: selected ? c.accent : c.line,
                        width: 2,
                      ),
                    ),
                    child: SizedBox.square(
                      dimension: 28,
                      child: selected
                          ? Icon(LucideIcons.check, size: 16, color: c.onAccent)
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 48 dp outlined − / + button.
class _StepButton extends StatelessWidget {
  const new({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    return IconButton(
      icon: Icon(icon),
      tooltip: tooltip,
      onPressed: onPressed,
      color: c.ink,
      style: IconButton.styleFrom(
        minimumSize: const Size.square(56),
        backgroundColor: c.surface,
        side: BorderSide(color: c.line, width: 1.5),
      ),
    );
  }
}

/// Icon + text line in one color.
class _Note extends StatelessWidget {
  const new({
    required this.icon,
    required this.text,
    required this.color,
    this.liveRegion = false,
  });

  final IconData icon;
  final String text;
  final Color color;
  final bool liveRegion;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      liveRegion: liveRegion,
      container: true,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: AppSpacing.s8),
          Expanded(
            child: Text(
              text,
              style: AppTypography.label.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
