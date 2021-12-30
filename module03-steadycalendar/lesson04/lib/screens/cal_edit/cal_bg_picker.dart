import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '/config/constants.dart';
import '/components/sc_nav_bar.dart';

class CalBGPicker extends StatelessWidget {
  static const String routeName = '/cal_edit/bg_picker';

  const CalBGPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SCNavBar(
        title: 'Choose Background',
        child: GridView.count(
            childAspectRatio: 0.56,
            crossAxisCount: 4,
            padding: const EdgeInsets.all(2.0),
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            children: backgrounds
                .map((backgroundSlug) => GridTile(
                    key: Key(backgroundSlug),
                    child: InkResponse(
                        enableFeedback: true,
                        onTap: () => Navigator.of(context).pop(backgroundSlug),
                        child: Container(
                            decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "${baseBackgroundImageURL(env['SUPABASE_PROJECT_ID']!)}/$backgroundSlug")),
                        )))))
                .toList()));
  }
}
