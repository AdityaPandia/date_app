import 'dart:io';

import 'package:image_picker/image_picker.dart';

class Utils {
  static Utils instance = Utils();
  final ImagePicker _picker = ImagePicker();

  Future<File?> getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return File(image.path);
    }
    return null;
  }
}
