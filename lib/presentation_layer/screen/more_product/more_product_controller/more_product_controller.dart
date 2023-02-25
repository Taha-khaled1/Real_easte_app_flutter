import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:real_easte_app/data_layer/function_resbon.dart/filtter_res.dart';
import 'package:real_easte_app/domin_layer/models/moreProperty.dart';

class MoreProductController extends GetxController {
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
        var response = await getSearchRespon(search, page);
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