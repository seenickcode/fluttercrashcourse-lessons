import 'package:flutter/material.dart';
import '/models/calendar.dart';
import '/config/styles.dart';
import 'background.dart';
import 'month_grid.dart';

class CalView extends StatelessWidget {
  final Calendar cal;

  const CalView(this.cal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      // background
      Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [Background(cal.backgroundSlug)]),
      // overlay
      Container(
          decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.65),
      )),
      Container(
          padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 80.0, 0.0, 40.0),
                  child: Text(
                    cal.name,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Styles.hexToColor(cal.colorHex),
                        fontFamily: Styles.primaryFontRegular,
                        fontSize: Styles.primaryHeaderFontSize),
                  ),
                ),
                MonthGrid(cal),
              ])),
    ]);
  }
}
