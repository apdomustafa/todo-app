import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/icons.dart';
import 'package:todo_app2/features/home/model/data/date_picker.dart';
import 'package:todo_app2/features/home/views/helper_methode/priority_picker.dart';
import 'package:todo_app2/features/home/views/helper_methode/time_picker.dart';

class AddTaskBottomPart extends StatelessWidget {
  const AddTaskBottomPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () async {
              DateTime? time = await getDate(context);
              debugPrint(time.toString());
              if (time != null) {
                setTaskTime(context);
              }
            },
            icon: AppIcons.schedule),
        const Gap(20),
        IconButton(onPressed: () {}, icon: AppIcons.tag),
        const Gap(20),
        IconButton(
            onPressed: () {
              setTaskPriority(context);
            },
            icon: AppIcons.bookMark),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.send),
          color: AppColors.primaryColor,
        ),
      ],
    );
  }
}
