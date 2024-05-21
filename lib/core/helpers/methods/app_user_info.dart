import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app2/core/helpers/constants.dart';

class AppUserInfo {
  static void userInit() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getBool(kUserFirstTime) == null) {
      preferences.setBool(kUserFirstTime, true);
    }
  }

  static Future<bool> isFirstTime() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? value = preferences.getBool(kUserFirstTime);
    return value ?? false;
  }

  static void update({required bool userFirstTime}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(kUserFirstTime, userFirstTime);
  }
}
