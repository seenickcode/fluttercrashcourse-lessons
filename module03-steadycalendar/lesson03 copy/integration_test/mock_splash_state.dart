import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lesson03/providers/session.dart';
import 'package:lesson03/screens/cal_pager/cal_pager.dart';
import 'package:lesson03/screens/intro/intro.dart';
import 'package:lesson03/screens/splash/splash.dart';

class MockSplashState extends State<Splash> {
  MockSplashState();

  @override
  void initState() {
    super.initState();

    // NOTE trick to wait for state to be ready
    Future.delayed(Duration.zero, () async {
      // simulate a supabase state without any session
      Navigator.of(context).pushNamedAndRemoveUntil(
          Intro.routeName, ModalRoute.withName(Splash.routeName));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  login() async {
    if (mounted) {
      Provider.of<SessionProvider>(context, listen: false).refreshCalendars();

      Navigator.of(context).pushNamedAndRemoveUntil(
          CalPager.routeName, ModalRoute.withName(Splash.routeName));
    }
  }
}
