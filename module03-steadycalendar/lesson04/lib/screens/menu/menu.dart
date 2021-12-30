import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '/screens/intro/intro.dart';
import '/config/constants.dart';
import '/components/sc_list_container.dart';
import '/components/sc_list_divider.dart';
import '/components/sc_list_tile.dart';
import '/components/sc_nav_bar.dart';
import '/screens/splash/splash.dart';
import '/util/alert.dart';

class Menu extends StatelessWidget {
  static const String routeName = '/menu';

  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SCNavBar(
        title: '',
        child: SCListContainer([
          SCListTile('About',
              onTap: () => _attemptLaunchUrl(context, appWebsite)),
          const SCListDivider(),
          SCListTile('Submit Feedback',
              onTap: () =>
                  _attemptLaunchUrl(context, 'mailto:$appSupportEmail')),
          const SCListDivider(),
          SCListTile('Rate Steady Calendar',
              onTap: () => _attemptLaunchUrl(context, _rateUrl(context))),
          const SCListDivider(),
          SCListTile('Log Out', onTap: () => _logout(context)),
        ]),
        isModal: true);
  }

  _logout(BuildContext context) async {
    await Supabase.instance.client.auth.signOut();

    // NOTE while signOut triggers some event internally in the supabase lib,
    // unfortunately flutter_supabase's AuthState onUnauthenticated() does not
    // get called when signing out, so we have to update the route stack ourselves.
    // Sadly, this causes some brittleness and code duplication with our auth_state.dart
    // Example: https://github.com/supabase/supabase/blob/master/examples/flutter-user-management/lib/screens/profile_screen.dart#L82
    // I opened a discussion on this https://github.com/supabase/supabase/discussions/3430
    Navigator.of(context).pushNamedAndRemoveUntil(
        Intro.routeName, ModalRoute.withName(Splash.routeName));
  }

  String _rateUrl(BuildContext context) {
    final ios = Theme.of(context).platform == TargetPlatform.iOS;
    return (ios ? appRatingURLiOS : appRatingURLAndroid);
  }

  void _attemptLaunchUrl(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showAlert(context, '', 'Could not launch $url');
    }
  }
}
