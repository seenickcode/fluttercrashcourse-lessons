import 'package:flutter/material.dart';
import 'models/location.dart';
import 'styles.dart';

class LocationDetail extends StatelessWidget {
  final Location location;

  LocationDetail(this.location);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(location.name)),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _renderBody(context, this.location),
        ));
  }

  /// Renders a large image followed by a list of sections of text
  List<Widget> _renderBody(BuildContext context, Location location) {
    var result = List<Widget>();
    result.add(_bannerImage(location.url, 170.0));
    result.addAll(_renderFacts(context, location));
    return result;
  }

  List<Widget> _renderFacts(BuildContext context, Location location) {
    var result = List<Widget>();
    for (int i = 0; i < location.facts.length; i++) {
      result.add(_titleContainer(context, location.facts[i].title));
      result.add(_sectionText(context, location.facts[i].text));
    }
    return result;
  }

  Widget _titleContainer(BuildContext context, String text) {
    return Container(
        padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 10.0),
        child: _sectionTitle(text));
  }

  Widget _sectionTitle(String text) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: Styles.TextStyleHeaderPrimary,
    );
  }

  Widget _sectionText(BuildContext context, String text) {
    return Container(
        padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
        child: Text(text));
  }

  Widget _bannerImage(String url, double height) {
    return Container(
        constraints: BoxConstraints.tightFor(height: height),
        child: Image.network(url, fit: BoxFit.fitWidth));
  }
}
