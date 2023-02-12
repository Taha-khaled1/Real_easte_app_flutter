// // ignore_for_file: file_names

import 'package:real_easte_app/data_layer/database/connectdatabase.dart';
import 'package:real_easte_app/presentation_layer/resources/msnge_api.dart';

getFiltterRespon(String inpout) async {
  Curd curd = Curd();
  var respons = await curd.getrequest(
    '''${APiMange.filterdata}
    ?name=&country=USA&status=available&category_id=1&
    rental_term=monthly&building_type=apartment
    &property_direction=east&numbeer_room=3
    &numbeer_toilet=2&price_range=1,10000
    
    
    ''',
  );
  print(respons);
  return respons;
}
