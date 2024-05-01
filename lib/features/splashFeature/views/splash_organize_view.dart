import 'package:flutter/cupertino.dart';
import 'package:todo_app2/core/theming/assets.dart';
import 'package:todo_app2/features/splashFeature/models/splash_model.dart';
import 'package:todo_app2/features/splashFeature/views/widgets/splash_app_info.dart';

class SplashOrganizeView extends StatelessWidget {
  const SplashOrganizeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashAppInfo(
      splashModel: SplashModel(
          viewNumbr: 3,
          image: Assets.svgOrganizeYourTask,
          title: 'Orgonaize your tasks',
          subTitle:
              'You can organize your daily tasks by adding your tasks into separate categories',
          buttonText: 'Get Started'),
    );
  }
}
