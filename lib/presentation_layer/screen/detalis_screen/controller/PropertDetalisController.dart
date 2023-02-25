import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_easte_app/application_layer/ShardFunction/handling.dart';
import 'package:real_easte_app/application_layer/ShardFunction/statusrequst.dart';
import 'package:real_easte_app/data_layer/function_resbon.dart/pageDetalis_res.dart';
import 'package:real_easte_app/domin_layer/models/propertyDetalisModel.dart';

class PropertDetalisController extends GetxController {
  final GlobalKey<FormState> formkeysigin = GlobalKey();
  late String phone, email, name;
  String? descag, phoneag, emailag, nameag;

  PropertyDetalisModel? propertyDetalisModel;
  late StatusRequest statusRequest;
  getPropertyMostViset(int id) async {
    try {
      statusRequest = StatusRequest.loading;
      var response = await getAllDetalisRespon(id);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        print('----------------------------------');
        propertyDetalisModel = await PropertyDetalisModel.fromJson(response);
      } else {
        statusRequest = StatusRequest.failure;
      }
    } catch (e) {
      return StatusRequest.erorr;
    }
    update();
  }

  @override
  void onInit() {
    getPropertyMostViset(Get.arguments['id']);
    super.onInit();
  }
}
