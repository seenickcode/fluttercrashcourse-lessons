import 'package:flutter/material.dart';
import '/config/styles.dart';

class SCFlatButton extends StatelessWidget {
  final Widget child;
  final GestureTapCallback? onTap;
  final Color? textColor;
  final Color? backgroundColor;

  SCFlatButton(this.child, {this.textColor, this.backgroundColor, this.onTap});

  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: (backgroundColor ?? Styles.primaryHighlightColor),
            onPrimary: (textColor ?? Colors.white),
            elevation: 1,
            textStyle: TextStyle(
                fontFamily: Styles.primaryFontRegular,
                fontWeight: Styles.primaryFontWeightLight,
                fontSize: Styles.primaryButtonFontSize),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)))),
        child: child,
        onPressed: onTap);
  }
}
