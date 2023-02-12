import 'package:get/get.dart';

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
  // CatogeryModels? catogeryModels;
  // ProductModels? productModels;
  // ProductModels? productModelsone;
  // ProductModels? productModelstow;
  // getAllcatogery() async {
  //   try {
  //     var response = await getAllcatogeryRespon();
  //     catogeryModels = await CatogeryModels.fromJson(response);
  //     return response;
  //   } catch (e) {
  //     print(' erorr catch $e');
  //   }
  // }

}
