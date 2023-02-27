// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/quickalert.dart';
import 'package:real_easte_app/application_layer/ShardFunction/valid.dart';
import 'package:real_easte_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:real_easte_app/presentation_layer/components/appbar1.dart';
import 'package:real_easte_app/presentation_layer/components/custombutten.dart';
import 'package:real_easte_app/presentation_layer/components/customtextfild.dart';
import 'package:real_easte_app/presentation_layer/components/show_dialog.dart';
import 'package:real_easte_app/presentation_layer/handlingView/handlingview.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/strings_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/add_property/add_property_controller/add_property_controller.dart';
import 'package:real_easte_app/presentation_layer/screen/add_property/widgte/CustomListtile.dart';
import 'package:real_easte_app/presentation_layer/screen/add_property/widgte/CustomTextWithfield.dart';
import 'package:real_easte_app/presentation_layer/screen/add_property/widgte/handelAttch.dart';
import 'package:real_easte_app/presentation_layer/screen/home_screen/controller/homeController.dart';

class AddProperty extends StatelessWidget {
  const AddProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('اضافة عقار'),
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
            double sized = deviceInfo.localWidth * 0.86;
            return GetBuilder<AddPropertyController>(
              init: AddPropertyController(),
              builder: (controller) {
                return Form(
                  key: controller.formkeysigin,
                  child: ListView(
                    //   alignment: WrapAlignment.center,
                    children: [
                      CustomTextWithfield(
                        onChanged: (p0) {
                          controller.name = p0.toString();
                        },
                        text1: 'اسم العقار',
                        width: sized,
                        high: 60,
                        text2: 'اسم العقار هنا',
                        onsaved: (p0) {
                          //return controller.name = p0.toString();
                        },
                        valid: (p0) {
                          return validInput(p0.toString(), 1, 100, 'type');
                        },
                      ),
                      CustomTextWithfield(
                        text1: 'اسم المدينه',
                        width: sized,
                        text2: 'اسم المدينه هنا',
                        high: 60,
                        onChanged: (p0) {
                          controller.city = p0.toString();
                        },
                        onsaved: (p0) {
                          //return controller.city = p0.toString();
                        },
                        valid: (p0) {
                          return validInput(p0.toString(), 1, 100, 'type');
                        },
                      ),
                      CustomTextWithfield(
                        text1: 'مساحة العقار',
                        width: sized,
                        text2: 'يجب ان يكون القيمه رقم',
                        high: 60,
                        onsaved: (p0) {
                          return controller.space = p0.toString();
                        },
                        valid: (p0) {
                          return validInput(p0.toString(), 1, 40, 'type');
                        },
                      ),
                      CustomTextWithfield(
                        text1: 'السعر لكل متر',
                        width: sized,
                        high: 60,
                        text2: 'يجب ان يكون القيمه رقم',
                        onsaved: (p0) {
                          return controller.price = p0.toString();
                        },
                        valid: (p0) {
                          return validInput(p0.toString(), 1, 20, 'type');
                        },
                      ),
                      CustomTextWithfield(
                        text1: 'هل تريد اضافة اي وصف',
                        width: sized,
                        high: 60,
                        text2: 'الوصف',
                        onsaved: (p0) {
                          return controller.des = p0.toString();
                        },
                        valid: (p0) {
                          return validInput(p0.toString(), 1, 500, 'type');
                        },
                      ),
                      GetBuilder<AddPropertyController>(
                        init: AddPropertyController(),
                        builder: (controller) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 55,
                                width: deviceInfo.localWidth * 0.85,
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
                                  items: catogerNameslsit
                                      .map((catogeryList value) {
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
                                    print(controller.propertyType);
                                    controller.changetypepro(vlue!);
                                  },
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 70,
                                width: sized,
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
                                  items:
                                      AppStrings.timeList.map((String value) {
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
                              Container(
                                alignment: Alignment.center,
                                height: 70,
                                width: sized,
                                margin: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: ColorManager.bgColor,
                                ),
                                child: DropdownButton<String>(
                                  dropdownColor: ColorManager.white,
                                  hint: Text(
                                    'يرجي اختيار نوع الاتجاه',
                                    style: MangeStyles().getBoldStyle(
                                      color: ColorManager.grey2,
                                      fontSize: FontSize.s14,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  value: controller.propertydirection,
                                  items: AppStrings.directionLisr
                                      .map((String value) {
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
                                    controller.changeepropertydirection(vlue!);
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                      items:
                                          AppStrings.number.map((String value) {
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
                                      items:
                                          AppStrings.number.map((String value) {
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
                              SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                children: [
                                  for (int i = 0;
                                      i < controller.futturesList.length;
                                      i++)
                                    CustomChecBoxListTile(
                                      width: deviceInfo.localWidth * 0.5,
                                      name: controller.futturesList[i],
                                    ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              InkWell(
                                onTap: () {
                                  handleAttachmentPressed(
                                    context,
                                    contr: controller,
                                  );
                                },
                                child: Container(
                                  width: sized,
                                  height: 55,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: ColorManager.bgColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text('ارفق ملفك الان'),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GetBuilder<AddPropertyController>(
                                builder: (controller) {
                                  return HandlingDataView(
                                    statusRequest: controller.statusRequest1,
                                    widget: CustomButton(
                                      width: sized,
                                      haigh: 60,
                                      color: ColorManager.primaryColorbu,
                                      text: 'إضافة عقار',
                                      press: () {
                                        if (controller.roomnumber == null ||
                                            controller.image == null ||
                                            controller.propertyrentl == null ||
                                            controller.propertyType == null ||
                                            controller.tolitnumber == null ||
                                            !controller
                                                .formkeysigin.currentState!
                                                .validate()) {
                                          return showDilog(
                                            context,
                                            'يجب عليك تعبئة جميع الحقول',
                                            type: QuickAlertType.warning,
                                          );
                                        }

                                        // try {
                                        controller.formkeysigin.currentState!
                                            .save();
                                        controller.addProperty(context);
                                        // } catch (e) {
                                        //   print(e.toString());
                                        // }
                                      },
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ],
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

class CustomChecBoxListTile extends StatefulWidget {
  const CustomChecBoxListTile({
    Key? key,
    required this.name,
    this.width,
  }) : super(key: key);
  final String name;
  final double? width;

  @override
  State<CustomChecBoxListTile> createState() => _CustomChecBoxListTileState();
}

class _CustomChecBoxListTileState extends State<CustomChecBoxListTile> {
  bool done = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 300,
      // height: 120,
      child: Row(
        children: [
          GetBuilder<AddPropertyController>(
            init: AddPropertyController(),
            builder: (controller) {
              return Checkbox(
                value: done,
                onChanged: (value) {
                  setState(() {
                    done = value!;
                    print('$done : $value');
                  });
                  if (done == true) {
                    controller.future!.add(widget.name);
                  } else {
                    controller.future!.removeWhere(
                      (element) => element == widget.name,
                    );
                  }

                  print(controller.future);
                },
              );
            },
          ),
          Text(
            widget.name,
            style: MangeStyles().getRegularStyle(
              color: ColorManager.kTextblack,
              fontSize: FontSize.s14,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
