import 'package:todo_app2/core/models/task_module.dart';
import 'package:todo_app2/features/home/model/data/sort_by.dart';

class SortByDate implements SortBy {
  int? hour, minute;
  @override
  List<TaskModule> sort(List<TaskModule> tasks) {
    tasks.sort((a, b) {
      if (a.date == null) {
        return 1;
      } else if (b.date == null) {
        return -1;
      } else {
        if (a.date!.compareTo(b.date!) == 0) {
          return _compareTime(a.time, b.time);
        } else {
          return a.date!.compareTo(b.date!);
        }
      }
    });
    return tasks;
  }

  int _compareTime(String? time1, String? time2) {
    if (_extractHour(time1) == _extractHour(time2)) {
      return _compareMinutes(time1, time2);
    } else if (_extractHour(time1) > _extractHour(time2)) {
      return 1;
    } else {
      return -1;
    }
  }

  int _extractHour(String? time) {
    if (time == null) {
      return 25;
    }
    return int.parse(time.split(':')[0]);
  }

  int extractMinutes(String? time) {
    if (time == null) {
      return 61;
    }
    return int.parse(time.split(':')[1]);
  }

  int _compareMinutes(String? time1, String? time2) {
    if (extractMinutes(time1) == extractMinutes(time2)) {
      return 0;
    } else if (extractMinutes(time1) > extractMinutes(time2)) {
      return 1;
    } else {
      return -1;
    }
  }
}
