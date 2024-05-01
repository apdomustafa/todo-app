import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app2/core/helpers/constants.dart';
import 'package:todo_app2/core/theming/assets.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/features/home/views/home_view.dart';
import 'package:todo_app2/features/splashFeature/views/login_splash_view.dart';
import 'package:todo_app2/features/splashFeature/views/splash_create_view.dart';
import 'package:todo_app2/features/splashFeature/views/splash_manage_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<Offset> _transionAnimation;
  late SharedPreferences prefs;
  late Widget transtionWidget;
  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _transionAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero).animate(
            CurvedAnimation(parent: _controller, curve: Curves.elasticInOut));

    _controller.forward().then((value) {
      goToNextScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                // Customize the position and opacity based on the animation value
                return Opacity(
                  opacity: _animation.value,
                  child: Transform.translate(
                    offset: Offset(
                        0, 100 * (1 - _animation.value)), // Move the image up
                    child: SvgPicture.asset(
                        Assets.svgLogo), // Replace with your image
                  ),
                );
              },
            ),
            const Gap(22),
            SlideTransition(
              position: _transionAnimation,
              child: Text(
                'UpTodo',
                style: AppStyles.styleLatoBold40(context)
                    .copyWith(color: AppColors.labelColor),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void goToNextScreen() async {
    prefs = await SharedPreferences.getInstance();
    bool? status = prefs.getBool(kUserSignin);
    Widget nextScreen = await getTransition(status);
    naviate(nextScreen);
  }

  void naviate(Widget child) {
    Navigator.push(
        context,
        PageTransition(
            duration: const Duration(milliseconds: 500),
            child: child,
            type: PageTransitionType.leftToRight));
  }

  Future<Widget> getTransition(bool? userSignIn) async {
    if (userSignIn == null) {
      return const SplashManageView();
    } else if (userSignIn) {
      return const HomeView();
    } else {
      return const LoginSplashView();
    }
  }
}
