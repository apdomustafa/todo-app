import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/features/home/view_model/calender_bloc/calender_bloc.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({super.key, required this.onDateChage});
  final void Function(String date) onDateChage;

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondryColor,
      padding: const EdgeInsets.only(bottom: 4),
      child: EasyDateTimeLine(
        initialDate: DateTime.now(),
        headerProps: EasyHeaderProps(
            monthStyle: AppStyles.styleLatoReguler14(context),
            selectedDateStyle: AppStyles.styleLatoReguler14(
              context,
            )),
        dayProps: EasyDayProps(
          height: 50.h,
          // You must specify the width in this case.
          width: 60.w,
        ),
        itemBuilder: (BuildContext context, String dayNumber, dayName,
            monthName, fullDate, isSelected) {
          return Container(
            //the same width that provided previously.
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              color:
                  isSelected ? AppColors.primaryColor : AppColors.tertiaryColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: FittedBox(
                    child: Text(
                      dayName,
                      style: AppStyles.styleLatoBold12(context),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Flexible(
                  child: FittedBox(
                    child: Text(
                      dayNumber,
                      style: AppStyles.styleLatoBold14(context),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        onDateChange: (date) {
          String stringDate = date.toString();
          widget.onDateChage(stringDate);
        },
      ),
    );
  }
}
