import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/features/login_create_feature/view_model/login_bloc/login_bloc.dart';
import 'package:todo_app2/features/login_create_feature/view_model/register_bloc/register_bloc.dart';
import 'package:todo_app2/features/splashFeature/views/splash_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyDCPcZ_udKbrls9bu15LbVuj147FRuYpYU",
        appId: "1:440556450736:web:2a1c8dc3a32e10cc8bdc75",
        messagingSenderId: "440556450736",
        projectId: "todo-1ed2c"),
  );
  runApp(DevicePreview(enabled: true, builder: (context) => const TodoApp()));
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBloc>(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp(
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              theme: ThemeData.dark().copyWith(
                primaryColor: AppColors.primaryColor,
              ),
              home: const SplashView(),
            );
          }),
    );
  }
}
