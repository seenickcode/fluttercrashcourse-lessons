import 'package:flutter/material.dart';
import 'screens/splash/splash.dart';
import '/screens/cal_pager/cal_pager.dart';
import '/screens/intro/intro.dart';
import '/screens/login_options/login_options.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steady Calendar',
      initialRoute: Intro.routeName, // Splash.routeName,
      routes: {
        Splash.routeName: (context) => const Splash(),
        CalPager.routeName: (context) => const CalPager(),
        Intro.routeName: (context) => const Intro(),
        LoginOptions.routeName: (context) => const LoginOptions(),
        // CalList.routeName: (context) => CalList(),
        // CalEdit.routeName: (context) => CalEdit(),
        // CalBGPicker.routeName: (context) => CalBGPicker(),
        // CalColorPicker.routeName: (context) => CalColorPicker(),
        // Menu.routeName: (context) => Menu()
      },
    );
  }
}
