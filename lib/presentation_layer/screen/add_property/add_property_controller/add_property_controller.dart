import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_easte_app/application_layer/ShardFunction/handling.dart';
import 'package:real_easte_app/application_layer/ShardFunction/statusrequst.dart';
import 'package:real_easte_app/data_layer/function_resbon.dart/addProperty.dart';
import 'package:real_easte_app/main.dart';
import 'package:real_easte_app/presentation_layer/components/show_dialog.dart';

class AddPropertyController extends GetxController {
  String? propertyType,
      propertyclassfication,
      propertydirection,
      propertyrentl,
      name,
      city,
      space,
      des,
      catogeryId,
      roomnumber,
      tolitnumber,
      price;
  List<String>? future = [];
  void updateClass() {
    update();
  }

  File? image;
  final GlobalKey<FormState> formkeysigin = GlobalKey();
  changetypepro(String propertyTypevalue) {
    propertyType = propertyTypevalue;
    update();
  }

  changepropertyclassfication(String propertyclassficatio) {
    propertyclassfication = propertyclassficatio;
    update();
  }

  changeepropertydirection(String propertydirectio) {
    propertydirection = propertydirectio;
    update();
  }

  changepropertyrentl(String propertyrent) {
    propertyrentl = propertyrent;
    update();
  }

  changeroomnumbe(String roomnumbe) {
    roomnumber = roomnumbe;
    update();
  }

  changettolitnumbe(String tolitnumbe) {
    tolitnumber = tolitnumbe;
    update();
  }

  List<String> futturesList = [
    'منطقة لعب للأطفال ',
    'سطح خاص',
    'مدخل سيارة',
    'مكيفات',
    'إنترنت',
    'مدخل خاص ',
    'مدخل سيارة'
  ];
  // String userId='';
  StatusRequest statusRequest1 = StatusRequest.none;
  addProperty(BuildContext context) async {
    statusRequest1 = StatusRequest.loading;
    update();
    var respon = await addPropertyResponse(
      city: city!,
      price: price!,
      name: name!,
      space: space!,
      future: future!.join(','),
      catogeryId: propertyType ?? '1',
      userId: sharedPreferences.getString('id') ?? '1',
      roomnumber: roomnumber!,
      des: des!,
      propertyType: propertyType!,
      propertyrentl: propertyrentl!,
      propertydirection: propertydirection!,
      tolitnumber: tolitnumber!,
      image: image!,
    );
    statusRequest1 = handlingData(respon);
    try {
      if (StatusRequest.success == statusRequest1) {
        statusRequest1 = StatusRequest.none;
        showDilog(context, 'تم اضافة العقار بنجاح');
      } else {
        return StatusRequest.serverfailure;
      }
    } catch (e) {
      return StatusRequest.erorr;
    }

    update();
  }
}
