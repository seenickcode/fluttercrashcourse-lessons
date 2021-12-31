import 'package:flutter/material.dart';

class SCFooterButton extends StatelessWidget {
  final String iconFilename;
  final GestureTapCallback? onTap;

  const SCFooterButton(this.iconFilename, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            constraints: const BoxConstraints.tightFor(
              width: 60.0,
              height: 60.0,
            ),
            alignment: Alignment.center,
            child: Container(
                constraints: const BoxConstraints.tightFor(width: 30.0, height: 30.0),
                decoration: BoxDecoration(
                    // color: Colors.blue,
                    image:  DecorationImage(
                  image: AssetImage(iconFilename),
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                )))));
  }
}
