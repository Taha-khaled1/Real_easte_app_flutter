import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_easte_app/data_layer/function_resbon.dart/home_res.dart';
import 'package:real_easte_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:real_easte_app/presentation_layer/components/appbar1.dart';
import 'package:real_easte_app/presentation_layer/handlingView/handlingview.dart';
import 'package:real_easte_app/presentation_layer/screen/home_screen/widget/propertyType.dart';
import 'package:real_easte_app/presentation_layer/screen/home_screen/widget/typeCard.dart';
import 'package:real_easte_app/presentation_layer/screen/more_product/more_product.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/detalis_screen/detalis_screen.dart';
import 'package:real_easte_app/presentation_layer/screen/home_screen/controller/homeController.dart';
import 'package:real_easte_app/presentation_layer/screen/Filtter/Filtter_screen.dart';
import 'package:real_easte_app/presentation_layer/screen/home_screen/widget/MostVisitedRealEstate.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: appbar('الصفحه الرئيسيه'),
      backgroundColor: ColorManager.kPrimary2,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: InfoWidget(
          builder: (context, deviceInfo) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 17, right: 7),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          //    margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: ColorManager.grey2,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            // gradient: ColorManager.y,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                                spreadRadius: 2.0,
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                          ),
                          child: TextField(
                            onChanged: (value) {},
                            style: TextStyle(
                                color: ColorManager.kTextblack, fontSize: 20),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'البحث هنا ......',
                              prefixIcon: IconButton(
                                  onPressed: () {
                                    Get.to(() => MoreProductScreen());
                                  },
                                  icon: Icon(
                                    Icons.search,
                                    size: 35,
                                    color: Color(0xff1917b3),
                                  )),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.to(() => FiltterScreen());
                        },
                        icon: Icon(
                          Icons.filter_list_alt,
                          size: 35,
                          color: Color(0xff1917b3),
                        ),
                      ),
                    ],
                  ),
                ),
                GetBuilder<HomeController>(
                  builder: (controller) {
                    return HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: MostVisitedRealEstate(
                        title: 'العقارات الأكثر زيارة',
                        data: controller.propertyCardModel,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 17,
                ),
                GetBuilder<HomeController>(
                  builder: (controller) {
                    return HandlingDataView(
                      statusRequest: controller.statusRequest2,
                      widget: MostVisitedRealEstate(
                        title: 'العقارات اضيفة حديثا',
                        data: controller.propertyCardModel2,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 17,
                ),
                GetBuilder<HomeController>(
                  builder: (controller) {
                    return HandlingDataView(
                      statusRequest: controller.statusRequest3,
                      widget: MostVisitedRealEstate(
                        title: 'العقارات الموصي بها',
                        data: controller.propertyCardModel3,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 17,
                ),
                GetBuilder<HomeController>(
                  builder: (controller) {
                    return HandlingDataView(
                      statusRequest: controller.statusRequest4,
                      widget: TypeCard(
                        title2: 'منازل',
                        iscity: false,
                        title: 'انواع العقارات',
                        catogerys: controller.catogeryModel?.catogerys! ?? [],
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                GetBuilder<HomeController>(
                  builder: (controller) {
                    return HandlingDataView(
                      statusRequest: controller.statusRequest5,
                      widget: TypeCard(
                        catogerys: controller.countryModel?.mostCountries ?? [],
                        title2: 'ابو ظبي',
                        title: 'اكثر المدن التي تحتوي علي عقارات',
                        iscity: true,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 7,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
