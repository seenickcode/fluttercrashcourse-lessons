import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  static const routeName = '/';

  final State<Splash> state;

  const Splash(this.state, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<Splash> createState() => state;
}
