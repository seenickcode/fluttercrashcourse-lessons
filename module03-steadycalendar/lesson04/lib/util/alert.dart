import 'package:flutter/material.dart';

Future<void> showAlert(
    BuildContext context, String title, String message) async {
  return showAlertWithActions(
      context, title, message, [_alertActionOk(context)]);
}

Future<void> showAlertWithActions(BuildContext context, String title,
    String message, List<Widget> actions) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actions: actions,
      );
    },
  );
}

Widget _alertActionOk(BuildContext context) {
  return TextButton(
    child: const Text('OK'),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
}
