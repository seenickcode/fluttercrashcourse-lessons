import 'package:flutter/material.dart';
import 'screens/splash/splash.dart';
// import '/screens/cal_edit/cal_bg_picker.dart';
// import '/screens/cal_edit/cal_color_picker.dart';
// import '/screens/cal_edit/cal_edit.dart';
import '/screens/cal_pager/cal_pager.dart';
// import '/screens/cal_list/cal_list.dart';
import '/screens/intro/intro.dart';
import '/screens/intro/login_options.dart';
// import '/screens/menu/menu.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steady Calendar',
      initialRoute: CalPager.routeName,
      routes: {
        Splash.routeName: (context) => Splash(),
        CalPager.routeName: (context) => CalPager(),
        Intro.routeName: (context) => Intro(),
        LoginOptions.routeName: (context) => LoginOptions(),
        // CalList.routeName: (context) => CalList(),
        // CalEdit.routeName: (context) => CalEdit(),
        // CalBGPicker.routeName: (context) => CalBGPicker(),
        // CalColorPicker.routeName: (context) => CalColorPicker(),
        // Menu.routeName: (context) => Menu()
      },
    );
  }
}
