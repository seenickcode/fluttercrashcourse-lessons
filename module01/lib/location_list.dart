import 'package:flutter/material.dart';
import 'components/banner_image.dart';

class LocationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BannerImage(
          url: 'http://fluttercrashcourse.com/assets/images/fuji@3x.jpg',
          height: 300.0),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'components/banner_image.dart';
// import 'models/location.dart';

// class LocationList extends StatelessWidget {
//   final locations = Location.fetchAll();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body: ListView.builder(
//           itemCount: this.locations.length,
//           itemBuilder: listViewItemBuilder,
//         ));
//   }

//   Widget listViewItemBuilder(BuildContext context, int index) {
//     final location = this.locations[index];

//     return Container(
//       height: 400.0,
//       child: Column(children: [
//         BannerImage(url: location.url, height: 300.0),
//         Container(
//           padding: EdgeInsets.all(20.0),
//           child: Text(location.name, style: TextStyle(fontSize: 20.0)),
//         ),
//       ]),
//     );
//   }
// }
