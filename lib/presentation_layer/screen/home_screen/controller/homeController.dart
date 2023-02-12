import 'package:get/get.dart';
import 'package:real_easte_app/application_layer/ShardFunction/handling.dart';
import 'package:real_easte_app/application_layer/ShardFunction/statusrequst.dart';
import 'package:real_easte_app/data_layer/function_resbon.dart/home_res.dart';
import 'package:real_easte_app/domin_layer/models/dataCard.dart';

class HomeController extends GetxController {
  String? propertyType, propertyclassfication, propertydirection, propertyrentl;
  int? roomnumber, tolitnumber;
  changeroomnumbe(int roomnumbe) {
    roomnumber = roomnumbe;
    update();
  }

  changettolitnumbe(int tolitnumbe) {
    tolitnumber = tolitnumbe;
    update();
  }

  changetypepro(String propertyTypevalue) {
    propertyType = propertyTypevalue;
    update();
  }

  changepropertyrentl(String propertyTypevalue) {
    propertyType = propertyrentl;
    update();
  }

  PropertyCardModel? propertyCardModel;
  late StatusRequest statusRequest;
  getPropertyMostViset() async {
    try {
      statusRequest = StatusRequest.loading;
      var response = await getPropertyMosetvisetRespon();
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        propertyCardModel = await PropertyCardModel.fromJson(response);
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
    getPropertyMostViset();
    super.onInit();
  }
}
