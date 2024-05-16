import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/DI.dart';
import 'package:todo_app2/core/helpers/methods/app_user_info.dart';
import 'package:todo_app2/core/helpers/navigation.dart';
import 'package:todo_app2/core/models/task_module.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/features/home/view_model/index_bloc/task_management_bloc.dart';
import 'package:todo_app2/features/home/views/add_categroy_view.dart';
import 'package:todo_app2/features/home/views/widgets/category_picker_items.dart';
import 'package:todo_app2/features/login_create_feature/views/widgets/active_not_active_customButton.dart';

void chooseCategory(BuildContext context) async {
  bool? userstatus = await AppUserInfo.isFirstTime();
  if (userstatus == true) {
    CategoryModule.addInitialCategories(context);
    AppUserInfo.notFirstTime();
  }

  CategoryModule.getCategories(context);

  showDialog(
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
                    category.saveTaskCategory();
                    Navigator.pop(context);
                  },
                ),
                const Gap(30),
                SizedBox(
                  width: double.infinity,
                  child: ActiveCustomButton(
                    text: 'Add Category',
                    onpress: () {
                      AppNavigation.navigateTO(
                          const AddCategoryView(), context);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      });
}
