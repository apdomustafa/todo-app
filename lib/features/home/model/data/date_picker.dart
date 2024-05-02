import 'package:flutter/material.dart';

Future<DateTime?> getDate(BuildContext context) async {
  final initialDate = DateTime.now();
  final newDate = await showDatePicker(
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 10),
      context: context,
      initialDate: initialDate,
      confirmText: 'Choose Time');
  if (newDate == null) {
    return null;
  } else {
    return newDate;
  }
}
