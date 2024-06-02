import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

abstract class AppNavigation {
  static void navigateTO(Widget child, context,
      [RouteSettings? routeSettings]) {
    Navigator.push(
      context,
      PageTransition(
          settings: routeSettings,
          duration: const Duration(milliseconds: 500),
          child: child,
          type: PageTransitionType.rightToLeftWithFade),
    );
  }
}
