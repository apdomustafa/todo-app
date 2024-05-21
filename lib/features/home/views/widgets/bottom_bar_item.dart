import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app2/core/theming/styles.dart';

class BottomAppBarItem extends StatelessWidget {
  const BottomAppBarItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.isActive});
  final IconData icon;
  final String title;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 2,
          child: FittedBox(
            child: Icon(
              icon,
              size: isActive ? 28.sp : 24.sp,
              color: isActive ? Colors.white : Colors.white.withOpacity(0.50),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: FittedBox(
            child: Text(
              title,
              style: isActive
                  ? AppStyles.styleLatoReguler14(context)
                      .copyWith(color: Colors.white)
                  : AppStyles.styleLatoReguler12(context).copyWith(
                      color: Colors.white.withOpacity(0.50),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
