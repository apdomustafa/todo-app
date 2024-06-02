import 'package:flutter/material.dart';

Future<DateTime?> getDate(
    {required BuildContext context,
    required void Function(String date) date}) async {
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
    date(newDate.toString());
    return newDate;
  }
}
