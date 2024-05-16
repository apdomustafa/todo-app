import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app2/core/helpers/constants.dart';
import 'package:todo_app2/core/models/task_module.dart';
import 'package:todo_app2/features/home/model/repo/task_CRUD.dart';

class Hive_DB_RepoImpl extends TaskCRUD {
  final Box<CategoryModule> categoryBox =
      Hive.box<CategoryModule>(kCategoryBox);
  final Box<TaskModule> taskBox = Hive.box<TaskModule>(kTaskBox);
  final Box<TaskModule> completedTaskBox =
      Hive.box<TaskModule>(kCompletedTaskBox);

  @override
  void addTask(TaskModule task) {
    taskBox.add(task);
  }

  @override
  void deleteTask(int index) {
    taskBox.deleteAt(index);
  }

  @override
  List<TaskModule> readtasks() {
    return taskBox.values.toList();
  }

  @override
  void updateTask(int key, TaskModule task) {
    taskBox.putAt(key, task);
  }

  @override
  void addCategory(CategoryModule category) {
    categoryBox.add(category);
  }

  @override
  void addInitialCategories(List<CategoryModule> initailCategories) {
    categoryBox.addAll(initailCategories);
  }

  @override
  List<CategoryModule> readCategories() {
    return categoryBox.values.toList();
  }

  @override
  void addCompletedTask(TaskModule completedTask) {
    completedTaskBox.add(completedTask);
  }

  @override
  List<TaskModule> readCompletedTasks() {
    return completedTaskBox.values.toList();
  }

  @override
  void deleteCompletedTask(int key) {
    completedTaskBox.deleteAt(key);
  }

  @override
  TaskModule? readCompletedTask(int key) {
    if (completedTaskBox.getAt(key) != null) {
      return TaskModule.copy(completedTaskBox.getAt(key)!);
    } else {
      return null;
    }
  }

  @override
  TaskModule? readTask(int key) {
    if (taskBox.getAt(key) != null) {
      return TaskModule.copy(taskBox.getAt(key)!);
    } else {
      return null;
    }
  }

  @override
  List<TaskModule> readCompletedTasksWithDate(String date) {
    List<TaskModule> tasks = completedTaskBox.values.toList();
    return tasks
        .where((task) =>
            TaskModule.formatDate(task.date) == TaskModule.formatDate(date))
        .toList();
  }

  @override
  List<TaskModule> readtasksWithDate(String date) {
    List<TaskModule> tasks = taskBox.values.toList();
    return tasks
        .where((task) =>
            TaskModule.formatDate(task.date) == TaskModule.formatDate(date))
        .toList();
  }
}
