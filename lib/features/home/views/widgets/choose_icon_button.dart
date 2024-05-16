import 'package:flutter/material.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/features/home/views/widgets/category_icons.dart';

class ChooseIconButton extends StatelessWidget {
  const ChooseIconButton({super.key, required this.selectIcon});
  final VoidCallback selectIcon;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: selectIcon,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          backgroundColor: AppColors.darkSecondryColor,
        ),
        child: Text(
          'Choose icon from library',
          style: AppStyles.styleLatoReguler12(context),
        ));
  }
}
