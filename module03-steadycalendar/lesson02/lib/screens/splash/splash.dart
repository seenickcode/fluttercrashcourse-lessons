import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:gotrue/gotrue.dart' as gotrue;
import '/screens/cal_pager/cal_pager.dart';
import '/screens/intro/intro.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends SupabaseAuthState<Splash> {
  @override
  void initState() {
    super.initState();
    recoverSupabaseSession();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  @override
  void onUnauthenticated() {
    Navigator.of(context).pushNamedAndRemoveUntil(
        Intro.routeName, ModalRoute.withName(Splash.routeName));
  }

  @override
  void onAuthenticated(gotrue.Session session) async {
    Navigator.of(context).pushNamedAndRemoveUntil(
        CalPager.routeName, ModalRoute.withName(Splash.routeName));
  }

  @override
  void onPasswordRecovery(gotrue.Session session) {}

  @override
  void onErrorAuthenticating(String message) {
    print('error authenticating: ' + message);
  }

  @override
  void onReceivedAuthDeeplink(Uri uri) {}
}
