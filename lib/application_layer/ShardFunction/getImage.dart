import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future getImage(ImageSource source) async {
  ImagePicker imagePicker = ImagePicker();
  XFile? pickedFile;
  pickedFile = await imagePicker.pickImage(source: source);
  if (pickedFile != null) {
    File imageFile = File(pickedFile.path);
  }
}
