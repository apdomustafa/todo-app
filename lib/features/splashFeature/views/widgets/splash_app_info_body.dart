import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/helpers/navigation.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/features/splashFeature/models/splash_model.dart';
import 'package:todo_app2/features/splashFeature/views/login_splash_view.dart';
import 'package:todo_app2/features/splashFeature/views/splash_create_view.dart';
import 'package:todo_app2/features/splashFeature/views/splash_organize_view.dart';
import 'package:todo_app2/features/splashFeature/views/widgets/splash_view_indicator.dart';

class SplashAppInfoBody extends StatelessWidget {
  const SplashAppInfoBody({super.key, required this.splashModel});
  final SplashModel splashModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 24, top: 25),
              child: Text(
                'Skip',
                style: AppStyles.styleLatoReguler16(context).copyWith(
                  color: AppColors.labelColor.withOpacity(0.44),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: AspectRatio(
              aspectRatio: 213 / 278,
              child: SvgPicture.asset(splashModel.image),
            ),
          ),
          const MaxGap(43),
          SplashViewIndicators(viewNumber: splashModel.viewNumbr),
          const MaxGap(20),
          Text(
            textAlign: TextAlign.center,
            splashModel.title,
            style: AppStyles.styleLatoBold32(context),
          ),
          const MaxGap(42),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38),
            child: Text(
              textAlign: TextAlign.center,
              splashModel.subTitle,
              style: AppStyles.styleLatoReguler16(context),
            ),
          ),
          const Spacer(
            flex: 4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Back',
                    style: AppStyles.styleLatoReguler16(context).copyWith(
                      color: AppColors.labelColor.withOpacity(0.44),
                    ),
                  ),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: AppColors.primaryColor),
                    onPressed: () {
                      _moveForward(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12),
                      child: Text(
                        splashModel.buttonText,
                        style: AppStyles.styleLatoReguler16(context).copyWith(
                          color: AppColors.labelColor,
                        ),
                      ),
                    ))
              ],
            ),
          ),
          const Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }

  void _moveForward(BuildContext context) {
    switch (splashModel.viewNumbr) {
      case 1:
        AppNavigation.navigateTO(const SplashCreateView(), context);
        break;
      case 2:
        AppNavigation.navigateTO(const SplashOrganizeView(), context);
        break;
      case 3:
        AppNavigation.navigateTO(const LoginSplashView(), context);
        break;
    }
  }

  // void _moveBack(BuildContext context) {
  //   switch (splashModel.viewNumbr) {
  //     case 1:
  //       Navigator.pop(context);
  //       break;
  //     case 2:
  //       Navigator.pop(context);
  //       break;
  //     case 3:
  //       Navigator.pop(context);
  //       break;
  //   }
  // }
}
