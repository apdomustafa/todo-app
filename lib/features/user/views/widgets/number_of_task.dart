import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/styles.dart';

class NumberOfTasks extends StatelessWidget {
  const NumberOfTasks({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.secondryColor,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Center(
        child: FittedBox(
          child: Text(
            textAlign: TextAlign.center,
            text,
            style: AppStyles.styleLatoReguler16(context)
                .copyWith(color: AppColors.labelColor),
          ),
        ),
      ),
    );
  }
}
