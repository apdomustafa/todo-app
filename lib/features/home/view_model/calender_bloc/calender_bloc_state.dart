part of 'calender_bloc.dart';

@immutable
sealed class CalenderState {}

final class CalenderInitialState extends CalenderState {}

class TasksGettingSuccessState extends CalenderState {
  final List<TaskModule> tasks;

  TasksGettingSuccessState(this.tasks);
}

class CalenderCompletedAllTasksGettingSuccessState extends CalenderState {
  final List<TaskModule> tasks;

  CalenderCompletedAllTasksGettingSuccessState(this.tasks);
}
