import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/features/home/views/widgets/add_task_bottom_part.dart';
import 'package:todo_app2/features/home/views/widgets/add_task_text_field.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        decoration: const BoxDecoration(
          color: AppColors.secondryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Task',
                textAlign: TextAlign.start,
                style: AppStyles.styleLatoBold20(context).copyWith(
                  color: Colors.white.withOpacity(0.87),
                ),
              ),
              const Gap(14),
              const AddTaskTextField(hint: 'Title'),
              const Gap(13),
              const AddTaskTextField(hint: 'Description'),
              const Gap(35),
              const AddTaskBottomPart(),
            ],
          ),
        ),
      ),
    );
  }
}
