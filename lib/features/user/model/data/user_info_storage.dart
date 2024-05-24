import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:todo_app2/core/helpers/constants.dart';

class UserInfoStorage {
  var userBox = Hive.box(kUserInfoBox);

  void saveUserName(String userName) {
    userBox.put(kUserName, userName);
  }

  void saveUserImage(Uint8List userImageBytes) {
    userBox.put(kuserImage, userImageBytes);
  }

  String? getUserName() {
    return userBox.get(kUserName);
  }

  Uint8List? getUserImage() {
    return userBox.get(kuserImage);
  }

  Future<void> clear() async {
    userBox.clear();
  }
}
