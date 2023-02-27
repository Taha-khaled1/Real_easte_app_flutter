import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_easte_app/application_layer/ShardFunction/handling.dart';
import 'package:real_easte_app/application_layer/ShardFunction/statusrequst.dart';
import 'package:real_easte_app/data_layer/function_resbon.dart/auth_res.dart';
import 'package:real_easte_app/main.dart';
import 'package:real_easte_app/presentation_layer/components/navbar.dart';
import 'package:real_easte_app/presentation_layer/screen/authentication_screen/forgot_password_screen/forgot_password_screen.dart';
import 'package:real_easte_app/presentation_layer/screen/authentication_screen/signup_screen/signup_screen.dart';

class LoginController extends GetxController {
  void gotoForgotPasswordRoute() {
    Get.off(() => ForgotPasswordScreen());
  }

  void gotoRegisterRoute() {
    Get.off(() => SignupScreen());
  }

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
      var respon = await logInResponse(passwordlog, emaillog);
      statusRequest = handlingData(respon);
      print('$emaillog : $passwordlog');
      try {
        if (StatusRequest.success == statusRequest) {
          sharedPreferences.remove('token');
          sharedPreferences.setString(
            'id',
            respon['user']['id'].toString(),
          );
          sharedPreferences.setString(
            'name',
            respon['user']['name'].toString(),
          );
          sharedPreferences.setString(
            'number_ads',
            respon['user']['number_ads'].toString(),
          );
          sharedPreferences.setString(
            'email',
            respon['user']['email'].toString(),
          );
          sharedPreferences.setString(
            'phone',
            respon['user']['phone'].toString(),
          );
          sharedPreferences.setString(
            'token',
            respon['token'].toString(),
          );
          sharedPreferences.setString('step', '2');
          Get.offAll(
            () => Example(),
          );

          print('Sucss $respon');
        } else {
          customSnackBar('الحساب غير موجود');
          statusRequest = StatusRequest.none;
        }
      } catch (e) {
        print('catch $e');
        customSnackBar(respon['message']);
        statusRequest = StatusRequest.none;
      }
      update();
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
