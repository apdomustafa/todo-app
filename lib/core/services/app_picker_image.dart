import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:todo_app2/core/helpers/enums.dart';

class AppImagePicker {
  static Future<File?> pickImageFromGallary(TypeImagePicker type) async {
    final ImagePicker picker = ImagePicker();
    final XFile? XImage = await picker.pickImage(
        source: type == TypeImagePicker.gallery
            ? ImageSource.gallery
            : ImageSource.camera);
    if (XImage != null) {
      File image = File(XImage.path);
      return image;
    }
    return null;
  }
}
