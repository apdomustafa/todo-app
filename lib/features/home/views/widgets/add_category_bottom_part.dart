import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/widgets/custom_button.dart';

class AddCategoryBottomPart extends StatelessWidget {
  const AddCategoryBottomPart({super.key, required this.addCategoryPressed});
  final VoidCallback addCategoryPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: 'Cancel',
            onpress: () {
              Navigator.pop(context);
            },
            color: Colors.transparent,
            textColor: AppColors.primaryColor,
          ),
        ),
        Expanded(
          child: CustomButton(
            text: 'Create Category',
            onpress: addCategoryPressed,
            color: AppColors.primaryColor,
            textColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
