import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

abstract class AppNavigation {
  static void navigateTO(Widget child, context) {
    Navigator.push(
      context,
      PageTransition(
          duration: const Duration(milliseconds: 500),
          child: child,
          type: PageTransitionType.rightToLeftWithFade),
    );
  }
}
