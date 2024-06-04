import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/icons.dart';

class PriorityPickerItem extends StatelessWidget {
  const PriorityPickerItem(
      {super.key, required this.priorityNum, required this.isSelected});
  final int priorityNum;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isSelected ? AppColors.primaryColor : AppColors.tertiaryColor,
      ),
      child: Column(
        children: [
          Expanded(child: AppIcons.bookMark),
          Expanded(child: Text('$priorityNum')),
        ],
      ),
    );
  }
}
