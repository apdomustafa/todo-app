import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/models/task_module.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/styles.dart';

class TitleAndDescriptionEdit extends StatelessWidget {
  const TitleAndDescriptionEdit(
      {super.key, required this.task, required this.edit});
  final TaskModule task;
  final VoidCallback edit;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 30,
          child: RadioListTile(
              value: true, groupValue: false, onChanged: (value) {}),
        ),
        const Gap(8),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title!,
                style: AppStyles.styleLatoReguler20(context),
              ),
              Text(
                task.description!,
                style: AppStyles.styleLatoReguler16(context).copyWith(
                  color: AppColors.greyColor,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Expanded(
          flex: 1,
          child: IconButton(
            onPressed: edit,
            icon: const Icon(Icons.edit_note),
            color: AppColors.labelColor.withOpacity(0.87),
          ),
        )
      ],
    );
  }
}
