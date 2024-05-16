part of 'calender_bloc.dart';

@immutable
sealed class CalenderEvent {}

class TasksWithDataNeeded extends CalenderEvent {
  final String date;
  TasksWithDataNeeded({required this.date});
}

class CompletedTaskWithDateNeeded extends CalenderEvent {
  final String date;

  CompletedTaskWithDateNeeded({required this.date});
}

class CalenderTaskDeletedCompletedAdded extends CalenderEvent {
  final int index;
  final String date;

  CalenderTaskDeletedCompletedAdded({required this.index, required this.date});
}

class CalenderTaskDeleted extends CalenderEvent {
  final int index;

  CalenderTaskDeleted({required this.index});
}

class CalenderCompletedTaskDeleted extends CalenderEvent {
  final int index;

  CalenderCompletedTaskDeleted({required this.index});
}

class CalenderCompletedDeletedTaskAdded extends CalenderEvent {
  final int index;
  final String date;

  CalenderCompletedDeletedTaskAdded({required this.index, required this.date});
}
