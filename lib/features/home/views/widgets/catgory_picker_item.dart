import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: getLighterColor(colorValue)),
              child: Center(
                child: Icon(
                  icon,
                  size: 24.sp,
                  color: getDarkerColor(colorValue),
                ),
              ),
            ),
          ),
          const Gap(5),
          FittedBox(
            child: Text(
              catrgoryName,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: AppStyles.styleLatoReguler14(context),
            ),
          ),
        ],
      ),
    );
  }
}
