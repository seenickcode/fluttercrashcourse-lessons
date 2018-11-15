import 'package:flutter/material.dart';
import 'components/banner_image.dart';
import 'models/location.dart';

class LocationList extends StatelessWidget {
  final List<Location> locations = Location.fetchAll();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: listItemBuilder,
        ));
  }

  Widget listItemBuilder(BuildContext context, int index) {
    final location = this.locations[index];
    return Container(
      height: 400.0,
      child: Column(
        children: [
          BannerImage(url: location.url, height: 300.0),
          Container(
              padding: EdgeInsets.all(20.0),
              child: Text(location.name, style: TextStyle(fontSize: 20.0))),
        ],
      ),
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
