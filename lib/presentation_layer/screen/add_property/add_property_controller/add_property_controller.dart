import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPropertyController extends GetxController {
  String? propertyType, propertyclassfication, propertydirection, propertyrentl;
  int? roomnumber, tolitnumber;
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

  changeroomnumbe(int roomnumbe) {
    roomnumber = roomnumbe;
    update();
  }

  changettolitnumbe(int tolitnumbe) {
    tolitnumber = tolitnumbe;
    update();
  }
}
