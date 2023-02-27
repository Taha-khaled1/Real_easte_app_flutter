import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_easte_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:real_easte_app/presentation_layer/components/appbar1.dart';
import 'package:real_easte_app/presentation_layer/components/custombutten.dart';
import 'package:real_easte_app/presentation_layer/components/customtextfild.dart';
import 'package:real_easte_app/presentation_layer/screen/more_product/more_product.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/strings_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/values_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/add_property/add_property.dart';
import 'package:real_easte_app/presentation_layer/screen/home_screen/controller/homeController.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart';

class FiltterScreen extends StatelessWidget {
  const FiltterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: appbar('تصفية البيانات'),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: deviceInfo.localWidth * AppDeviceSize.m5,
            ),
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(height: 10),
                Text(
                  'حدد السعر لكل متر/AED',
                  style: MangeStyles().getBoldStyle(
                    color: ColorManager.kTextblack,
                    fontSize: FontSize.s20,
                  ),
                ),
                RangeS(),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  'اسم العقار',
                  style: MangeStyles().getBoldStyle(
                    color: ColorManager.kTextblack,
                    fontSize: FontSize.s20,
                  ),
                ),
                CustomTextfeild(
                  valid: (p0) {
                    return null;
                  },
                  onsaved: (p0) {
                    return null;
                  },
                  titel: '',
                  width: deviceInfo.localWidth * 0.85,
                  height: 70,
                ),
                const SizedBox(height: 15),
                Text(
                  'المدينه',
                  style: MangeStyles().getBoldStyle(
                    color: ColorManager.kTextblack,
                    fontSize: FontSize.s20,
                  ),
                ),
                CustomTextfeild(
                  valid: (p0) {
                    return null;
                  },
                  onsaved: (p0) {
                    return null;
                  },
                  titel: '',
                  width: deviceInfo.localWidth * 0.85,
                  height: 70,
                ),
                const SizedBox(height: 7),
                GetBuilder<HomeController>(
                  init: HomeController(),
                  builder: (controller) {
                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 55,
                              width: 150,
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorManager.bgColor,
                              ),
                              child: DropdownButton<String>(
                                dropdownColor: ColorManager.white,
                                hint: Text(
                                  'تحديد عدد الغرف',
                                  style: MangeStyles().getBoldStyle(
                                    color: ColorManager.grey2,
                                    fontSize: FontSize.s14,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                value: controller.roomnumber,
                                items: AppStrings.number.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value.toString(),
                                      style: MangeStyles().getBoldStyle(
                                        color: ColorManager.kTextblack,
                                        fontSize: FontSize.s16,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (vlue) {
                                  controller.changeroomnumbe(vlue!);
                                },
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 55,
                              width: 150,
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorManager.bgColor,
                              ),
                              child: DropdownButton<String>(
                                dropdownColor: ColorManager.white,
                                hint: Text(
                                  'تحديد عدد الحمامات',
                                  style: MangeStyles().getBoldStyle(
                                    color: ColorManager.grey2,
                                    fontSize: FontSize.s14,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                value: controller.tolitnumber,
                                items: AppStrings.number.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value.toString(),
                                      style: MangeStyles().getBoldStyle(
                                        color: ColorManager.kTextblack,
                                        fontSize: FontSize.s16,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (vlue) {
                                  controller.changettolitnumbe(vlue!);
                                },
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 55,
                          width: deviceInfo.localWidth * 0.9,
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorManager.bgColor,
                          ),
                          child: DropdownButton<String>(
                            dropdownColor: ColorManager.white,
                            hint: Text(
                              'يرجي اختيار نوع العقار',
                              style: MangeStyles().getBoldStyle(
                                color: ColorManager.grey2,
                                fontSize: FontSize.s14,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            value: controller.propertyType,
                            items: catogerNameslsit.map((catogeryList value) {
                              return DropdownMenuItem<String>(
                                value: value.id,
                                child: Text(
                                  value.name,
                                  style: MangeStyles().getBoldStyle(
                                    color: ColorManager.kTextblack,
                                    fontSize: FontSize.s16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            }).toList(),
                            onChanged: (vlue) {
                              controller.changetypepro(vlue!);
                            },
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 55,
                          width: deviceInfo.localWidth * 0.9,
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorManager.bgColor,
                          ),
                          child: DropdownButton<String>(
                            dropdownColor: ColorManager.white,
                            hint: Text(
                              'يرجي اختيار مدة الايجار',
                              style: MangeStyles().getBoldStyle(
                                color: ColorManager.grey2,
                                fontSize: FontSize.s14,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            value: controller.propertyrentl,
                            items: AppStrings.timeList.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value.toString(),
                                  style: MangeStyles().getBoldStyle(
                                    color: ColorManager.kTextblack,
                                    fontSize: FontSize.s16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            }).toList(),
                            onChanged: (vlue) {
                              controller.changepropertyrentl(vlue!);
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 15),
                CustomButton(
                  width: deviceInfo.localWidth,
                  haigh: 60,
                  color: ColorManager.primaryColorbu,
                  text: 'البحث الان',
                  press: () {
                    Get.to(() => MoreProductScreen());
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class RangeS extends StatefulWidget {
  const RangeS({super.key});

  @override
  State<RangeS> createState() => _RangeSState();
}

class _RangeSState extends State<RangeS> {
  SfRangeValues _values = SfRangeValues(40.0, 500.0);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 116,
      width: 200,
      child: Column(
        children: [
          SfRangeSlider(
            min: 1.0,
            max: 1000.0,
            values: _values,
            interval: 20,
            enableTooltip: true,
            minorTicksPerInterval: 1,
            onChanged: (SfRangeValues values) {
              setState(() {
                _values = values;
                print(_values.start);
              });
            },
          ),
          SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PriceRange(titel: 'الحد الادني', x: _values.start),
              PriceRange(titel: 'الحد الاقصي', x: _values.end),
            ],
          )
        ],
      ),
    );
  }
}

class PriceRange extends StatelessWidget {
  const PriceRange({
    Key? key,
    required this.titel,
    required this.x,
  }) : super(key: key);
  final String titel;
  final double x;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 60,
      decoration: BoxDecoration(
        color: ColorManager.bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            titel,
            style: MangeStyles().getBoldStyle(
              color: ColorManager.kTextblack,
              fontSize: FontSize.s14,
            ),
          ),
          Text(
            '${x.truncate()}',
            style: MangeStyles().getBoldStyle(
              color: ColorManager.kTextblack,
              fontSize: FontSize.s14,
            ),
          ),
        ],
      ),
    );
  }
}
