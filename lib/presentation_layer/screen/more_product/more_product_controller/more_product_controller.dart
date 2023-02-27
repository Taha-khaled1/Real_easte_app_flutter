import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_easte_app/data_layer/function_resbon.dart/filtter_res.dart';
import 'package:real_easte_app/domin_layer/models/moreProperty.dart';

class MoreProductController extends GetxController {
  String? name = Get.arguments['name'] ?? '';
  String? country = Get.arguments['country'] ?? '';
  String? numbeer_toilet = Get.arguments['numbeer_toilet'] ?? '';
  String? category_id = Get.arguments['category_id'] ?? '';
  String? rental_term = Get.arguments['rental_term'] ?? '';
  String? numbeer_room = Get.arguments['numbeer_room'] ?? '';
  String? price_range = Get.arguments['price_range'] ?? '';

  int page = 1;
  PropertyMoreCardModel? propertyCardModel;
  PropertyMoreCardModel? propertyCardModellsload;
  // late StatusRequest statusRequest;
  bool isFirstLoadRunning = false;
  bool hasNextPage = true;
  bool isLoadMoreRunning = false;
  String search = Get.arguments['search'] ?? '';
  void _loadMore() async {
    if (hasNextPage == true &&
        isFirstLoadRunning == false &&
        isLoadMoreRunning == false &&
        scrollController.position.extentAfter < 300) {
      isLoadMoreRunning = true; // Display a progress indicator at the bottom
      update();
      page += 1; // Increase page by 1
      try {
        var response;
        if (Get.arguments['page'] == '1') {
          print('##############################################');
          response = await getFiltterRespon(
            category_id: category_id,
            country: country,
            name: name,
            numbeer_room: numbeer_room,
            numbeer_toilet: numbeer_toilet,
            price_range: price_range,
            rental_term: rental_term,
            page: page.toString(),
          );
        } else {
          print(
            '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!',
          );
          response = await getSearchRespon(search, page);
        }

        propertyCardModellsload =
            await PropertyMoreCardModel.fromJson(response);

        if (propertyCardModellsload!.property!.isNotEmpty) {
          propertyCardModel!.property!
              .addAll(propertyCardModellsload!.property!);
          update();
        } else {
          hasNextPage = false;
          update();
        }
      } catch (err) {
        if (kDebugMode) {
          print('Something went wrong!');
        }
      }

      isLoadMoreRunning = false;
      update();
    }
    update();
  }

  void firstLoad() async {
    isFirstLoadRunning = true;
    update();
    var response = await getSearchRespon(search, page);
    print(response);
    try {
      propertyCardModel = await PropertyMoreCardModel.fromJson(response);
      isFirstLoadRunning = false;
    } catch (e) {
      print(e);
    }
    update();
    return response;
  }

  late ScrollController scrollController;
  @override
  void onInit() {
    firstLoad();
    update();
    scrollController = ScrollController()..addListener(_loadMore);
    print(
      '$name $country $numbeer_toilet $category_id $rental_term $price_range  $numbeer_room',
    );
    super.onInit();
  }
}

  // getPropertySearch() async {
  //   try {
  //     statusRequest11 = StatusRequest.loading;
  //     var response = await getSearchRespon(search);
  //     statusRequest11 = handlingData(response);
  //     if (statusRequest11 == StatusRequest.success) {
  //       print('----------------------------------');
  //       propertyCardModel11 = await PropertyCardModel.fromJson(response);
  //     } else {
  //       statusRequest11 = StatusRequest.failure;
  //     }
  //   } catch (e) {
  //     return StatusRequest.erorr;
  //   }
  //   update();
  // }