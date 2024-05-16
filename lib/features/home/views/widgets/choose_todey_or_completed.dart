import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/widgets/custom_button.dart';
import 'package:todo_app2/features/home/view_model/calender_bloc/calender_bloc.dart';

class ChooseTodeyOrCompleted extends StatefulWidget {
  const ChooseTodeyOrCompleted({super.key, required this.date});
  final String date;

  @override
  State<ChooseTodeyOrCompleted> createState() => _ChooseTodeyOrCompletedState();
}

class _ChooseTodeyOrCompletedState extends State<ChooseTodeyOrCompleted> {
  int selectedButton = 0;
  @override
  Widget build(BuildContext context) {
    if (selectedButton == 0) {
      BlocProvider.of<CalenderBloc>(context)
          .add(TasksWithDataNeeded(date: widget.date));
    } else {
      BlocProvider.of<CalenderBloc>(context)
          .add(CompletedTaskWithDateNeeded(date: widget.date));
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.darkPrimaryColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
                text: 'Todey',
                isActive: selectedButton == 0,
                onpress: () {
                  setState(() {
                    BlocProvider.of<CalenderBloc>(context)
                        .add(TasksWithDataNeeded(date: widget.date));
                    selectedButton = 0;
                  });
                }),
          ),
          const Gap(32),
          Expanded(
            child: CustomButton(
                text: 'Completed',
                isActive: selectedButton == 1,
                onpress: () {
                  setState(() {
                    BlocProvider.of<CalenderBloc>(context)
                        .add(CompletedTaskWithDateNeeded(date: widget.date));
                    selectedButton = 1;
                  });
                }),
          )
        ],
      ),
    );
  }
}
