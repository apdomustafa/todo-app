import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/helpers/methods/app_user_info.dart';
import 'package:todo_app2/core/helpers/methods/loading_dialog.dart';
import 'package:todo_app2/core/models/task_module.dart';
import 'package:todo_app2/features/home/view_model/index_bloc/task_management_bloc.dart';
import 'package:todo_app2/features/home/views/helper_method/error_dialog.dart';
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
    CategoryModule.addInitialCategories(context);
    saveBackupToDateBase();
  }

  void initDate() async {}

  Future<void> saveBackupToDateBase() async {
    bool isFirstTime = await AppUserInfo.isFirstTime();
    if (isFirstTime) {
      BlocProvider.of<TaskManagementBloc>(context)
          .add(AllTasksFromServerToDBRead());
      AppUserInfo.update(userFirstTime: false);
    } else {
      BlocProvider.of<TaskManagementBloc>(context).add(TasksNeeded());
    }
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
              child: BlocConsumer<TaskManagementBloc, TaskManagementState>(
            listener: (context, state) {
              if (state is TaskManagementLoading) {
                showLoadingDialog(context);
              } else if (state is TaskManagementDissmisLoading) {
                Navigator.pop(context);
              }
            },
            buildWhen: (previous, current) =>
                current is TasksGettingSuccessState ||
                current is TaskManagementInitial,
            builder: (BuildContext context, state) {
              if (state is TasksGettingSuccessState) {
                return AllTasks(
                  tasks: state.tasks,
                  completedTasks: state.completedTasks,
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
