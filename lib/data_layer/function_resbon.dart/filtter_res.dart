// // ignore_for_file: file_names

import 'package:real_easte_app/data_layer/database/connectdatabase.dart';
import 'package:real_easte_app/presentation_layer/resources/msnge_api.dart';

getFiltterRespon({
  String? name,
  String? country,
  String? numbeer_toilet,
  String? category_id,
  String? rental_term,
  String? numbeer_room,
  String? price_range,
  String? property_direction,
}) async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    '''${APiMange.filterdata}
    ?name=$name&country=$country&category_id=$category_id&
    rental_term=$rental_term&building_type=apartment
    &property_direction=$property_direction&numbeer_room=$numbeer_room
    &numbeer_toilet=$numbeer_toilet&price_range=$price_range
    ''',
  );
  return respons;
}

getSearchRespon(String inpout, int page) async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    '${APiMange.search}=$inpout&page=$page',
  );
  return respons;
}
