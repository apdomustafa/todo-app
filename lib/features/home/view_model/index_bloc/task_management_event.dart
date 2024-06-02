part of 'task_management_bloc.dart';

@immutable
sealed class TaskManagementEvent {}

class TaskInitialEvent extends TaskManagementEvent {}

class CategoryAdded extends TaskManagementEvent {
  final CategoryModule category;
  CategoryAdded(this.category);
}

class InitialCategoriesAdded extends TaskManagementEvent {
  final List<CategoryModule> initialCategories;
  InitialCategoriesAdded(this.initialCategories);
}

class CategoriesNeeded extends TaskManagementEvent {}

class TasksNeeded extends TaskManagementEvent {}

class TaskAdd extends TaskManagementEvent {
  final TaskModule taskModule;
  TaskAdd(this.taskModule);
}

class TaskDeleted extends TaskManagementEvent {
  final int index;

  TaskDeleted({required this.index});
}

class TaskUpdated extends TaskManagementEvent {
  final int index;
  final TaskModule task;

  TaskUpdated(this.task, {required this.index});
}

// class TaskNeeded extends TaskManagementEvent {
//   final int index;

//   TaskNeeded({required this.index});
// }

class TaskDeletedCompletedAdded extends TaskManagementEvent {
  final int index;

  TaskDeletedCompletedAdded({required this.index});
}

class CompletedTaskDeletedTaskAdded extends TaskManagementEvent {
  final int index;

  CompletedTaskDeletedTaskAdded({required this.index});
}

class CompletedTaskAdd extends TaskManagementEvent {
  final TaskModule taskModule;
  CompletedTaskAdd(this.taskModule);
}

class CompletedTaskDeleted extends TaskManagementEvent {
  final int index;

  CompletedTaskDeleted({required this.index});
}

class CompletedTaskNeeded extends TaskManagementEvent {
  final int index;

  CompletedTaskNeeded({required this.index});
}

class SendAllTasksToServer extends TaskManagementEvent {
  SendAllTasksToServer();
}

class AllTasksFromServerToDBRead extends TaskManagementEvent {}

class InitialCategoriesFromServerToDBRead extends TaskManagementEvent {}

class InitialCategoiresFormServerToDBAdded extends TaskManagementEvent {}

class AllTasksWithTitleNeeded extends TaskManagementEvent {
  final String title;
  AllTasksWithTitleNeeded(this.title);
}

class TasksSorted extends TaskManagementEvent {
  final SortBy sortBy;
  TasksSorted(this.sortBy);
}
