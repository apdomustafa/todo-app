import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/models/task_module.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/core/widgets/custom_button.dart';
import 'package:todo_app2/features/home/views/widgets/add_description_text_field.dart';
import 'package:todo_app2/features/home/views/widgets/add_title_text_field.dart';
import 'package:todo_app2/features/home/views/widgets/edit_title_text_field.dart';

Future<void> editTaskTitle(BuildContext context, TaskModule task) async {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final titleKey = GlobalKey<FormState>();
  final descriptionKey = GlobalKey<FormState>();
  await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 11),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(10),
                Text(
                  'Edit task title',
                  style: AppStyles.styleLatoReguler16(context),
                ),
                const Divider(
                  height: 20,
                ),
                const Gap(20),
                EditTitleTextField(
                  text: task.title!,
                  controller: titleController,
                ),
                const Gap(10),
                EditTitleTextField(
                  text: task.description!,
                  controller: descriptionController,
                ),
                const Gap(30),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                          text: 'Cancel',
                          color: Colors.transparent,
                          textColor: AppColors.primaryColor,
                          onpress: () {
                            Navigator.pop(context);
                          }),
                    ),
                    Expanded(
                      child: CustomButton(
                          text: 'Edit',
                          onpress: () {
                            task.title = titleController.text;
                            task.description = descriptionController.text;
                            Navigator.pop(context);
                          }),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      });
}
