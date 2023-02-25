import 'package:get/get.dart';
import 'package:real_easte_app/application_layer/ShardFunction/handling.dart';
import 'package:real_easte_app/application_layer/ShardFunction/statusrequst.dart';
import 'package:real_easte_app/data_layer/function_resbon.dart/home_res.dart';
import 'package:real_easte_app/domin_layer/models/catogeryModels.dart';
import 'package:real_easte_app/domin_layer/models/countrymodel.dart';
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
        print('----------------------------------');
        propertyCardModel = await PropertyCardModel.fromJson(response);
      } else {
        statusRequest = StatusRequest.failure;
      }
    } catch (e) {
      return StatusRequest.erorr;
    }
    update();
  }

  PropertyCardModel? propertyCardModel2;
  late StatusRequest statusRequest2;
  getPropertyNewProperty() async {
    try {
      statusRequest2 = StatusRequest.loading;
      var response = await getPropertyNewRespon();
      statusRequest2 = handlingData(response);
      if (statusRequest2 == StatusRequest.success) {
        print('----------------------------------');
        propertyCardModel2 = await PropertyCardModel.fromJson(response);
      } else {
        statusRequest2 = StatusRequest.failure;
      }
    } catch (e) {
      return StatusRequest.erorr;
    }
    update();
  }

  PropertyCardModel? propertyCardModel3;
  late StatusRequest statusRequest3;
  getPropertyRecommend() async {
    try {
      statusRequest3 = StatusRequest.loading;
      var response = await getPropertyRecommendRespon();
      statusRequest3 = handlingData(response);
      if (statusRequest3 == StatusRequest.success) {
        print('----------------------------------');
        propertyCardModel3 = await PropertyCardModel.fromJson(response);
      } else {
        statusRequest3 = StatusRequest.failure;
      }
    } catch (e) {
      return StatusRequest.erorr;
    }
    update();
  }

  CatogeryModel? catogeryModel;
  late StatusRequest statusRequest4;
  getPropertyCatogery() async {
    try {
      statusRequest4 = StatusRequest.loading;
      var response = await getCatogeryTypeRespon();
      statusRequest4 = handlingData(response);
      if (statusRequest4 == StatusRequest.success) {
        print('----------------------------------');
        catogeryModel = await CatogeryModel.fromJson(response);
      } else {
        statusRequest4 = StatusRequest.failure;
      }
    } catch (e) {
      return StatusRequest.erorr;
    }
    update();
  }

  CountryModel? countryModel;
  late StatusRequest statusRequest5;
  getPropertyCountry() async {
    try {
      statusRequest5 = StatusRequest.loading;
      var response = await getForCounteryRespon();
      statusRequest5 = handlingData(response);
      if (statusRequest5 == StatusRequest.success) {
        print('----------------------------------');
        countryModel = await CountryModel.fromJson(response);
      } else {
        statusRequest5 = StatusRequest.failure;
      }
    } catch (e) {
      return StatusRequest.erorr;
    }
    update();
  }

  @override
  void onInit() {
    getPropertyMostViset();
    getPropertyNewProperty();
    getPropertyRecommend();
    getPropertyCatogery();
    getPropertyCountry();
    super.onInit();
  }
}
