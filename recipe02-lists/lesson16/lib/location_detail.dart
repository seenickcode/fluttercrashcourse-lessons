import 'package:flutter/material.dart';
import 'models/location.dart';
import 'components/location_tile.dart';
import 'styles.dart';

const BannerImageHeight = 300.0;
const BodyVerticalPadding = 20.0;

class LocationDetail extends StatefulWidget {
  final int locationID;

  LocationDetail(this.locationID);

  @override
  createState() => _LocationDetailState(this.locationID);
}

class _LocationDetailState extends State<LocationDetail> {
  final int locationID;
  Location location = Location.blank();

  _LocationDetailState(this.locationID);

  @override
  void initState() {
    super.initState();
    loadData();
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

  loadData() async {
    final location = await Location.fetchByID(this.locationID);

    if (mounted) {
      setState(() {
        this.location = location;
      });
    }
  }

  List<Widget> _renderBody(BuildContext context, Location location) {
    var result = List<Widget>();
    result.add(_bannerImage(location.url, BannerImageHeight));
    result.add(_renderHeader());
    result.addAll(_renderFacts(context, location));
    result.add(_renderFooter());
    return result;
  }

  Widget _renderHeader() {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: BodyVerticalPadding,
            horizontal: Styles.horizontalPaddingDefault),
        child: LocationTile(location: location, darkTheme: false));
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
        padding: EdgeInsets.fromLTRB(Styles.horizontalPaddingDefault, 25.0,
            Styles.horizontalPaddingDefault, 0.0),
        child: Text(text.toUpperCase(),
            textAlign: TextAlign.left, style: Styles.headerLarge));
  }

  Widget _sectionText(String text) {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: 10.0, horizontal: Styles.horizontalPaddingDefault),
        child: Text(text, style: Styles.textDefault));
  }

  Widget _renderFooter() {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: BodyVerticalPadding,
          horizontal: Styles.horizontalPaddingDefault),
    );
  }

  Widget _bannerImage(String url, double height) {
    Image image;
    try {
      if (url.isNotEmpty) {
        image = Image.network(url, fit: BoxFit.cover);
      }
    } catch (e) {
      print("could not load image $url");
    }
    return Container(
      constraints: BoxConstraints.tightFor(height: height),
      child: image,
    );
  }
}
