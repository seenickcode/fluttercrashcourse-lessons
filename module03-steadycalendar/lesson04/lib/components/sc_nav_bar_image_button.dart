import 'package:flutter/material.dart';

class SCNavBarImageButton extends StatelessWidget {
  final String iconFilename;
  final GestureTapCallback? onTap;
  final double width;
  final double height;
  final double tapAreaWidth;
  final double tapAreaHeight;

  const SCNavBarImageButton(
      {Key? key, required this.iconFilename,
      this.onTap,
      this.width = 35.0,
      this.height = 35.0,
      this.tapAreaWidth = 60.0,
      this.tapAreaHeight = 60.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lrPad = (tapAreaWidth - width) / 2;
    final tbPad = (tapAreaHeight - height) / 2;

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
                      width: width,
                      height: height,
                    ),
                    decoration: BoxDecoration(
                        // color: Colors.blue,
                        image: DecorationImage(
                      image: AssetImage(iconFilename),
                      fit: BoxFit.contain,
                    ))))));
  }
}
