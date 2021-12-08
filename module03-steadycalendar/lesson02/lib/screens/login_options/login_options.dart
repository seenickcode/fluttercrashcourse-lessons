import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '/components/sc_image_button.dart';
import '/components/sc_flat_button.dart';
import '/config/styles.dart';

class LoginOptions extends StatelessWidget {
  static const String routeName = '/intro/login_options';

  const LoginOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
          decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/pink-plants@3x.png'),
          fit: BoxFit.cover,
        ),
      )),
      // semi-transparent overlay
      Container(
          decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.5),
      )),
      Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SCFlatButton(
                const SCImageButton('assets/images/google-logo-9808.png',
                    'Continue with Google'),
                textColor: Styles.primaryTextColor,
                backgroundColor: Colors.white,
                onTap: () => _signupTapped(context),
              )))
    ]));
  }

  Future _signupTapped(BuildContext context) async {
    // this will trigger one of our AuthState hooks
    await Supabase.instance.client.auth.signInWithProvider(Provider.google,
        options: AuthOptions(redirectTo: env['SUPABASE_AUTH_CALLBACK']!));
  }
}
