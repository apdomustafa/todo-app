import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/theming/assets.dart';
import 'package:todo_app2/core/theming/styles.dart';

class IndexInitial extends StatelessWidget {
  const IndexInitial({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SvgPicture.asset(
            Assets.svgsHomeImage,
            width: MediaQuery.sizeOf(context).height * 0.3,
            height: MediaQuery.sizeOf(context).height * 0.3,
          ),
          const Gap(10),
          Text(
            textAlign: TextAlign.center,
            'What do you want to do today?',
            style: AppStyles.styleLatoReguler20(context),
          ),
          const Gap(10),
          Text(
            textAlign: TextAlign.center,
            'Tap + to add your tasks',
            style: AppStyles.styleLatoReguler20(context),
          ),
        ],
      ),
    );
  }
}
