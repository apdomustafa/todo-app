import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app2/core/helpers/enums.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/styles.dart';

class DropDownMenuPeriod extends StatefulWidget {
  const DropDownMenuPeriod({super.key});

  @override
  State<DropDownMenuPeriod> createState() => _DropDownMenuPeriodState();
}

class _DropDownMenuPeriodState extends State<DropDownMenuPeriod> {
  TaskPeriod? _taskPeriod = TaskPeriod.todey;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: SizedBox(
        width: 140.w,
        child: FittedBox(
          child: DropdownButton(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            dropdownColor: AppColors.secondryColor,
            borderRadius: BorderRadius.circular(6),
            style: AppStyles.styleLatoReguler12(context),
            value: _taskPeriod,
            items: dropdownItems,
            onChanged: (TaskPeriod? value) {
              setState(() {
                _taskPeriod = value;
              });
            },
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<TaskPeriod>> get dropdownItems {
    List<DropdownMenuItem<TaskPeriod>> menuItems = [
      DropdownMenuItem(
          value: TaskPeriod.todey,
          child: Text(
            "todey",
            style: AppStyles.styleLatoReguler12(context),
          )),
      DropdownMenuItem(
          value: TaskPeriod.lastWeek,
          child: Text(
            "last week",
            style: AppStyles.styleLatoReguler12(context),
          )),
      DropdownMenuItem(
          value: TaskPeriod.lastMonth,
          child: Text(
            "last month",
            style: AppStyles.styleLatoReguler12(context),
          )),
    ];
    return menuItems;
  }
}
