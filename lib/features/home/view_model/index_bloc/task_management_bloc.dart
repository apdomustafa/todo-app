import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_app2/core/models/task_module.dart';
import 'package:todo_app2/features/home/model/repo/local_DB_repo_impl.dart';
import 'package:todo_app2/features/home/model/repo/task_CRUD.dart';

part 'task_management_event.dart';
part 'task_management_state.dart';

class TaskManagementBloc
    extends Bloc<TaskManagementEvent, TaskManagementState> {
  late TaskCRUD _taskCRUD;
  TaskManagementBloc() : super(TaskManagementInitial()) {
    on<TasksNeeded>((event, emit) {
      _taskCRUD = Hive_DB_RepoImpl();
      if (_taskCRUD.readtasks().isEmpty &&
          _taskCRUD.readCompletedTasks().isEmpty) {
        emit(TaskManagementInitial());
      } else {
        emit(TasksGettingSuccessState(
            tasks: _taskCRUD.readtasks(),
            completedTasks: _taskCRUD.readCompletedTasks()));

        // emit(CompletedTasksGettingSuccessState(_taskCRUD.readCompletedTasks()));
      }
    });

    on<CategoriesNeeded>((event, emit) {
      _taskCRUD = Hive_DB_RepoImpl();
      emit(CategoriesGettingSuccessState(_taskCRUD.readCategories()));
    });

    on<CategoryAdded>((event, emit) {
      _taskCRUD = Hive_DB_RepoImpl();
      _taskCRUD.addCategory(event.category);
      emit(CategoriesGettingSuccessState(_taskCRUD.readCategories()));
    });

    on<TaskDeleted>((event, emit) {
      _taskCRUD = Hive_DB_RepoImpl();
      _taskCRUD.deleteTask(event.index);
      if (_taskCRUD.readtasks().isEmpty &&
          _taskCRUD.readCompletedTasks().isEmpty) {
        emit(TaskManagementInitial());
      } else {
        emit(TasksGettingSuccessState(
            tasks: _taskCRUD.readtasks(),
            completedTasks: _taskCRUD.readCompletedTasks()));
      }
    });

    on<TaskUpdated>((event, emit) {
      _taskCRUD = Hive_DB_RepoImpl();
      _taskCRUD.updateTask(event.index, event.task);
      emit(TasksGettingSuccessState(
          tasks: _taskCRUD.readtasks(),
          completedTasks: _taskCRUD.readCompletedTasks()));
    });

    on<TaskAdd>((event, emit) {
      _taskCRUD = Hive_DB_RepoImpl();
      _taskCRUD.addTask(event.taskModule);
      emit(TasksGettingSuccessState(
          tasks: _taskCRUD.readtasks(),
          completedTasks: _taskCRUD.readCompletedTasks()));
    });

    on<InitialCategoriesAdded>((event, emit) {
      _taskCRUD = Hive_DB_RepoImpl();
      _taskCRUD.addInitialCategories(event.initialCategories);
      emit(CategoriesGettingSuccessState(_taskCRUD.readCategories()));
    });

    on<CompletedTaskAdd>((event, emit) {
      _taskCRUD = Hive_DB_RepoImpl();
      _taskCRUD.addCompletedTask(event.taskModule);
      emit(TasksGettingSuccessState(
          tasks: _taskCRUD.readtasks(),
          completedTasks: _taskCRUD.readCompletedTasks()));

      // emit(CompletedTasksGettingSuccessState(_taskCRUD.readCompletedTasks()));
    });

    on<CompletedTaskDeleted>((event, emit) {
      _taskCRUD = Hive_DB_RepoImpl();
      _taskCRUD.deleteCompletedTask(event.index);
      if (_taskCRUD.readtasks().isEmpty &&
          _taskCRUD.readCompletedTasks().isEmpty) {
        emit(TaskManagementInitial());
      } else {
        emit(TasksGettingSuccessState(
            tasks: _taskCRUD.readtasks(),
            completedTasks: _taskCRUD.readCompletedTasks()));

        // emit(CompletedTasksGettingSuccessState(_taskCRUD.readCompletedTasks()));
      }
    });

    on<TaskDeletedCompletedAdded>((event, emit) {
      _taskCRUD = Hive_DB_RepoImpl();
      _taskCRUD.addCompletedTask(_taskCRUD.readTask(event.index)!);
      _taskCRUD.deleteTask(event.index);
      // emit(CompletedTasksGettingSuccessState(_taskCRUD.readCompletedTasks()));
      emit(TasksGettingSuccessState(
          tasks: _taskCRUD.readtasks(),
          completedTasks: _taskCRUD.readCompletedTasks()));
    });

    on<CompletedTaskDeletedTaskAdded>((event, emit) {
      _taskCRUD = Hive_DB_RepoImpl();
      _taskCRUD.addTask(_taskCRUD.readCompletedTask(event.index)!);
      _taskCRUD.deleteCompletedTask(event.index);
      // emit(CompletedTasksGettingSuccessState(_taskCRUD.readCompletedTasks()));
      emit(TasksGettingSuccessState(
          tasks: _taskCRUD.readtasks(),
          completedTasks: _taskCRUD.readCompletedTasks()));
    });
  }
}
