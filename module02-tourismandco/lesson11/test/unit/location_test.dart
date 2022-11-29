import 'package:flutter_test/flutter_test.dart';
import 'package:layout_practice/mocks/mock_location.dart';

void main() {

  test('test /locations and /locations/:id', () async {
    final locations = await MockLocation.fetchAll();
    int index = 0;
    for (var location in locations) {
      expect(location.name, hasLength(greaterThan(0)));
      expect(location.url, hasLength(greaterThan(0)));

      final fetchedLocation =  MockLocation.fetch(index);
      expect(fetchedLocation.name, equals(location.name));
      expect(fetchedLocation.url, equals(location.url));
      expect(fetchedLocation.facts, hasLength(greaterThan(0)));
      index++;
    }
  });
}
