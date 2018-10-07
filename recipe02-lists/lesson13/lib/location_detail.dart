import 'package:flutter/material.dart';
import 'models/location.dart';
import 'styles.dart';

class LocationDetail extends StatefulWidget {
  final int locationID;

  LocationDetail(this.locationID);

  @override
  _LocationDetailState createState() => _LocationDetailState(this.locationID);
}

class _LocationDetailState extends State<LocationDetail> {
  int locationID;
  Location location = Location.blank();

  _LocationDetailState(this.locationID);

  @override
  void initState() {
    super.initState();
    _fetchLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(location.name, style: Styles.navBarTitle)),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _renderBody(context, location),
        )));
  }

  void _fetchLocation() async {
    final newLocation = await Location.fetchByID(this.locationID);
    if (this.mounted) {
      setState(() {
        this.location = newLocation;
      });
    }
  }

  List<Widget> _renderBody(BuildContext context, Location location) {
    var result = List<Widget>();
    result.add(_bannerImage(location.url, 170.0));
    result.addAll(_renderFacts(context, location));
    return result;
  }

  List<Widget> _renderFacts(BuildContext context, Location location) {
    var result = List<Widget>();
    for (int i = 0; i < location.facts.length; i++) {
      result.add(_sectionTitle(location.facts[i].title));
      result.add(_sectionText(location.facts[i].text));
    }
    return result;
  }

  Widget _sectionTitle(String text) {
    return Container(
        padding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 10.0),
        child:
            Text(text, textAlign: TextAlign.left, style: Styles.headerLarge));
  }

  Widget _sectionText(String text) {
    return Container(
        padding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
        child: Text(text, style: Styles.textDefault));
  }

  Widget _bannerImage(String url, double height) {
    Image image;
    try {
      image = Image.network(url, fit: BoxFit.fitWidth);
    } catch (e) {
      print("could not load image $url");
    }
    return Container(
      constraints: BoxConstraints.tightFor(height: height),
      child: image,
    );
  }
}
