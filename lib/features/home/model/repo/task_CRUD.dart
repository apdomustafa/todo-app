import 'package:todo_app2/core/models/task_module.dart';

abstract class TaskCRUD {
  void addTask(TaskModule task);
  List<TaskModule> readtasks();

  List<TaskModule> readtasksWithDate(String date);

  void updateTask(int key, TaskModule task);

  void deleteTask(int index);

  TaskModule? readTask(int key);

  void addCompletedTask(TaskModule completedTask);

  TaskModule? readCompletedTask(int key);

  void deleteCompletedTask(int key);

  List<TaskModule> readCompletedTasks();

  List<TaskModule> readCompletedTasksWithDate(String date);

  void addCategory(CategoryModule category);

  List<CategoryModule> readCategories();

  void addInitialCategories(List<CategoryModule> initailCategories);

  void addTasks(List<TaskModule> tasks);

  void addCompletedTasks(List<TaskModule> completedTasks);

  Future<int> clearTasks();

  Future<int> clearCompletedTasks();

  Future<int> clearCategories();
}
