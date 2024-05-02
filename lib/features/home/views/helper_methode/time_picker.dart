import 'package:flutter/material.dart';
import 'package:flutter_spinner_time_picker/flutter_spinner_time_picker.dart';
import 'package:todo_app2/core/theming/colors.dart';

TimeOfDay selectedTime = TimeOfDay.now();

void setTaskTime(BuildContext context) async {
  final pickedTime = await showSpinnerTimePicker(context,
      initTime: selectedTime,
      is24HourFormat: false,
      height: 206,
      spinnerBgColor: AppColors.tertiaryColor);

  if (pickedTime != null) {
    selectedTime = pickedTime;
  }
}
