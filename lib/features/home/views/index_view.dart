import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/features/home/views/widgets/index_app_bar.dart';
import 'package:todo_app2/features/home/views/widgets/index_initial.dart';

class IndexView extends StatelessWidget {
  const IndexView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Column(
        children: [
          IndexAppBar(),
          Gap(70),
          IndexInitial(),
        ],
      ),
    );
  }
}
