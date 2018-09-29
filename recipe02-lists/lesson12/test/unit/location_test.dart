import 'dart:convert';
import 'package:test/test.dart';
import '../../lib/models/location.dart';

void main() {
  test('test fetch all locations', () async {
    final locations = await Location.fetchAll();
    expect(locations.length, greaterThan(0));
  });

  test('test location deserialization', () {
    //  server response
    const locationJSON =
        '{ "name": "Arashiyama Bamboo Grove", "url": "https://cdn-images-1.medium.com/max/2000/1*vdJuSUKWl_SA9Lp-32ebnA.jpeg", "facts": [{ "title": "Summary", "text": "This bamboo grove is on the outskirts of Kyoto." }] }';

    final locationMap = json.decode(locationJSON) as Map<String, dynamic>;

    final location = Location.fromJson(locationMap);

    expect(location.name, equals(locationMap['name']));
    expect(location.url, equals(locationMap['url']));

    expect(location.facts[0].title, matches(locationMap['facts'][0]['title']));
    expect(location.facts[0].text, matches(locationMap['facts'][0]['text']));
  });
}
