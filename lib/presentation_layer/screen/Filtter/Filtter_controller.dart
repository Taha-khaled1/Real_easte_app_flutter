import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_easte_app/presentation_layer/screen/more_product/more_product.dart';

class FiltterController extends GetxController {
  String? name;
  String? country;
  String? numbeer_toilet;
  String? category_id;
  String? rental_term;
  String? numbeer_room;
  String? price_range;
  final GlobalKey<FormState> formkeysigin = GlobalKey();
  changeroomnumbe(String roomnumbe) {
    numbeer_room = roomnumbe;
    update();
  }

  changettolitnumbe(String tolitnumbe) {
    numbeer_toilet = tolitnumbe;
    update();
  }

  changetypepro(String propertyTypevalue) {
    category_id = propertyTypevalue;
    update();
  }

  changepropertyrentl(String rental_terms) {
    rental_term = rental_terms;
    update();
  }

  goToMoreProduct() {
    print(
      '$name $country $numbeer_toilet $category_id $rental_term $price_range  $numbeer_room',
    );

    Get.to(
      MoreProductScreen(),
      arguments: {
        'name': name ?? '',
        'country': country ?? '',
        'numbeer_toilet': numbeer_toilet ?? "",
        'category_id': category_id ?? '',
        'rental_term': rental_term ?? '',
        'numbeer_room': numbeer_room ?? '',
        'price_range': price_range ?? '',
        'page': '1',
      },
    );
  }
}
