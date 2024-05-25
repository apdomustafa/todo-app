import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class AppImagePicker {
  static Future<File?> pickImageFromGallary() async {
    final ImagePicker picker = ImagePicker();
    final XFile? XImage = await picker.pickImage(source: ImageSource.gallery);
    if (XImage != null) {
      File image = File(XImage.path);
      return image;
    }
    return null;
  }
}
