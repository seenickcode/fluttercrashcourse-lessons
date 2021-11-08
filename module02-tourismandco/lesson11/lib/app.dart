import 'package:flutter/material.dart';
import 'mocks/mock_location.dart';
import 'location_list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mockLocations = MockLocation.fetchAll();
    return MaterialApp(home: LocationList(mockLocations));
  }
}
