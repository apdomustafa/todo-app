import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app2/core/theming/colors.dart';

abstract class AppIcons {
  static Color color = AppColors.labelColor.withOpacity(0.87);
  static const Icon back = Icon(Icons.arrow_back_ios_new_rounded);
  static const Icon notVisable = Icon(Icons.visibility_off);
  static const Icon visable = Icon(Icons.visibility);
  static const Icon schedule = Icon(Icons.schedule);
  static const Icon tag = Icon(Icons.sell_outlined);
  static Icon bookMark = Icon(
    Icons.bookmark_border_outlined,
    color: color,
  );
  static Icon search = const Icon(
    CupertinoIcons.search,
    color: AppColors.greyColor,
  );
}
