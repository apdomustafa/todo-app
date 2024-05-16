import 'package:flutter/material.dart';
import 'package:todo_app2/core/theming/colors.dart';

class CategoryNameTF extends StatelessWidget {
  const CategoryNameTF({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Category name',
        enabledBorder: outLineBorder(AppColors.greyColor),
        focusedBorder: outLineBorder(AppColors.labelColor),
      ),
    );
  }

  OutlineInputBorder outLineBorder(Color color) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: color));
  }
}
