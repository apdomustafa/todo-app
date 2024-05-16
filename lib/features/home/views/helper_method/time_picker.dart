import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinner_time_picker/flutter_spinner_time_picker.dart';
import 'package:todo_app2/core/DI.dart';
import 'package:todo_app2/core/models/task_module.dart';
import 'package:todo_app2/core/theming/colors.dart';

TimeOfDay selectedTime = TimeOfDay.now();

Future<void> getTaskTime(
    {required BuildContext context,
    required void Function(String time) time}) async {
  final pickedTime = await showSpinnerTimePicker(context,
      initTime: selectedTime,
      is24HourFormat: false,
      height: 206,
      spinnerBgColor: AppColors.tertiaryColor);

  if (pickedTime != null) {
    time('${pickedTime.hour}:${pickedTime.minute}');
  }
}
