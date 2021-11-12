import 'package:flutter/material.dart';

class LoginOptions extends StatelessWidget {
  static const String routeName = '/intro/login_options';

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Stack(children: [
      Container(
          decoration: BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage('assets/images/pink-plants@3x.png'),
              //   fit: BoxFit.cover,
              // ),
              //NetworkImage(Endpoint.assetUri(CalBG.blank().path3x).toString()),
              )),
      Container(
          decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.5),
      )),
      Center(
          // TODO use an InkWell instead to show some indicator user has tapped this?
          // TODO use a callback instead to offer customization of logic when
          // login is finished successfully?
          child: GestureDetector(
              child: Image.asset(
        'assets/icons/continue-with-google@3x.png',
        width: MediaQuery.of(context).size.width * 0.75,
      ))),
    ])));
  }
}
