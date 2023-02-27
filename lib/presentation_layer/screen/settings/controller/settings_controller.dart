import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_easte_app/application_layer/ShardFunction/handling.dart';
import 'package:real_easte_app/application_layer/ShardFunction/statusrequst.dart';
import 'package:real_easte_app/data_layer/function_resbon.dart/auth_res.dart';
import 'package:real_easte_app/main.dart';
import 'package:real_easte_app/presentation_layer/components/navbar.dart';
import 'package:real_easte_app/presentation_layer/components/show_dialog.dart';

class SeetingesController extends GetxController {
  final GlobalKey<FormState> formkeysigin = GlobalKey();
  late String oldpass, pasws, confirempass;
  StatusRequest statusRequest = StatusRequest.none;
  StatusRequest statusRequest1 = StatusRequest.none;
  logOut(BuildContext context) async {
    statusRequest1 = StatusRequest.loading;
    update();
    var respon = await LogOutRes();
    statusRequest1 = handlingData(respon);
    try {
      if (StatusRequest.success == statusRequest1) {
        statusRequest1 = StatusRequest.none;
        await sharedPreferences.remove('token');
        showDilog(context, 'تم تسجيل الخروج بنجاح');
        Get.offAll(() => Example());
      } else {
        statusRequest1 = StatusRequest.serverfailure;
      }
    } catch (e) {
      statusRequest1 = StatusRequest.erorr;
    }

    update();
  }

  changePassordApi(BuildContext context) async {
    statusRequest = StatusRequest.loading;
    update();
    var respon = await ChangepassRes(oldpass, pasws, confirempass);
    statusRequest = handlingData(respon);
    try {
      if (StatusRequest.success == statusRequest) {
        statusRequest = StatusRequest.none;
        await sharedPreferences.remove('token');
        showDilog(context, 'تم تغير  كلمة المرور بنجاح');
      } else {
        statusRequest = StatusRequest.serverfailure;
      }
    } catch (e) {
      statusRequest = StatusRequest.erorr;
    }

    update();
  }
}
