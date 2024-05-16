import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/features/home/view_model/calender_bloc/calender_bloc.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({super.key, required this.onDateChage});
  final void Function(String date) onDateChage;

  @override
  Widget build(BuildContext context) {
    return HorizontalWeekCalendar(
      activeBackgroundColor: AppColors.primaryColor,
      inactiveBackgroundColor: AppColors.tertiaryColor,
      disabledTextColor: Colors.red,
      borderRadius: BorderRadius.circular(4),
      minDate: DateTime(2024, 5, 11),
      maxDate: DateTime(2030, 5, 14),
      onDateChange: (date) {
        String stringDate = date.toString();
        onDateChage(stringDate);
        // CalenderState currentState =
        //     BlocProvider.of<CalenderBloc>(context).state;
        // if (currentState is TasksWithDateGettingSuccessState) {
        //   BlocProvider.of<CalenderBloc>(context)
        //       .add(TasksWithDataNeeded(date: stringDate));
        // } else if (currentState is CompletedTasksWithDateGettingSuccessState) {
        //   BlocProvider.of<CalenderBloc>(context)
        //       .add(CompletedTaskWithDateNeeded(date: stringDate));
        // }
      },
    );
  }
}
