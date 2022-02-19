import 'package:flutter/material.dart';
import 'dart:math';

class Tile extends StatelessWidget {
  final String title;

  const Tile(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.primaries[Random().nextInt(Colors.primaries.length)],
          Colors.primaries[Random().nextInt(Colors.primaries.length)],
        ],
      ))),
      Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title.toUpperCase(),
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.end,
                )
              ])),
    ]);
  }
}
