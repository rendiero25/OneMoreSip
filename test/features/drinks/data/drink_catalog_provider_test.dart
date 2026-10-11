import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onemoresip/features/drinks/data/drink_catalog_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('loads the bundled asset', () async {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final catalog = await container.read(drinkCatalogProvider.future);

    expect(catalog.drinks, isNotEmpty);
  });
}
