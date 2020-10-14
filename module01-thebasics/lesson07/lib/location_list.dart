import 'package:flutter/material.dart';
import 'package:lesson07/styles.dart';

import 'models/location.dart';

class LocationList extends StatelessWidget {
  final List<Location> _locations;

  LocationList(this._locations);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Locations',
          style: Styles.navBarTitle,
        ),
      ),
      body: ListView.builder(
        itemCount: this._locations.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: _itemThumbnail(this._locations[index]),
            title: _itemTitle(this._locations[index]),
          );
        },
      ),
    );
  }

  Widget _itemThumbnail(Location location) {
    return Container(
      constraints: BoxConstraints.tightFor(width: 100.0),
      child: Image.network(
        location.url,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget _itemTitle(Location location){
    return Text(
      location.name,
      style:  Styles.textDefault,

    );
  }
}
