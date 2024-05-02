import 'package:flutter/material.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/styles.dart';

class IndexAppBar extends StatelessWidget {
  const IndexAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.filter_list),
        Text(
          'Index',
          style: AppStyles.styleLatoReguler20(context),
        ),
        const CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(
            Icons.person,
            color: AppColors.greyColor,
          ),
        )
      ],
    );
  }
}
