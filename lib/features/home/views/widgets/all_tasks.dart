import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:todo_app2/core/models/task_module.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/features/home/view_model/index_bloc/task_management_bloc.dart';
import 'package:todo_app2/features/home/views/widgets/completed_tasks.dart';
import 'package:todo_app2/features/home/views/widgets/drop_down_menu.dart';
import 'package:todo_app2/features/home/views/widgets/index_app_bar.dart';
import 'package:todo_app2/features/home/views/widgets/index_initial.dart';
import 'package:todo_app2/features/home/views/widgets/search_view.dart';
import 'package:todo_app2/features/home/views/widgets/task_items.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key, required this.tasks});
  final List<TaskModule> tasks;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Gap(26),
        ),
        const SliverToBoxAdapter(child: SearchView()),
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
              BlocProvider.of<TaskManagementBloc>(context)
                  .add(TaskDeletedCompletedAdded(index: index));
            },
            onItemRemoved: (index) {
              BlocProvider.of<TaskManagementBloc>(context)
                  .add(TaskDeleted(index: index));
            },
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
        const SliverToBoxAdapter(
          child: Gap(16),
        ),
        const SliverToBoxAdapter(child: CompletedTasks()),
      ],
    );
  }
}
