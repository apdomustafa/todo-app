import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_app2/core/models/task_module.dart';
import 'package:todo_app2/core/services/network/firebase.dart';
import 'package:todo_app2/features/home/model/repo/local_DB_repo_impl.dart';
import 'package:todo_app2/features/home/model/repo/task_CRUD.dart';
part 'task_management_event.dart';
part 'task_management_state.dart';

class TaskManagementBloc
    extends Bloc<TaskManagementEvent, TaskManagementState> {
  late TaskCRUD _taskCRUD;
  FirebaseService firebaseService = FirebaseService();
  TaskManagementBloc() : super(TaskManagementInitial()) {
    on<TasksNeeded>((event, emit) {
      _taskCRUD = Hive_DB_RepoImpl();
      if (_taskCRUD.readtasks().isEmpty &&
          _taskCRUD.readCompletedTasks().isEmpty) {
        emit(TaskManagementInitial());
      } else {
        emit(AllTasksGettingSuccessState(
            tasks: _taskCRUD.readtasks(),
            completedTasks: _taskCRUD.readCompletedTasks()));
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
        emit(AllTasksGettingSuccessState(
            tasks: _taskCRUD.readtasks(),
            completedTasks: _taskCRUD.readCompletedTasks()));
      }
    });

    on<TaskUpdated>((event, emit) {
      _taskCRUD = Hive_DB_RepoImpl();
      _taskCRUD.updateTask(event.index, event.task);
      emit(AllTasksGettingSuccessState(
          tasks: _taskCRUD.readtasks(),
          completedTasks: _taskCRUD.readCompletedTasks()));
    });

    on<TaskAdd>((event, emit) async {
      _taskCRUD = Hive_DB_RepoImpl();
      _taskCRUD.addTask(event.taskModule);
      var tasks = _taskCRUD.readtasks();
      emit(AllTasksGettingSuccessState(
          tasks: tasks, completedTasks: _taskCRUD.readCompletedTasks()));
    });

    on<CompletedTaskAdd>((event, emit) {
      _taskCRUD = Hive_DB_RepoImpl();
      _taskCRUD.addCompletedTask(event.taskModule);
      emit(AllTasksGettingSuccessState(
          tasks: _taskCRUD.readtasks(),
          completedTasks: _taskCRUD.readCompletedTasks()));

      // emit(CompletedAllTasksGettingSuccessState(_taskCRUD.readCompletedTasks()));
    });

    on<CompletedTaskDeleted>((event, emit) {
      _taskCRUD = Hive_DB_RepoImpl();
      _taskCRUD.deleteCompletedTask(event.index);
      if (_taskCRUD.readtasks().isEmpty &&
          _taskCRUD.readCompletedTasks().isEmpty) {
        emit(TaskManagementInitial());
      } else {
        emit(AllTasksGettingSuccessState(
            tasks: _taskCRUD.readtasks(),
            completedTasks: _taskCRUD.readCompletedTasks()));
      }
    });

    on<TaskDeletedCompletedAdded>((event, emit) {
      _taskCRUD = Hive_DB_RepoImpl();
      _taskCRUD.addCompletedTask(_taskCRUD.readTask(event.index)!);
      _taskCRUD.deleteTask(event.index);
      emit(AllTasksGettingSuccessState(
          tasks: _taskCRUD.readtasks(),
          completedTasks: _taskCRUD.readCompletedTasks()));
    });

    on<CompletedTaskDeletedTaskAdded>((event, emit) {
      _taskCRUD = Hive_DB_RepoImpl();
      _taskCRUD.addTask(_taskCRUD.readCompletedTask(event.index)!);
      _taskCRUD.deleteCompletedTask(event.index);
      emit(AllTasksGettingSuccessState(
          tasks: _taskCRUD.readtasks(),
          completedTasks: _taskCRUD.readCompletedTasks()));
    });

    on<AllTasksFromServerToDBRead>((event, emit) async {
      emit(TaskManagementLoading());
      _taskCRUD = Hive_DB_RepoImpl();
      await _taskCRUD.clearTasks();
      await _taskCRUD.clearCompletedTasks();
      await _taskCRUD.clearCategories();
      var tasks = await firebaseService.getUncompletedTasks();
      var completedTasks = await firebaseService.getCompletedTasks();
      var categories = await firebaseService.getCategories();
      emit(TaskManagementDissmisLoading());

      if (tasks.isNotEmpty || completedTasks.isNotEmpty) {
        emit(AllTasksGettingSuccessState(
            tasks: tasks, completedTasks: completedTasks));

        _taskCRUD.addTasks(tasks);
        _taskCRUD.addCompletedTasks(completedTasks);
        _taskCRUD.addInitialCategories(categories);
      } else {
        emit(TaskManagementInitial());
      }
    });

    on<InitialCategoriesAdded>((event, emit) async {
      _taskCRUD = Hive_DB_RepoImpl();
      await _taskCRUD.clearCategories();
      _taskCRUD.addInitialCategories(event.initialCategories);
    });

    on<AllTasksWithTitleNeeded>((event, emit) async {
      _taskCRUD = Hive_DB_RepoImpl();
      var tasks = _taskCRUD.readTasksWithTitle(event.title);
      var completedTasks = _taskCRUD.readCompletedTasksWithTitle(event.title);
      emit(AllTasksGettingSuccessState(
          tasks: tasks, completedTasks: completedTasks));
    });
  }
}
