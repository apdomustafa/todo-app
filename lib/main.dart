import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app2/core/DI.dart';
import 'package:todo_app2/core/helpers/methods/app_user_info.dart';
import 'package:todo_app2/core/services/DB/dataBase.dart';
import 'package:todo_app2/core/services/background_services/background_services.dart';
import 'package:todo_app2/core/services/network/firebase.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/features/auth/view_model/login_bloc/login_bloc.dart';
import 'package:todo_app2/features/auth/view_model/register_bloc/register_bloc.dart';
import 'package:todo_app2/features/home/view_model/calender_bloc/calender_bloc.dart';
import 'package:todo_app2/features/home/view_model/index_bloc/task_management_bloc.dart';
import 'package:todo_app2/features/splashFeature/views/splash_view.dart';
import 'package:todo_app2/features/user/controller/user_bloc/user_bloc.dart';

void main() async {
  FirebaseService.init();
  setup();
  await DB.initDB();
  AppUserInfo.userInit();
  await BackgroundServices.init();
  runApp(const TodoApp());
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
