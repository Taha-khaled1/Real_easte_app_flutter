import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_easte_app/application_layer/ShardFunction/getImage.dart';
import 'package:real_easte_app/presentation_layer/screen/add_property/add_property_controller/add_property_controller.dart';
import 'package:real_easte_app/presentation_layer/screen/add_property/widgte/CustomListtile.dart';

void handleAttachmentPressed(BuildContext context,
    {required AddPropertyController contr}) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) => SafeArea(
      child: SizedBox(
        height: 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomListtile(
              widget: Icon(Icons.camera_alt_outlined),
              onTap: () async {
                Navigator.pop(context);

                ImagePicker imagePicker = ImagePicker();
                XFile? pickedFile;
                pickedFile =
                    await imagePicker.pickImage(source: ImageSource.camera);
                if (pickedFile != null) {
                  contr.image = File(pickedFile.path);
                  print(contr.image);
                }
                // getImage(ImageSource.camera, contr: contr);
              },
              titel: 'التقاط صوره',
            ),
            CustomListtile(
              widget: Icon(Icons.browse_gallery_outlined),
              onTap: () {
                Navigator.pop(context);
                getImage(ImageSource.gallery, contr: contr);
              },
              titel: 'اختار صوره',
            ),
            CustomListtile(
              widget: Icon(
                Icons.arrow_back_ios_outlined,
                textDirection: TextDirection.rtl,
              ),
              onTap: () {
                Navigator.pop(context);
              },
              titel: 'الرجوع للخلف',
            ),
          ],
        ),
      ),
    ),
  );
}
