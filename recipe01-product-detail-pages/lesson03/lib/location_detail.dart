import 'package:flutter/material.dart';

class LocationDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Beautiful Locations")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _sectionTitle("One", Colors.red),
            _sectionTitle("Two", Colors.green),
            _sectionTitle("Three", Colors.blue),
          ],
        ));
  }

  Widget _sectionTitle(String title, Color backgroundColor) {
    return Container(
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: Text(title));
  }
}
