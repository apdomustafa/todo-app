import 'package:get_it/get_it.dart';
import 'package:todo_app2/core/models/task_module.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<CategoryModule>(CategoryModule());
  getIt.registerSingleton<TaskModule>(TaskModule());
}
