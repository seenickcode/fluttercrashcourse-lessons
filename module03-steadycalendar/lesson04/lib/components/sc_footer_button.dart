import 'package:flutter/material.dart';

class SCFooterButton extends StatelessWidget {
  final String iconFilename;
  final GestureTapCallback? onTap;

  SCFooterButton(this.iconFilename, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            constraints: BoxConstraints.tightFor(
              width: 60.0,
              height: 60.0,
            ),
            alignment: Alignment.center,
            child: Container(
                constraints: BoxConstraints.tightFor(width: 30.0, height: 30.0),
                decoration: BoxDecoration(
                    // color: Colors.blue,
                    image: new DecorationImage(
                  image: new AssetImage(iconFilename),
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                )))));
  }
}
