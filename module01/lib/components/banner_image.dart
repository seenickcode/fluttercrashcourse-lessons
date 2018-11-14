import 'package:flutter/material.dart';

class BannerImage extends StatelessWidget {
  final String url;
  final double height;

  BannerImage({this.url, this.height});

  @override
  Widget build(BuildContext context) {
    Image image;
    try {
      image = Image.network(url, fit: BoxFit.cover);
    } catch (e) {
      print("could not load image $url");
    }
    return Container(
      constraints: BoxConstraints.expand(height: height),
      child: image,
    );
  }
}
