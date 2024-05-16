import 'package:flutter/material.dart';

void showAlertDialolg(BuildContext context,
    {required VoidCallback onDelete, required VoidCallback onCancel}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Delete Item"),
          content: const Text("Are you sure you want to delete this item?"),
          actions: <Widget>[
            TextButton(
              onPressed: onCancel,
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                onDelete();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Delete"),
            ),
          ],
        );
      });
}
