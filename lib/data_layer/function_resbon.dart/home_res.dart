import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:real_easte_app/data_layer/database/connectdatabase.dart';
import 'package:real_easte_app/presentation_layer/resources/msnge_api.dart';
import 'package:http/http.dart' as http;

getPropertyMosetvisetRespon() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    APiMange.mostview,
  );
  print(respons);
  return respons;
}

getPropertyNewRespon() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    APiMange.newproperty,
  );
  print(respons);
  return respons;
}

getPropertyRecommendRespon() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    APiMange.recommendhotel,
  );
  print(respons);
  return respons;
}

getCatogeryTypeRespon() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    APiMange.catogerydata,
  );
  print(respons);
  return respons;
}

getForCounteryRespon() async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    APiMange.forcountry,
  );
  print(respons);
  return respons;
}

getSearchRespon(String inpout) async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    '${APiMange.search}=$inpout',
  );
  print(respons);
  return respons;
}
