import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_easte_app/application_layer/ShardFunction/handling.dart';
import 'package:real_easte_app/application_layer/ShardFunction/statusrequst.dart';
import 'package:real_easte_app/data_layer/function_resbon.dart/auth_res.dart';
import 'package:real_easte_app/domin_layer/models/user_model.dart';
import 'package:real_easte_app/presentation_layer/components/show_dialog.dart';
import 'package:real_easte_app/presentation_layer/screen/settings/settings_screen.dart';

class EditProfileControler extends GetxController {
  String? name, adress, country, phonn;
  final GlobalKey<FormState> formkeysigin = GlobalKey();
  UserModel? userModel;
  late StatusRequest statusRequest;
  getUSerData() async {
    try {
      statusRequest = StatusRequest.loading;
      var response = await userDataResp();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        print('----------------------------------');
        userModel = await UserModel.fromJson(response);
      } else {
        statusRequest = StatusRequest.failure;
      }
    } catch (e) {
      return StatusRequest.erorr;
    }
    update();
  }

  StatusRequest statusRequest1 = StatusRequest.none;
  ChangeUserData(BuildContext context) async {
    statusRequest1 = StatusRequest.loading;
    update();
    var respon = await ChangeUserDataRes(name!, country!, phonn!);
    statusRequest1 = handlingData(respon);
    try {
      if (StatusRequest.success == statusRequest1) {
        statusRequest1 = StatusRequest.none;
        Get.back();
        showDilog(context, 'تم تغير البيانت الشخصيه بنجاح');
        // Get.delete<EditProfileControler>();
      } else {
        return StatusRequest.serverfailure;
      }
    } catch (e) {
      return StatusRequest.erorr;
    }
    update();
  }

  @override
  void onInit() {
    getUSerData();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
