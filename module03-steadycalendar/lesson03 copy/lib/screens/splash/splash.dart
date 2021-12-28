import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:gotrue/gotrue.dart' as gotrue;
import 'package:provider/provider.dart' as provider;
import '/providers/session.dart';
import '/screens/cal_pager/cal_pager.dart';
import '/screens/intro/intro.dart';

class Splash extends StatefulWidget {
  static const routeName = '/';

  final State<Splash> state;

  const Splash(this.state, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<Splash> createState() => state;
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
    provider.Provider.of<SessionProvider>(context, listen: false)
        .refreshCalendars();

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
