import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:real_easte_app/presentation_layer/screen/add_property/add_property_controller/add_property_controller.dart';

getImage(ImageSource source, {required AddPropertyController contr}) async {
  ImagePicker imagePicker = ImagePicker();
  XFile? pickedFile;
  pickedFile = await imagePicker.pickImage(source: source);
  if (pickedFile != null) {
    contr.image = File(pickedFile.path);
    print(contr.image);
  }
}
