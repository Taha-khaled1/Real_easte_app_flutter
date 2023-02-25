import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';

void aleartToken(BuildContext context) {
  QuickAlert.show(
    showCancelBtn: true,
    onCancelBtnTap: () {
      Get.back();
    },
    onConfirmBtnTap: () {
      // Get.to(Login());
    },
    cancelBtnText: 'الرجوع للخلف',
    confirmBtnText: 'تسجيل الدخول',
    context: context,
    type: QuickAlertType.info,
    text: 'يجب تسجيل الدخول اولا',
  );
}
