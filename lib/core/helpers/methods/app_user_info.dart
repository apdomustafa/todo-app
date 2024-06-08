import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app2/core/DI.dart';
import 'package:todo_app2/core/helpers/constants.dart';

class AppUserInfo {
  static final SharedPreferences _preferences = getIt<SharedPreferences>();

  static void userInit() async {
    if (_preferences.getBool(kUserFirstTime) == null) {
      _preferences.setBool(kUserFirstTime, true);
    }
    if (_preferences.getBool(kUserInfoNotInit) == null) {
      _preferences.setBool(kUserInfoNotInit, true);
    }
  }

  static Future<bool?> isUserDateInfoNotInit() async {
    return _preferences.getBool(kUserInfoNotInit);
  }

  static void saveUserName(String name) async {
    _preferences.setString(kUserName, name);
  }

  static Future<String?> getUserName() async {
    return _preferences.getString(kUserName);
  }

  static void logOut() async {
    _preferences.setBool(kUserSignin, false);
  }

  static void signIn() async {
    _preferences.setBool(kUserSignin, true);
  }

  static Future<bool?> isSignIn() async {
    return _preferences.getBool(kUserSignin);
  }

  static Future<bool?> isFirstTime() async {
    bool? value = _preferences.getBool(kUserFirstTime);
    return value;
  }

  static void update({required bool userFirstTime}) async {
    _preferences.setBool(kUserFirstTime, userFirstTime);
  }

  static void updateUserDataInfo(bool isInit) async {
    _preferences.setBool(kUserInfoNotInit, isInit);
  }
}
