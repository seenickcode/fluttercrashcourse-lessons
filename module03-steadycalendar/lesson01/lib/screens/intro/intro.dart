import 'package:flutter/material.dart';
import 'login_options.dart';

class Intro extends StatelessWidget {
  static const String routeName = '/intro';

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
        decoration: BoxDecoration(color: Colors.white),
        width: MediaQuery.of(context).size.width, // TODO better way?
        height: MediaQuery.of(context).size.height, // TODO better way?
        child: Stack(children: [Text("intro")]));
  }

  // PageView _imagePager() {
  //   List<Image> images = <Image>[];
  //   for (var i = 0; i < 5; i++) {
  //     images.add(Image.asset(
  //       'assets/images/iphone-valprop-$i@3x.png',
  //       fit: BoxFit.cover,
  //       alignment: Alignment.center,
  //     ));
  //   }
  //   return PageView(
  //       scrollDirection: Axis.horizontal,
  //       reverse: false,
  //       onPageChanged: (int page) {},
  //       children: images);
  // }
}
