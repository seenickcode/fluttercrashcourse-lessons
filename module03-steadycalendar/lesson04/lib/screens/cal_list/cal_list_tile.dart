import 'package:flutter/material.dart';
import '/models/calendar.dart';
import '/config/styles.dart';

class CalListTile extends StatelessWidget {
  final Calendar cal;
  final Function()? onTap;

  const CalListTile(this.cal, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 13.0),
        decoration: BoxDecoration(
          color: Styles.hexToColor(cal.colorHex),
        ),
        child: ListTile(
            title: Text(cal.name,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: Styles.primaryFontRegular,
                    fontSize: Styles.primaryHeaderFontSize)),
            subtitle: null,
            leading: null,
            onTap: onTap));
  }
}
