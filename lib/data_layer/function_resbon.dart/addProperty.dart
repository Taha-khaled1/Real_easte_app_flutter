import 'dart:io';

import 'package:real_easte_app/data_layer/database/connectdatabase.dart';
import 'package:real_easte_app/presentation_layer/resources/msnge_api.dart';

addPropertyResponse({
  required String propertyType,
  required String propertydirection,
  required String propertyrentl,
  required String name,
  required String city,
  required String space,
  required String des,
  required String price,
  required String catogeryId,
  required String userId,
  required String future,
  required String roomnumber,
  required String tolitnumber,
  required File image,
}) async {
  Curd curd = Curd();

  // // Read the file contents as bytes
  // List<int> imageBytes = await image.readAsBytes();

  // // Encode the bytes as a base64 string
  // String base64Image = base64Encode(imageBytes);
  var respons = await curd.postrequestforFile(
      APiMange.addproperty,
      'images',
      {
        "name": name,
        "country": city,
        "catogerie_id": propertyType,
        "user_id": userId,
        "price": price,
        "description": des,
        "Rental_term": propertyrentl,
        "space": space,
        "numbeer_room": roomnumber,
        "numbeer_toilet": tolitnumber,
        "property_direction": propertydirection,
        "address": "12345678",
        "future": future,
      },
      image
      // encode: true,
      // myheadersres: myheadersfail,
      );

  return respons;
}

// void saveFile(File file) async {
//   final jsonData = {
//     'path': file.path,
//     'name': file.name,
//   };

//   final jsonString = json.encode(jsonData);
//   final outputFile = await File('output.txt').writeAsString(jsonString);
//   return outputFile;
// }
