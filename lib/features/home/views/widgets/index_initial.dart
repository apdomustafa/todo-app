import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/theming/assets.dart';
import 'package:todo_app2/core/theming/styles.dart';

class IndexInitial extends StatelessWidget {
  const IndexInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(Assets.svgsHomeImage),
        const Gap(10),
        Text(
          'What do you want to do today?',
          style: AppStyles.styleLatoReguler20(context),
        ),
        const Gap(10),
        Text(
          'Tap + to add your tasks',
          style: AppStyles.styleLatoReguler20(context),
        ),
      ],
    );
  }
}
