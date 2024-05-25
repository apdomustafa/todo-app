import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/core/widgets/custom_button.dart';
import 'package:todo_app2/features/user/controller/user_bloc/user_bloc.dart';
import 'package:todo_app2/features/user/views/widgets/name_TF.dart';

Future<void> changeAccountPass({
  required BuildContext context,
}) async {
  var currentPassFormKey = GlobalKey<FormState>();
  var newPassFormKey = GlobalKey<FormState>();
  var currentPassController = TextEditingController();
  var newPassController = TextEditingController();
  await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              FittedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Change account Password',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Enter old password',
                  style: AppStyles.styleLatoReguler14(context),
                ),
              ),
              NameTF(
                formKey: currentPassFormKey,
                controller: currentPassController,
                obscureText: true,
                hint: '••••••••••',
              ),
              Gap(10.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Enter new password',
                  style: AppStyles.styleLatoReguler14(context),
                ),
              ),
              NameTF(
                formKey: newPassFormKey,
                controller: newPassController,
                obscureText: true,
                hint: '••••••••••',
              ),
              Gap(36.h),
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
                          if (currentPassFormKey.currentState!.validate() &&
                              newPassFormKey.currentState!.validate()) {
                            BlocProvider.of<UserBloc>(context).add(
                                PasswordChanged(
                                    currentPass:
                                        currentPassController.text.trim(),
                                    newPass: newPassController.text.trim()));
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
