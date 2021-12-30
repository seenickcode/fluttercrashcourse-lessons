import 'package:flutter/material.dart';
import '/config/constants.dart';
import './cal_color_tile.dart';
import '/components/sc_nav_bar.dart';

class CalColorPicker extends StatelessWidget {
  static const String routeName = '/cal_edit/color_picker';

  const CalColorPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SCNavBar(
        title: 'Choose Color',
        child: ListView(
          children: colors
              .map((e) => CalColorTile(e,
                  key: Key(e.hex), // k = hex value, v = name of the color
                  onTap: () => Navigator.of(context).pop(e.hex)))
              .toList(),
        ));
  }
}
