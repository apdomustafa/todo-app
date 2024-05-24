import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/helpers/methods/app_user_info.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/core/widgets/custom_button.dart';
import 'package:todo_app2/features/user/controller/user_bloc/user_bloc.dart';

import 'package:todo_app2/features/user/views/widgets/name_TF.dart';

Future<void> changeAccountName({
  required BuildContext context,
}) async {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  nameController.text = await AppUserInfo.getUserName() ?? '';

  await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Gap(10),
              FittedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Change account name',
                    style: AppStyles.styleLatoReguler16(context),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(
                  height: 20,
                ),
              ),
              NameTF(
                formKey: formKey,
                controller: nameController,
                obscureText: false,
                hint: 'change account name',
              ),
              Gap(26.h),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                        text: 'Cancel',
                        color: Colors.transparent,
                        onpress: () {
                          Navigator.pop(context);
                        }),
                  ),
                  Expanded(
                    child: CustomButton(
                        text: 'Edit',
                        onpress: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<UserBloc>(context)
                                .add(UserNameChanged(nameController.text));
                            Navigator.pop(context);
                          }
                        }),
                  ),
                ],
              )
            ],
          ),
        );
      });
}
