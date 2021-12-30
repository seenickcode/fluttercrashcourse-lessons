import 'package:flutter/material.dart';
import '/components/sc_list_tile.dart';
import '/config/styles.dart';
import '/models/calendar_color.dart';

class CalColorTile extends StatelessWidget {
  final CalendarColor color;
  final Function()? onTap;

  CalColorTile(this.color, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SCListTile(color.name,
        trailing: Container(
            width: 75.0,
            height: 50.0,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Styles.hexToColor(color.hex),
                    borderRadius: BorderRadius.circular(40.0),
                  ))
            ])),
        onTap: onTap);
  }
}
