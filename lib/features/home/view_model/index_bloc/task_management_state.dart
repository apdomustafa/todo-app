part of 'task_management_bloc.dart';

@immutable
sealed class TaskManagementState {}

final class TaskManagementInitial extends TaskManagementState {}

final class TaskManagementLoading extends TaskManagementState {}

final class TaskManagementDissmisLoading extends TaskManagementState {}

final class CategoriesGettingSuccessState extends TaskManagementState {
  final List<CategoryModule> categories;

  CategoriesGettingSuccessState(this.categories);
}

class AllTasksGettingSuccessState extends TaskManagementState {
  final List<TaskModule> tasks;
  final List<TaskModule> completedTasks;

  AllTasksGettingSuccessState(
      {required this.tasks, required this.completedTasks});
}

class TaskGettingSuccessState extends TaskManagementState {
  final TaskModule? task;
  TaskGettingSuccessState(this.task);
}

class CompletedAllTasksGettingSuccessState extends TaskManagementState {
  final List<TaskModule> tasks;

  CompletedAllTasksGettingSuccessState(this.tasks);
}

class CompletedTaskGettingSuccessState extends TaskManagementState {
  final TaskModule? task;
  CompletedTaskGettingSuccessState(this.task);
}
