import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:real_easte_app/presentation_layer/screen/authentication_screen/login_screen/login_screen.dart';

void aleartToken(BuildContext context) {
  QuickAlert.show(
    showCancelBtn: true,
    onCancelBtnTap: () {
      Get.back();
    },
    onConfirmBtnTap: () {
      Get.to(LoginScreen());
    },
    cancelBtnText: 'الرجوع للخلف',
    confirmBtnText: 'تسجيل الدخول',
    context: context,
    type: QuickAlertType.info,
    text: 'يجب تسجيل الدخول اولا',
  );
}
