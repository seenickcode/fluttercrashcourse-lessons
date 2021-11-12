import 'package:flutter/material.dart';

class CalPager extends StatelessWidget {
  const CalPager({Key? key}) : super(key: key);

  static const String routeName = '/cal_pager';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      // our calendar pager view
      Stack(children: [Container(color: Colors.grey, child: Container())]),
      Container(),
    ]));
  }
}
