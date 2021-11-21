import 'package:flutter/material.dart';
import '/screens/splash/splash.dart';
import '/screens/cal_pager/cal_pager.dart';
import '/screens/intro/intro.dart';
import '/screens/login_options/login_options.dart';

class App extends StatelessWidget {
  final State<Splash> splashState;

  const App(this.splashState, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steady Calendar',
      initialRoute: Splash.routeName,
      routes: {
        Splash.routeName: (context) => Splash(splashState),
        CalPager.routeName: (context) => const CalPager(),
        Intro.routeName: (context) => const Intro(),
        LoginOptions.routeName: (context) => const LoginOptions(),
      },
    );
  }
}
