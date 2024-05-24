import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app2/core/helpers/constants.dart';
import 'package:todo_app2/core/models/task_module.dart';
import 'package:todo_app2/features/user/model/user_info.dart';

class DB {
  static Future<void> initDB() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TaskModuleAdapter());
    Hive.registerAdapter(CategoryModuleAdapter());
    await Hive.openBox<TaskModule>(kTaskBox);
    await Hive.openBox<TaskModule>(kCompletedTaskBox);
    await Hive.openBox<CategoryModule>(kCategoryBox);
    await Hive.openBox(kUserInfoBox);
  }

  static Future<void> dispose() async {
    await Hive.close();
  }
}
