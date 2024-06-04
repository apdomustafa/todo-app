import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app2/core/theming/icons.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/features/home/view_model/index_bloc/task_management_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: AppIcons.search,
          hintText: 'Search for your task...',
          hintStyle: AppStyles.styleLatoReguler16(context)),
      onChanged: (value) {
        BlocProvider.of<TaskManagementBloc>(context)
            .add(AllTasksWithTitleNeeded(value));
      },
    );
  }
}
