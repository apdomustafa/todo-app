import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/icons.dart';

class PasswordMismatchDialog extends StatelessWidget {
  final Function onDismiss;
  final String message;

  const PasswordMismatchDialog(
      {super.key, required this.onDismiss, required this.message});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Error'),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            onDismiss();
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
