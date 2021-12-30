import 'package:flutter/material.dart';

class SCNavBarImageButton extends StatelessWidget {
  final String iconFilename;
  final GestureTapCallback? onTap;
  final double width;
  final double height;
  final double tapAreaWidth;
  final double tapAreaHeight;

  SCNavBarImageButton(
      {required this.iconFilename,
      this.onTap,
      this.width: 35.0,
      this.height: 35.0,
      this.tapAreaWidth: 60.0,
      this.tapAreaHeight: 60.0});

  @override
  Widget build(BuildContext context) {
    final lrPad = (this.tapAreaWidth - this.width) / 2;
    final tbPad = (this.tapAreaHeight - this.height) / 2;

    return GestureDetector(
        onTap: onTap,
        child: Center(
            child: Container(
                padding: EdgeInsets.fromLTRB(lrPad, tbPad, lrPad, tbPad),
                // decoration: BoxDecoration(
                //   color: Colors.red,
                // ),
                child: Container(
                    constraints: BoxConstraints.tightFor(
                      width: this.width,
                      height: this.height,
                    ),
                    decoration: BoxDecoration(
                        // color: Colors.blue,
                        image: new DecorationImage(
                      image: new AssetImage(iconFilename),
                      fit: BoxFit.contain,
                    ))))));
  }
}
