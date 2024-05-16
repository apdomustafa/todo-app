import 'package:flutter/material.dart';
import 'package:todo_app2/core/theming/colors.dart';

late int alpha;
late int red;
late int green;
late int blue;
Color getDarkerColor(int colorValue) {
  // Extract ARGB components from the integer value
  alpha = (colorValue >> 24) & 0xFF;
  red = (colorValue >> 16) & 0xFF;
  green = (colorValue >> 8) & 0xFF;
  blue = colorValue & 0xFF;

  return Color.fromRGBO(
    (red * 0.5).round(),
    (green * 0.5).round(),
    (blue * 0.5).round(),
    1.0,
  );
}

Color getLighterColor(int colorValue) {
  // Extract ARGB components from the integer value
  alpha = (colorValue >> 24) & 0xFF;
  red = (colorValue >> 16) & 0xFF;
  green = (colorValue >> 8) & 0xFF;
  blue = colorValue & 0xFF;

  // Create a color with the extracted components
  // Color baseColor = Color.fromARGB(alpha, red, green, blue);

  // Create lighter and darker shades of the color

  return Color.fromRGBO(
    red + ((255 - red) * 0.5).round(),
    green + ((255 - green) * 0.5).round(),
    blue + ((255 - blue) * 0.5).round(),
    1.0,
  );
}
