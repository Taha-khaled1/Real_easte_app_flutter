// // ignore_for_file: file_names

import 'package:real_easte_app/data_layer/database/connectdatabase.dart';
import 'package:real_easte_app/presentation_layer/resources/msnge_api.dart';

getAllDetalisRespon(int idproperty) async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    '${APiMange.propertydetalis}/$idproperty',
  );
  return respons;
}

addReport(
    String email, String phone, String name, String description, int id) async {
  Curd curd = Curd();
  var respons = await curd.postrequest(
    APiMange.addreport,
    {
      "username": name,
      "userphone": phone,
      "useremail": email,
      "description": description,
      "property_id": id,
    },
  );
  return respons;
}

addQuery(
    String email, String phone, String name, String description, int id) async {
  Curd curd = Curd();
  var respons = await curd.postrequest(
    APiMange.addquery,
    {
      "username": name,
      "userphone": phone,
      "useremail": email,
      "description": description,
      "property_id": id,
    },
  );
  return respons;
}

updateView(int id) async {
  Curd curd = Curd();
  var respons = await curd.postrequest(
    '${APiMange.updateviews}/$id',
    {},
  );
  return respons;
}
