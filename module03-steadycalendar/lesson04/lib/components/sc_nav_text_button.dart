import 'package:flutter/material.dart';
import '../config/styles.dart';

class SCNavBarTextButton extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;

  const SCNavBarTextButton({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Center(
            child: Container(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 16.0, 10.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Styles.primaryTextColor,
                              fontSize: Styles.primaryButtonFontSize,
                              fontFamily: Styles.primaryFontRegular))
                    ]))));
  }
}
