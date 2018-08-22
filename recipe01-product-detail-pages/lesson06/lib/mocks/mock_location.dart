import '../models/location.dart';
import '../models/location_fact.dart';

class MockLocation {
  static Location fetchAny() {
    return Location(
        name: 'Arashiyama Bamboo Grove',
        url:
            'http://everydaydreamholiday.com/wp-content/uploads/2013/01/Arashiyama-bamboo-grove-path_kyoto_japan.jpg',
        facts: <LocationFact>[
          LocationFact(
              title: 'Summary',
              text:
                  'While we could go on about the ethereal glow and seemingly endless heights of this bamboo grove on the outskirts of Kyoto, the sight\'s pleasures extend beyond the visual realm'),
          LocationFact(
              title: 'How to Get There',
              text:
                  'Kyoto airport, with several terminals, is located 16 kilometres south of the city and is also known as Kyoto. Kyoto can also be reached by transport links from other regional airports.')
        ]);
  }
}
