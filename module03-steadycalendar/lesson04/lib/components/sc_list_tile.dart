import 'package:flutter/material.dart';
import '/config/styles.dart';

class SCListTile extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final GestureTapCallback? onTap;

  SCListTile(this.title, {this.trailing, this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO consider consolidating this style with style and decoration we use for TextFormFields?
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          // border: Border(
          //   bottom: Divider.createBorderSide(context,
          //       width: 1.0, color: Styles.dividerColor),
          // ),
        ),
        // NOTE we're using custom padding here to mimic Styles.textFormFieldDecoration,
        // a necessary evil for now
        padding: EdgeInsets.fromLTRB(0.0, 12.0, 25.0, 12.0),
        child: ListTile(
          title: Text(this.title, style: Styles.textFormFieldStyle),
          trailing: this.trailing,
          onTap: this.onTap,
        ));
  }
}
