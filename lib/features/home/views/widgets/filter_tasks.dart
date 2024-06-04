import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app2/features/home/model/data/sort_by.dart';
import 'package:todo_app2/features/home/model/data/sort_by_date.dart';
import 'package:todo_app2/features/home/model/data/sort_by_priority.dart';
import 'package:todo_app2/features/home/model/data/sort_by_title.dart';
import 'package:todo_app2/features/home/view_model/index_bloc/task_management_bloc.dart';

// ignore: must_be_immutable
class FilterTasks extends StatefulWidget {
  const FilterTasks({super.key});

  @override
  State<FilterTasks> createState() => _FilterTasksState();
}

class _FilterTasksState extends State<FilterTasks> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SortBy>(
        icon: const Icon(Icons.filter_list),
        onSelected: (SortBy value) {
          setState(() {
            BlocProvider.of<TaskManagementBloc>(context)
                .add(TasksSorted(value));
          });
        },
        itemBuilder: (context) {
          return <PopupMenuEntry<SortBy>>[
            PopupMenuItem<SortBy>(
              value: SortByPriority(),
              child: const Text('sort by Priority'),
            ),
            PopupMenuItem<SortBy>(
              value: SortByDate(),
              child: const Text('sort by date'),
            ),
            PopupMenuItem<SortBy>(
              value: SortByTitle(),
              child: const Text('sort by title'),
            ),
          ];
        });
  }
}
