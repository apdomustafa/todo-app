import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/DI.dart';
import 'package:todo_app2/core/models/task_module.dart';
import 'package:todo_app2/core/services/DB/dataBase.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/icons.dart';
import 'package:todo_app2/features/home/views/helper_method/choose_catgory.dart';
import 'package:todo_app2/features/home/views/helper_method/date_picker.dart';
import 'package:todo_app2/features/home/views/helper_method/priority_picker.dart';
import 'package:todo_app2/features/home/views/helper_method/time_picker.dart';

class AddTaskBottomPart extends StatelessWidget {
  const AddTaskBottomPart({
    super.key,
    required this.savetask,
  });

  final VoidCallback savetask;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () async {
              DateTime? date = await getDate(
                  context: context,
                  date: (date) {
                    getIt<TaskModule>().date = date;
                  });
              if (date != null) {
                await getTaskTime(
                  context: context,
                  time: (time) {
                    getIt<TaskModule>().time = time;
                  },
                );
              }
            },
            icon: AppIcons.schedule),
        const Gap(20),
        IconButton(
            onPressed: () {
              chooseCategory(context);
            },
            icon: AppIcons.tag),
        const Gap(20),
        IconButton(
            onPressed: () {
              getTaskPriority(
                  context: context,
                  getPriority: (priority) {
                    getIt<TaskModule>().priority = priority;
                    Navigator.pop(context);
                  });
            },
            icon: AppIcons.bookMark),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.send),
          color: AppColors.primaryColor,
          onPressed: savetask,
        ),
      ],
    );
  }
}
