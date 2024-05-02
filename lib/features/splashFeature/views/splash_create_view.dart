import 'package:flutter/cupertino.dart';
import 'package:todo_app2/core/theming/assets.dart';
import 'package:todo_app2/features/splashFeature/models/splash_model.dart';
import 'package:todo_app2/features/splashFeature/views/widgets/splash_app_info.dart';

class SplashCreateView extends StatelessWidget {
  const SplashCreateView({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashAppInfo(
      splashModel: SplashModel(
          viewNumbr: 2,
          image: Assets.svgsCreateDailyRoutie,
          title: 'Create daily routine',
          subTitle:
              'In Uptodo  you can create your personalized routine to stay productive',
          buttonText: 'Next'),
    );
  }
}
