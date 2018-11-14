class Location {
  final int id;
  final String name;
  final String url;

  Location({this.id, this.name, this.url});

  static List<Location> fetchAll() {
    return [
      Location(
          id: 1,
          name: 'Mount Fuji',
          url: 'http://fluttercrashcourse.com/assets/images/fuji@3x.jpg'),
      Location(
          id: 2,
          name: 'Arashiyama Bamboo Grove',
          url:
              'http://fluttercrashcourse.com/assets/images/kiyomizu-dera@3x.png')
    ];
  }
}
