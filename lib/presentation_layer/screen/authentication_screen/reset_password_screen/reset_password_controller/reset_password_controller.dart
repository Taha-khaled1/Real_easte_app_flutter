import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:real_easte_app/application_layer/ShardFunction/handling.dart';
import 'package:real_easte_app/application_layer/ShardFunction/statusrequst.dart';
import 'package:real_easte_app/data_layer/function_resbon.dart/auth_res.dart';
import 'package:real_easte_app/main.dart';
import 'package:real_easte_app/presentation_layer/components/show_dialog.dart';
import 'package:real_easte_app/presentation_layer/screen/authentication_screen/login_screen/login_screen.dart';
import 'package:real_easte_app/presentation_layer/screen/authentication_screen/otp_screen/otp_screen.dart';

class ResetPasswordController extends GetxController {
  String? email = sharedPreferences.getString('veryemail'),
      otp = Get.arguments['otp'],
      pass,
      confairmpass;
  final GlobalKey<FormState> formkeysigin = GlobalKey();
  StatusRequest statusRequest = StatusRequest.none;
  otpVerfay({required BuildContext context}) async {
    if (formkeysigin.currentState!.validate()) {
      formkeysigin.currentState!.save();
      statusRequest = StatusRequest.loading;

      update();

      if (pass != confairmpass) {
        return showDilog(context, 'كلمة المرور غير متطابقتان',
            type: QuickAlertType.error);
      }
      if (pass == null || email == null || otp == null) {
        return showDilog(context, 'يوجد مشكله ما', type: QuickAlertType.error);
      }

      var respon = await resetPassResponse(email, otp, pass);
      statusRequest = handlingData(respon);
      try {
        if (StatusRequest.success == statusRequest) {
          showDilog(
            context,
            'تم تغير كلمة السر بنجاح يمكنك الان تسجيل الدخول ',
            onConfirmBtnTap: () {
              Get.offAll(() => LoginScreen());
            },
          );
        } else {
          showDilog(
            context,
            'يوجد مشكله تاكد من الكود الخاص بك و البريد الخاص بك',
            type: QuickAlertType.error,
          );
          statusRequest = StatusRequest.none;
        }
      } catch (e) {
        print('catch $e');
        showDilog(
          context,
          'يوجد مشكله ما',
          onConfirmBtnTap: () {},
          type: QuickAlertType.error,
        );
        statusRequest = StatusRequest.none;
      }
      update();
    }
  }
}
