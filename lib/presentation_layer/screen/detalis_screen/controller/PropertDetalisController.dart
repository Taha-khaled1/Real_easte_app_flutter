import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_easte_app/application_layer/ShardFunction/handling.dart';
import 'package:real_easte_app/application_layer/ShardFunction/statusrequst.dart';
import 'package:real_easte_app/data_layer/function_resbon.dart/pageDetalis_res.dart';
import 'package:real_easte_app/domin_layer/models/propertyDetalisModel.dart';
import 'package:real_easte_app/presentation_layer/components/show_dialog.dart';
import 'package:real_easte_app/presentation_layer/screen/authentication_screen/login_screen/login_controller/login_controller.dart';

class PropertDetalisController extends GetxController {
  final GlobalKey<FormState> formkeysigin = GlobalKey();

  String? descr, phoner, emailr, namer, idr;

  PropertyDetalisModel? propertyDetalisModel;
  late StatusRequest statusRequest;
  getPropertyDetalis(int id) async {
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

  StatusRequest statusRequest1 = StatusRequest.none;
  addReport(int id, BuildContext context, {bool isAlh7in = false}) async {
    statusRequest1 = StatusRequest.loading;
    update();
    var respon = await addReporResponst(emailr!, phoner!, namer!, descr!, id);
    statusRequest1 = handlingData(respon);
    try {
      if (StatusRequest.success == statusRequest1) {
        statusRequest1 = StatusRequest.none;
        showDilog(context, 'تم الابلاغ عن العقار بنجاح', butn: true);
      } else {
        return StatusRequest.serverfailure;
      }
    } catch (e) {
      return StatusRequest.erorr;
    }
    descr = phoner = emailr = namer = idr = '';
    update();
  }

  StatusRequest statusRequest2 = StatusRequest.none;
  addQuery(int id, BuildContext context, {bool isAlh7in = false}) async {
    statusRequest2 = StatusRequest.loading;
    update();
    var respon = await addQueryRes(emailr!, phoner!, namer!, descr!, id);
    statusRequest2 = handlingData(respon);
    try {
      if (StatusRequest.success == statusRequest2) {
        statusRequest2 = StatusRequest.none;
        showDilog(context, 'تم الاستعلام عن العقار بنجاح', butn: true);
      } else {
        return StatusRequest.serverfailure;
      }
    } catch (e) {
      return StatusRequest.erorr;
    }
    descr = phoner = emailr = namer = idr = '';
    update();
  }

  @override
  void onInit() {
    getPropertyDetalis(Get.arguments['id']);
    super.onInit();
  }
}
