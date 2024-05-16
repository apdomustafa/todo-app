part of 'calender_bloc.dart';

@immutable
sealed class CalenderState {}

final class CalenderInitialState extends CalenderState {}

class CalenderTasksGettingSuccessState extends CalenderState {
  final List<TaskModule> tasks;

  CalenderTasksGettingSuccessState(this.tasks);
}

class CalenderCompletedTasksGettingSuccessState extends CalenderState {
  final List<TaskModule> tasks;

  CalenderCompletedTasksGettingSuccessState(this.tasks);
}
