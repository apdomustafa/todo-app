// import 'package:todo_app2/core/DI.dart';
// import 'package:todo_app2/core/models/task_module.dart';
// import 'package:todo_app2/core/services/DB/dataBase.dart';
// import 'package:todo_app2/core/services/network/firebase.dart';
// import 'package:todo_app2/features/home/model/repo/local_DB_repo_impl.dart';
// import 'package:todo_app2/features/home/model/repo/task_CRUD.dart';
// import 'package:workmanager/workmanager.dart';

// class BackgroundServices {
//   static void init() {
//     Workmanager().initialize(
//         callbackDispatcher, // The top level function, aka callbackDispatcher
//         isInDebugMode:
//             true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
//         );

//     Workmanager().registerPeriodicTask(
//       "1",
//       "syncTask",
//       initialDelay: const Duration(minutes: 2),
//       frequency: const Duration(minutes: 15), // Minimum interval is 15 minutes
//     );
//   }

//   @pragma(
//       'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
//   static void callbackDispatcher() {
//     Workmanager().executeTask((task, inputData) async {
//       await FirebaseService.init();
//       setup();
//       await DB.initDB();
//       TaskCRUD taskCRUD = Hive_DB_RepoImpl();
//       FirebaseService firebaseService = FirebaseService();
//       List<TaskModule> tasks = taskCRUD.readtasks();
//       List<TaskModule> completedTasks = taskCRUD.readCompletedTasks();
//       await DB.dispose();
//       await firebaseService.sendAllTasks(tasks, completedTasks);
//       return Future.value(true);
//     });
//   }
// }
