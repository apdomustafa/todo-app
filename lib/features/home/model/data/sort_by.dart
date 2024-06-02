import 'package:todo_app2/core/models/task_module.dart';

abstract class SortBy {
  List<TaskModule> sort(List<TaskModule> unSortedTaks);
}
