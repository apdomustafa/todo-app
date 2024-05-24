import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app2/features/home/view_model/index_bloc/task_management_bloc.dart';
import 'package:todo_app2/features/home/views/widgets/task_items.dart';

class CompletedTasks extends StatelessWidget {
  const CompletedTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskManagementBloc, TaskManagementState>(
        buildWhen: (previous, current) =>
            current is AllTasksGettingSuccessState,
        builder: (context, state) {
          if (state is AllTasksGettingSuccessState) {
            return TaskItems(
              isSrollable: true,
              items: state.completedTasks,
              onRadioSelected: (int index) {
                BlocProvider.of<TaskManagementBloc>(context)
                    .add(CompletedTaskDeletedTaskAdded(index: index));
              },
              onItemRemoved: (int index) {
                BlocProvider.of<TaskManagementBloc>(context)
                    .add(CompletedTaskDeleted(index: index));
              },
            );
          } else {
            return const SizedBox();
          }
        });
  }
}
