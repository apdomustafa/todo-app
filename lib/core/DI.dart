import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app2/core/models/task_module.dart';

final getIt = GetIt.instance;

void setup() async {
  getIt.registerSingleton<CategoryModule>(CategoryModule());
  getIt.registerSingleton<TaskModule>(TaskModule());
  getIt.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
}
