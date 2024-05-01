import 'package:flutter/material.dart';
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
        Icon(
          icon,
          size: isActive ? 28 : 24,
          color: isActive ? Colors.white : Colors.white.withOpacity(0.50),
        ),
        Text(
          title,
          style: isActive
              ? AppStyles.styleLatoReguler14(context)
                  .copyWith(color: Colors.white)
              : AppStyles.styleLatoReguler12(context).copyWith(
                  color: Colors.white.withOpacity(0.50),
                ),
        ),
      ],
    );
  }
}
