import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/features/home/views/helper_method/get_color.dart';

class CategoryPickerItem extends StatelessWidget {
  const CategoryPickerItem(
      {super.key,
      required this.colorValue,
      required this.iconCodePoint,
      required this.catrgoryName,
      required this.isSelected});
  final String catrgoryName;
  final int colorValue;
  final int iconCodePoint;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    IconData icon = IconData(iconCodePoint, fontFamily: 'MaterialIcons');
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.white,
            width: isSelected ? 1 : 0,
            style: isSelected ? BorderStyle.solid : BorderStyle.none),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 64,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: getLighterColor(colorValue)),
              child: Icon(
                icon,
                color: getDarkerColor(colorValue),
              ),
            ),
          ),
          const Gap(5),
          Text(
            catrgoryName,
            style: AppStyles.styleLatoReguler14(context),
          ),
        ],
      ),
    );
  }
}
