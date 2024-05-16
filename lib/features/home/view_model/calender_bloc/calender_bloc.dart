import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app2/core/models/task_module.dart';
import 'package:todo_app2/features/home/model/repo/local_DB_repo_impl.dart';
import 'package:todo_app2/features/home/model/repo/task_CRUD.dart';

part 'calender_bloc_event.dart';
part 'calender_bloc_state.dart';

class CalenderBloc extends Bloc<CalenderEvent, CalenderState> {
  CalenderBloc() : super(CalenderInitialState()) {
    TaskCRUD taskCRUD;

    on<TasksWithDataNeeded>((event, emit) {
      taskCRUD = Hive_DB_RepoImpl();
      List<TaskModule> tasks = taskCRUD.readtasksWithDate(event.date);
      if (tasks.isEmpty) {
        emit(CalenderInitialState());
      } else {
        emit(CalenderTasksGettingSuccessState(tasks));
      }
    });

    on<CompletedTaskWithDateNeeded>((event, emit) {
      taskCRUD = Hive_DB_RepoImpl();
      List<TaskModule> tasks = taskCRUD.readCompletedTasksWithDate(event.date);
      if (tasks.isEmpty) {
        emit(CalenderInitialState());
      } else {
        emit(CalenderCompletedTasksGettingSuccessState(tasks));
      }
    });

    on<CalenderTaskDeleted>((event, emit) {
      taskCRUD = Hive_DB_RepoImpl();
      taskCRUD.deleteTask(event.index);
      var tasks = taskCRUD.readtasks();
      if (tasks.isEmpty) {
        emit(CalenderInitialState());
      } else {
        emit(CalenderTasksGettingSuccessState(tasks));
      }
    });

    on<CalenderCompletedDeletedTaskAdded>((event, emit) {
      taskCRUD = Hive_DB_RepoImpl();
      taskCRUD.addTask(taskCRUD.readCompletedTask(event.index)!);
      taskCRUD.deleteCompletedTask(event.index);
      emit(CalenderCompletedTasksGettingSuccessState(
          taskCRUD.readCompletedTasksWithDate(event.date)));
    });

    on<CalenderCompletedTaskDeleted>((event, emit) {
      taskCRUD = Hive_DB_RepoImpl();
      taskCRUD.deleteCompletedTask(event.index);
      var tasks = taskCRUD.readCompletedTasks();
      if (tasks.isEmpty) {
        emit(CalenderInitialState());
      } else {
        emit(CalenderTasksGettingSuccessState(tasks));
      }
    });

    on<CalenderTaskDeletedCompletedAdded>((event, emit) {
      taskCRUD = Hive_DB_RepoImpl();
      taskCRUD.addCompletedTask(taskCRUD.readTask(event.index)!);
      taskCRUD.deleteTask(event.index);
      var tasks = taskCRUD.readtasksWithDate(event.date);
      emit(CalenderTasksGettingSuccessState(tasks));
    });
  }
}
