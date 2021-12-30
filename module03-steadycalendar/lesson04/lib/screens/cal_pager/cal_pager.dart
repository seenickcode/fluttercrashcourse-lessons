import 'package:flutter/material.dart';
import '/screens/cal_edit/cal_edit.dart';
import 'package:provider/provider.dart';
import '/providers/session_provider.dart';
import '/screens/cal_list/cal_list.dart';
import '/screens/cal_pager/cal_view/cal_view.dart';

class CalPager extends StatelessWidget {
  static const String routeName = '/cal_pager';
  static const String calListIconKey = 'cal-list-icon';

  const CalPager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SessionProvider>(builder: (context, session, _) {
      return Scaffold(
          body: Stack(children: [
        PageView(children: session.cals.map((cal) => CalView(cal)).toList()),
        Positioned(
            left: 20.0,
            bottom: 20.0,
            child: IconButton(
                key: const Key(calListIconKey),
                icon: Image.asset('assets/icons/icon-menu@3x.png'),
                iconSize: 35,
                onPressed: () =>
                    Navigator.pushNamed(context, CalList.routeName))),
        (session.cals.isEmpty
            ? Center(
                child: IconButton(
                    icon: Image.asset('assets/icons/icon-plus@3x.png'),
                    iconSize: 35,
                    onPressed: () => Navigator.pushNamed(
                        context, CalEdit.routeName,
                        arguments: CalEditArguments(null))))
            : Container()),
      ]));
    });
  }
}
