/// Second line of defence for SD-9 / SC-07: health and personal data never
/// reach analytics or crash payloads, even if a typed event is misused.
library;

/// Property names SD-9 allows on analytics events.
const allowedPropertyNames = {
  'step',
  'experience',
  'source',
  'action',
  'goal_met',
  'feature',
  'placement',
  'product',
  'reward',
  'issue',
  'type',
  'kind',
  'state',
};

/// Property names that may carry forbidden data (SD-9): volumes, drink
/// IDs, goals, weight, fluid restriction, location, chat text, identity.
final forbiddenPropertyName = RegExp(
  '(^|_)(volume|ml|oz|amount|drink|drink_?id|weight|kg|restriction|fluid|'
  'location|lat|latitude|lng|lon|longitude|geohash|city|chat|text|message|'
  r'prompt|email|phone|name)($|_)|(^|_)goal(_?ml)?$',
  caseSensitive: false,
);

/// Returns the property names in [properties] that may not be sent:
/// forbidden by SD-9 or simply not on the allowlist.
List<String> rejectedProperties(Map<String, Object?> properties) => [
  for (final key in properties.keys)
    if (forbiddenPropertyName.hasMatch(key) ||
        !allowedPropertyNames.contains(key))
      key,
];
