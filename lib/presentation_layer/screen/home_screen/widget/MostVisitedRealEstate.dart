import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_easte_app/application_layer/ShardFunction/statusrequst.dart';
import 'package:real_easte_app/domin_layer/models/dataCard.dart';
import 'package:real_easte_app/presentation_layer/handlingView/handlingview.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/detalis_screen/detalis_screen.dart';
import 'package:real_easte_app/presentation_layer/screen/home_screen/controller/homeController.dart';

class MostVisitedRealEstate extends StatelessWidget {
  const MostVisitedRealEstate(
      {super.key,
      required this.title,
      required this.statusRequest,
      required this.data});
  final StatusRequest statusRequest;
  final PropertyCardModel? data;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return HandlingDataView(
          statusRequest: statusRequest,
          widget: Container(
            alignment: Alignment.center,
            height: 210,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    title,
                    style: MangeStyles().getRegularStyle(
                      color: ColorManager.kTextblack,
                      fontSize: FontSize.s18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8, //controller.catogeryModels?.data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardProperty(
                        properties: data!.properties![index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CardProperty extends StatelessWidget {
  const CardProperty({super.key, required this.properties});
  final Properties properties;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => PropertyDetalisScreen());
      },
      child: Container(
        width: 200,
        margin: EdgeInsets.only(right: 10, left: 4),
        height: 160,
        child: Column(
          children: [
            Container(
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage('assets/images/hotel1.jpg'),
                  // image: NetworkImage(
                  //   searchesModel!.imgs == null || searchesModel!.imgs == ""
                  //       ? 'https://akm-img-a-in.tosshub.com/businesstoday/images/story/202204/ezgif-sixteen_nine_161.jpg?size=948:533'
                  //       : "${MangeAPi.baseurl}/${searchesModel!.imgs!.split(',').first}",
                  // ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'شقة محمد الاول', //searchesModel!.title ?? '',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.kTextblack,
                      fontSize: FontSize.s14,
                    ),
                  ),
                  Text(
                    'دبي',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.ktextw,
                      fontSize: FontSize.s14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
