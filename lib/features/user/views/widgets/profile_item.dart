import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app2/core/theming/styles.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem(
      {super.key,
      required this.onTap,
      required this.title,
      required this.iconDate});
  final VoidCallback onTap;
  final String title;
  final IconData iconDate;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Align(
        alignment: Alignment.centerLeft,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            title,
            style:
                AppStyles.styleLatoReguler16(context).copyWith(fontSize: 16.sp),
          ),
        ),
      ),
      leading: Icon(
        iconDate,
        size: 32,
      ),
      trailing: const Icon(
        Icons.keyboard_arrow_right_outlined,
        size: 32,
      ),
    );
  }
}
