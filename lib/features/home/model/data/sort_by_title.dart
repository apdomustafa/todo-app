import 'package:todo_app2/core/models/task_module.dart';
import 'package:todo_app2/features/home/model/data/sort_by.dart';

class SortByTitle implements SortBy {
  @override
  List<TaskModule> sort(List<TaskModule> tasks) {
    tasks.sort((a, b) => a.title!.compareTo(b.title!));
    return tasks;
  }
}
