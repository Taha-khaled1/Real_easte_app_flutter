import 'package:real_easte_app/data_layer/database/connectdatabase.dart';
import 'package:real_easte_app/presentation_layer/resources/msnge_api.dart';

getAllTopPropertyRespon() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    APiMange.mostview,
  );
  return respons;
}

getCountryRespon() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    APiMange.forcountry,
  );
  return respons;
}

getNewpropertyRespon() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    APiMange.newproperty,
  );
  return respons;
}

getCatogeryRespon() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    APiMange.catogerydata,
  );
  return respons;
}
// getProductOfCatogeryRespon(int idCato, int idPage) async {
//   Curd curd = Curd();
//   var respons = await curd.getrequest(
//     '${APiMange.products}/$idCato?page=$idPage',
//   );
//   return respons;
// }

// favoritRespon(int userId, int productId) async {
//   Curd curd = Curd();
//   var respons = await curd.postrequest(
//     APiMange.wishlists,
//     {
//       'user_id': userId,
//       'product_id': productId,
//     },
//     encode: true,
//     myheadersres: myheaders2,
//   );
//   return respons;
// }
