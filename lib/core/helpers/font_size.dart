import 'package:flutter/material.dart';

abstract class AppFontSize {
  static double getResponsiveFontSize(BuildContext context, double fontSize) {
    double responsiveSize = _getscaleFactor(context) * fontSize;
    double minSize = fontSize * 0.1;
    double maxSize = fontSize * 1.8;
    return responsiveSize.clamp(minSize, maxSize);
  }

  static double _getscaleFactor(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    if (width < 600) {
      return width / 400;
    } else if (width < 900) {
      return width / 700;
    } else {
      return width / 1000;
    }
  }
}
