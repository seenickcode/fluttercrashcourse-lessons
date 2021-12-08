import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'background.dart';

class CalPager extends StatelessWidget {
  static const String routeName = '/cal_pager';

  const CalPager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
            children: [
          'adventures-begin-mug@3x.png',
          'apple-and-juice@3x.png',
          'apples-on-tree@3x.png'
        ].map((name) => Background(name)).toList()),
        (Supabase.instance.client.auth.currentUser != null
            ? Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Text(Supabase.instance.client.auth.currentUser!.id),
                    TextButton(onPressed: _logOut, child: const Text("Log Out"))
                  ]))
            : Container())
      ],
    ));
  }

  _logOut() async {
    await Supabase.instance.client.auth.signOut();
    // NOTE splash.dart will handle navigation when it handles auth updates
  }
}
