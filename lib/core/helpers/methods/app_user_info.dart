import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app2/core/helpers/constants.dart';

class AppUserInfo {
  static void userInit() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getBool(kUserFirstTime) == null) {
      preferences.setBool(kUserFirstTime, true);
      preferences.setBool(kUserSignin, false);
    }
    if (preferences.getBool(kUserInfoNotInit) == null) {
      preferences.setBool(kUserInfoNotInit, true);
    }
  }

  static Future<bool?> isUserDateInfoNotInit() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(kUserInfoNotInit);
  }

  static void saveUserName(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(kUserName, name);
  }

  static Future<String?> getUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(kUserName);
  }

  static void logOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(kUserSignin, false);
  }

  static void signIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(kUserSignin, true);
  }

  static Future<bool?> isSignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(kUserSignin);
  }

  static Future<bool?> isFirstTime() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? value = preferences.getBool(kUserFirstTime);
    return value;
  }

  static void update({required bool userFirstTime}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(kUserFirstTime, userFirstTime);
  }

  static void updateUserDataInfo(bool isInit) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(kUserInfoNotInit, isInit);
  }
}
