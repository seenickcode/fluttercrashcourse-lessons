import 'package:flutter/material.dart';
import '/config/styles.dart';

class SCListTile extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final GestureTapCallback? onTap;

  const SCListTile(this.title, {Key? key, this.trailing, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.fromLTRB(0.0, 12.0, 25.0, 12.0),
        child: ListTile(
          title: Text(title, style: Styles.textFormFieldStyle),
          trailing: trailing,
          onTap: onTap,
        ));
  }
}
