import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/helpers/constants.dart';
import 'package:todo_app2/core/helpers/methods/app_user_info.dart';
import 'package:todo_app2/core/helpers/navigation.dart';
import 'package:todo_app2/core/models/task_module.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/core/widgets/custom_button.dart';
import 'package:todo_app2/features/home/view_model/index_bloc/task_management_bloc.dart';
import 'package:todo_app2/features/home/views/widgets/category_picker_items.dart';

Future<void> editCategory(
    {required BuildContext context,
    required void Function(CategoryModule categoryModule) getCategory}) async {
  late CategoryModule selectedCategory;
  CategoryModule.getCategories(context);

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
                  'Choose Catgory',
                  style: AppStyles.styleLatoReguler16(context),
                ),
                const Divider(
                  height: 20,
                ),
                CategoryPickerItems(
                  getCategroy: (category) {
                    selectedCategory = category;
                  },
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
                            getCategory(selectedCategory);
                          }),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
