/// BR-03 hydration counting (D-23).
library;

/// Millilitres of [volumeMl] that count toward the daily goal.
///
/// `volume × min(waterPct / 100, 1)`, rounded; alcoholic drinks count 0.
/// Caffeine and sugar are tracked separately and never reduce this.
int hydrationMl({
  required int volumeMl,
  required double waterPct,
  required bool isAlcoholic,
}) {
  if (isAlcoholic) return 0;
  final factor = (waterPct / 100).clamp(0.0, 1.0);
  return (volumeMl * factor).round();
}
