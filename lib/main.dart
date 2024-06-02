import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app2/core/DI.dart';
import 'package:todo_app2/core/helpers/methods/app_user_info.dart';
import 'package:todo_app2/core/models/task_module.dart';
import 'package:todo_app2/core/services/DB/dataBase.dart';
import 'package:todo_app2/core/services/network/firebase.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/features/home/model/repo/local_DB_repo_impl.dart';
import 'package:todo_app2/features/home/model/repo/task_CRUD.dart';
import 'package:todo_app2/features/auth/view_model/login_bloc/login_bloc.dart';
import 'package:todo_app2/features/auth/view_model/register_bloc/register_bloc.dart';
import 'package:todo_app2/features/home/view_model/calender_bloc/calender_bloc.dart';
import 'package:todo_app2/features/home/view_model/index_bloc/task_management_bloc.dart';
import 'package:todo_app2/features/splashFeature/views/splash_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app2/features/user/controller/user_bloc/user_bloc.dart';
import 'package:workmanager/workmanager.dart';

void main() async {
  FirebaseService.init();
  setup();
  await DB.initDB();
  AppUserInfo.userInit();
  // Workmanager().initialize(
  //     callbackDispatcher, // The top level function, aka callbackDispatcher
  //     isInDebugMode:
  //         true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
  //     );

  runApp(const TodoApp());
}

@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    await FirebaseService.init();
    setup();
    await DB.initDB();
    TaskCRUD taskCRUD = Hive_DB_RepoImpl();
    FirebaseService firebaseService = FirebaseService();
    List<TaskModule> tasks = taskCRUD.readtasks();
    List<TaskModule> completedTasks = taskCRUD.readCompletedTasks();
    List<CategoryModule> categories = taskCRUD.readCategories();
    await DB.dispose();
    await firebaseService.sendAllTasks(
        tasks: tasks, completedTasks: completedTasks, categories: categories);
    return Future.value(true);
  });
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TaskManagementBloc>(
          create: (context) => TaskManagementBloc(),
        ),
        BlocProvider<CalenderBloc>(
          create: (context) => CalenderBloc(),
        ),
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(),
        ),
      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp(
              theme: ThemeData.dark().copyWith(
                primaryColor: AppColors.primaryColor,
              ),
              home: const SplashView(),
            );
          }),
    );
  }
}
