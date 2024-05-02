import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/helpers/navigation.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/features/home/views/widgets/priority_picker_bottom_part.dart';
import 'package:todo_app2/features/home/views/widgets/priority_picker_item.dart';
import 'package:todo_app2/features/home/views/widgets/priority_picker_items.dart';

void setTaskPriority(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Gap(10),
              Text(
                'Task Priority',
                style: AppStyles.styleLatoReguler16(context),
              ),
              const Divider(
                height: 20,
              ),
              const PriorityPickerItems(),
              const PriorityPickerBottomPart(),
            ],
          ),
        );
      });
}
