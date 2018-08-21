import 'package:flutter/material.dart';

class Styles {
  static const _textSizeLarge = 25.0;
  static final Color _textColorDefault = _hexToColor('333333');
  static final textStyleHeaderPrimary = TextStyle(
    fontSize: _textSizeLarge,
    color: _textColorDefault,
  );

  static Color _hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }
}
