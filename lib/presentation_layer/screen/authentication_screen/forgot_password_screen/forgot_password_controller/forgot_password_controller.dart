import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:real_easte_app/application_layer/ShardFunction/handling.dart';
import 'package:real_easte_app/application_layer/ShardFunction/statusrequst.dart';
import 'package:real_easte_app/data_layer/function_resbon.dart/auth_res.dart';
import 'package:real_easte_app/main.dart';
import 'package:real_easte_app/presentation_layer/components/show_dialog.dart';
import 'package:real_easte_app/presentation_layer/screen/authentication_screen/otp_screen/otp_screen.dart';

class ForgotPasswordController extends GetxController {
  String? email;
  final GlobalKey<FormState> formkeysigin = GlobalKey();
  StatusRequest statusRequest = StatusRequest.none;
  forgetPass({required BuildContext context}) async {
    if (formkeysigin.currentState!.validate()) {
      formkeysigin.currentState!.save();
      statusRequest = StatusRequest.loading;
      update();
      var respon = await forgetPassResponse(email);
      statusRequest = handlingData(respon);
      try {
        if (StatusRequest.success == statusRequest) {
          sharedPreferences.setString('veryemail', email!);
          showDilog(
            context,
            'تم ارسال الكود بنجاح الي الاميل الخاص بك يرجي تاكيده',
            onConfirmBtnTap: () {
              Get.offAll(() => OtpScreen());
            },
          );
        } else {
          showDilog(
            context,
            'لم يتم ارسال الكود يرجي التاكد من الاميل الخاص بك',
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
