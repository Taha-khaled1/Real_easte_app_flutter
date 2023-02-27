import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_easte_app/domin_layer/models/propertyDetalisModel.dart';
import 'package:real_easte_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:real_easte_app/presentation_layer/components/custombutten.dart';
import 'package:real_easte_app/presentation_layer/handlingView/handlingview.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/msnge_api.dart';
import 'package:real_easte_app/presentation_layer/screen/detalis_screen/controller/PropertDetalisController.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/detalis_screen/widget/CardDetalis.dart';
import 'package:real_easte_app/presentation_layer/screen/detalis_screen/widget/LocationProperty.dart';
import 'package:real_easte_app/presentation_layer/screen/detalis_screen/widget/bottomShete.dart';
import 'widget/galleryWidget.dart';

class PropertyDetalisScreen extends StatelessWidget {
  const PropertyDetalisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Container(
        child: InfoWidget(
          builder: (context, deviceInfo) {
            return GetBuilder<PropertDetalisController>(
              init: PropertDetalisController(),
              builder: (controller) {
                PropertyD? x = controller.propertyDetalisModel?.property!;
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          height: 340,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                '${APiMange.baseurlImage}/${x?.picture}',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: BackButton(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                x?.name ?? '',
                                style: MangeStyles().getRegularStyle(
                                  color: ColorManager.kTextblack,
                                  fontSize: FontSize.s18,
                                ),
                              ),
                              Text(
                                x?.country ?? '',
                                style: MangeStyles().getRegularStyle(
                                  color: ColorManager.primaryColorbu,
                                  fontSize: FontSize.s18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(
                            thickness: 2,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CardDetalis(
                          width: deviceInfo.localWidth * 0.95,
                          propertyD: x,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'مرافق العقار',
                              style: MangeStyles().getBoldStyle(
                                color: ColorManager.kTextblack,
                                fontSize: FontSize.s18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                            itemCount: x?.facilities?.length ?? 0,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                width: 250,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: ColorManager.containacolor1,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Text(
                                  x?.facilities![index] ?? '',
                                  style: MangeStyles().getRegularStyle(
                                    color: ColorManager.kTextblack,
                                    fontSize: FontSize.s18,
                                    isover: true,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        LocationProperty(
                          lat: x?.propertyDetails?.latitude ?? 0,
                          lon: x?.propertyDetails?.longitude ?? 0,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GalleryWidget(imges: x?.images ?? []),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 340,
                          height: 65,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                width: 150,
                                haigh: 60,
                                color: Color(0xff6B85B3),
                                text: 'استعلم الآن',
                                press: () {
                                  CustombooTomSheet(context, false, x!.id!);
                                },
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              CustomButton(
                                width: 150,
                                haigh: 60,
                                color: Colors.redAccent,
                                text: 'تقديم ابلاغ',
                                press: () {
                                  CustombooTomSheet(context, true, x!.id!);
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
