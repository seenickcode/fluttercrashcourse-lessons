import 'package:flutter/material.dart';

class SCImageButton extends StatelessWidget {
  final String assetName;
  final String text;

  SCImageButton(this.assetName, this.text);

  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(0, 10.0, 20.0, 10.0),
              child: Image.asset(assetName, height: 40.0)),
          Text(text)
        ]);
  }
}
