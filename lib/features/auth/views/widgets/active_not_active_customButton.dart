import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/styles.dart';

class ActiveCustomButton extends StatelessWidget {
  const ActiveCustomButton(
      {super.key, required this.text, required this.onpress});
  final String text;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onpress,
        style: TextButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Text(
            text,
            style: AppStyles.styleLatoReguler16(context),
          ),
        ));
  }
}

class NotActiveCustomButton extends StatelessWidget {
  const NotActiveCustomButton({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: null,
        style: TextButton.styleFrom(
            backgroundColor: AppColors.primaryColor.withOpacity(.50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            )),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Text(
            text,
            style: AppStyles.styleLatoReguler16(context),
          ),
        ));
  }
}
