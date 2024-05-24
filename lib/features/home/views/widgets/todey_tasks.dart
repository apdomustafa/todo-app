import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/models/task_module.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/features/home/view_model/calender_bloc/calender_bloc.dart';
import 'package:todo_app2/features/home/views/widgets/drop_down_menu.dart';
import 'package:todo_app2/features/home/views/widgets/task_items.dart';

class TodeyTasks extends StatelessWidget {
  const TodeyTasks({super.key, required this.tasks});
  final List<TaskModule> tasks;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Gap(26),
        ),
        const SliverToBoxAdapter(
          child: Gap(20),
        ),
        SliverToBoxAdapter(
          child: Row(
            children: [
              const DropDownMenuPeriod(),
              Expanded(child: Container())
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: Gap(16),
        ),
        SliverToBoxAdapter(
          child: TaskItems(
            items: tasks,
            onRadioSelected: (index) {
              // BlocProvider.of<CalenderBloc>(context).add(CalenderTaskDeletedCompletedAdded(index: index ));
            },
            onItemRemoved: (int index) {},
            isSrollable: false,
          ),
        ),
        const SliverToBoxAdapter(
          child: Gap(20),
        ),
        SliverToBoxAdapter(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              width: 120,
              decoration: BoxDecoration(
                color: AppColors.secondryColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'Completed',
                style: AppStyles.styleLatoReguler12(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
