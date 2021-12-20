import 'package:flutter/material.dart';

Color hexToColor(String code, {double opacity = 1.0}) {
  return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000)
      .withOpacity(opacity);
}
