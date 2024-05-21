import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/icons.dart';

class CustomPassTextField extends StatefulWidget {
  const CustomPassTextField(
      {super.key, required this.onchange, required this.controller});
  final void Function(String, BuildContext)? onchange;
  final TextEditingController controller;

  @override
  State<CustomPassTextField> createState() => _CustomPassTextFieldState();
}

class _CustomPassTextFieldState extends State<CustomPassTextField> {
  bool isVisable = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: !isVisable,
      onChanged: (value) {
        widget.onchange != null ? widget.onchange!(value, context) : null;
      },
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          hintText: '••••••••••••••••',
          hintStyle: const TextStyle(),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isVisable = !isVisable;
                });
              },
              icon: isVisable ? AppIcons.visable : AppIcons.notVisable),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.borderColor,
            ),
          )),
    );
  }
}
