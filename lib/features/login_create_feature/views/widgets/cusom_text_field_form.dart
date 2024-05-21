import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/features/login_create_feature/view_model/login_bloc/login_bloc.dart';

class CustomTextFieldForm extends StatelessWidget {
  const CustomTextFieldForm({
    super.key,
    required this.text,
    required this.controller,
    required this.Gkey,
    this.onchange,
  });
  final String text;
  final TextEditingController controller;
  final GlobalKey<FormState> Gkey;
  final void Function(String, BuildContext)? onchange;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: Gkey,
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          onchange != null ? onchange!(value, context) : null;
        },
        validator: (value) {
          return _userNameValidation(value);
        },
        decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            filled: true,
            fillColor: AppColors.textFieldColor,
            hintText: text,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.borderColor),
            )),
      ),
    );
  }

  String? _userNameValidation(String? value) {
    if (value == null || value.isEmpty || value.contains('@')) {
      return 'please enter a valid user name';
    }
    return null;
  }
}
