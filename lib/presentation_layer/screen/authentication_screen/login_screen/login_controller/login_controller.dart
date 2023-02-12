import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_easte_app/application_layer/ShardFunction/handling.dart';
import 'package:real_easte_app/application_layer/ShardFunction/statusrequst.dart';
import 'package:real_easte_app/main.dart';

class LoginController extends GetxController {
  // void gotoForgotPasswordRoute() {
  //   Get.toNamed(Routes.forgotPasswordRoute);
  // }

  // void gotoRegisterRoute() {
  //   Get.toNamed(Routes.registerRoute);
  // }

  bool obsecuer = true;

  obSecuer() {
    obsecuer = !obsecuer;
    update();
  }

  final GlobalKey<FormState> formkeysigin = GlobalKey();
  late String emaillog, passwordlog;
  StatusRequest statusRequest = StatusRequest.none;
  login() async {
    if (formkeysigin.currentState!.validate()) {
      formkeysigin.currentState!.save();
      statusRequest = StatusRequest.loading;
      update();
      // var respon ='x'; await loginRes(emaillog, passwordlog);
      // statusRequest = handlingData(respon);
      // try {
      //   if (StatusRequest.success == statusRequest) {
      //     if (respon['result'].toString() == 'true') {
      //       // sharedPreferences.setString('id', respon['user']['id'].toString());
      //       // sharedPreferences.setString(
      //       //     'name', respon['user']['name'].toString());
      //       // sharedPreferences.setString(
      //       //     'email', respon['user']['email'].toString());
      //       // sharedPreferences.setString(
      //       //     'phone', respon['user']['phone'].toString());
      // sharedPreferences.setString(
      //     'access_token', respon['access_token'].toString());
      //       // sharedPreferences.setString('step', '2');
      //       // Get.toNamed(Routes.homeRoute);
      //       print('Sucss $respon');
      //     } else {
      //       statusRequest = StatusRequest.none;
      //       print('erorr $respon');
      //       customSnackBar(respon['message']);
      //     }
      //   } else {
      //     customSnackBar('الحساب غير موجود');
      //   }
      // } catch (e) {
      //   print('catch $e');
      //   customSnackBar(respon['message']);
      // }
      update();
      sharedPreferences.setString(
          'access_token', 'respon[access_token].toString()');
    }
  }
}

void customSnackBar(String massg) {
  Get.snackbar(
    "الحاله",
    massg,
    icon: Icon(Icons.person, color: Colors.white),
    snackPosition: SnackPosition.TOP,
  );
}
