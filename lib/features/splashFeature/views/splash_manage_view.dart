import 'package:flutter/cupertino.dart';
import 'package:todo_app2/core/theming/assets.dart';
import 'package:todo_app2/features/splashFeature/models/splash_model.dart';
import 'package:todo_app2/features/splashFeature/views/widgets/splash_app_info.dart';

class SplashManageView extends StatelessWidget {
  const SplashManageView({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashAppInfo(
      splashModel: SplashModel(
          viewNumbr: 1,
          image: Assets.svgsManageYourTask,
          title: 'Manage your tasks',
          subTitle:
              'You can easily manage all of your daily tasks in DoMe for free',
          buttonText: 'NEXT'),
    );
  }
}
