import 'package:flutter/material.dart';
import 'package:todo_app2/core/theming/colors.dart';

class PriorityPickerBottomPart extends StatelessWidget {
  const PriorityPickerBottomPart({super.key, required this.selectPriority});
  final VoidCallback selectPriority;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: AppColors.labelColor),
                ))),
        Expanded(
            child: TextButton(
                onPressed: selectPriority,
                child: const Text(
                  'Save',
                ))),
      ],
    );
  }
}
