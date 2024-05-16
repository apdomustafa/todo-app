import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:todo_app2/features/home/view_model/index_bloc/task_management_bloc.dart';
import 'package:todo_app2/features/home/views/widgets/drop_down_menu.dart';
import 'package:todo_app2/features/home/views/widgets/index_app_bar.dart';
import 'package:todo_app2/features/home/views/widgets/index_initial.dart';
import 'package:todo_app2/features/home/views/widgets/task_item.dart';
import 'package:todo_app2/features/home/views/widgets/all_tasks.dart';

class IndexView extends StatefulWidget {
  const IndexView({super.key});

  @override
  State<IndexView> createState() => _IndexViewState();
}

class _IndexViewState extends State<IndexView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TaskManagementBloc>(context).add(TasksNeeded());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Column(
        children: [
          const IndexAppBar(),
          const Gap(16),
          Expanded(
              child: BlocBuilder<TaskManagementBloc, TaskManagementState>(
            buildWhen: (previous, current) =>
                current is TasksGettingSuccessState ||
                current is TaskManagementInitial,
            builder: (BuildContext context, state) {
              if (state is TasksGettingSuccessState) {
                return AllTasks(
                  tasks: state.tasks,
                );
              } else {
                return const IndexInitial();
              }
            },
          )),
        ],
      ),
    );
  }
}
