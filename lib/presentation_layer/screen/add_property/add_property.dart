import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/quickalert.dart';
import 'package:real_easte_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:real_easte_app/presentation_layer/components/appbar1.dart';
import 'package:real_easte_app/presentation_layer/components/custombutten.dart';
import 'package:real_easte_app/presentation_layer/components/customtextfild.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/strings_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/add_property/add_property_controller/add_property_controller.dart';

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
            return ListView(
              //   alignment: WrapAlignment.center,
              children: [
                CustomTextWithfield(
                  text1: 'اسم العقار',
                  width: sized,
                  high: 60,
                  text2: 'اسم العقار هنا',
                  onsaved: (p0) {
                    //  return etlala = p0.toString();
                  },
                  valid: (p0) {
                    //   return validInput(p0.toString(), 1, 50, 'type');
                  },
                ),
                CustomTextWithfield(
                  text1: 'اسم المدينه',
                  width: sized,
                  text2: 'اسم المدينه هنا',
                  high: 60,
                  onsaved: (p0) {
                    //  return etlala = p0.toString();
                  },
                  valid: (p0) {
                    //   return validInput(p0.toString(), 1, 50, 'type');
                  },
                ),
                CustomTextWithfield(
                  text1: 'مساحة العقار',
                  width: sized,
                  text2: 'يجب ان يكون القيمه رقم',
                  high: 60,
                  onsaved: (p0) {
                    //  return etlala = p0.toString();
                  },
                  valid: (p0) {
                    //   return validInput(p0.toString(), 1, 50, 'type');
                  },
                ),
                CustomTextWithfield(
                  text1: 'السعر لكل متر',
                  width: sized,
                  high: 60,
                  text2: 'يجب ان يكون القيمه رقم',
                  onsaved: (p0) {
                    //  return etlala = p0.toString();
                  },
                  valid: (p0) {
                    //   return validInput(p0.toString(), 1, 50, 'type');
                  },
                ),
                CustomTextWithfield(
                  text1: 'هل تريد اضافة اي وصف',
                  width: sized,
                  high: 60,
                  text2: 'الوصف',
                  onsaved: (p0) {
                    //  return etlala = p0.toString();
                  },
                  valid: (p0) {
                    //   return validInput(p0.toString(), 1, 50, 'type');
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
                              'يرجي اختيار نوع العقار',
                              style: MangeStyles().getBoldStyle(
                                color: ColorManager.grey2,
                                fontSize: FontSize.s14,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            value: controller.propertyType,
                            items: pro.map((Pro value) {
                              return DropdownMenuItem<String>(
                                value: value.name,
                                child: Text(
                                  value.name.toString(),
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
                            items: AppStrings.directionLisr.map((String value) {
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
                              'يرجي اختيار نوع العقار',
                              style: MangeStyles().getBoldStyle(
                                color: ColorManager.grey2,
                                fontSize: FontSize.s14,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            value: controller.propertyType,
                            items: AppStrings.buildtypelis.map((String value) {
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
                              controller.changepropertyclassfication(vlue!);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
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
                              child: DropdownButton<int>(
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
                                items: AppStrings.number.map((int value) {
                                  return DropdownMenuItem<int>(
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
                              child: DropdownButton<int>(
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
                                items: AppStrings.number.map((int value) {
                                  return DropdownMenuItem<int>(
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
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            handleAttachmentPressed(context);
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
                        CustomButton(
                          width: sized,
                          haigh: 60,
                          color: ColorManager.primaryColorbu,
                          text: 'إضافة عقار',
                          press: () {
                            if (controller.formkeysigin.currentState!
                                .validate()) {
                              controller.formkeysigin.currentState!.save();
                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.success,
                                text:
                                    'تم رفع العقار بنجاح وبانتظر الموافقه من الادمن',
                                onConfirmBtnTap: () {
                                  Get.back();
                                  Future.delayed(Duration(milliseconds: 100));
                                },
                              );
                            }
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CustomListtile extends StatelessWidget {
  const CustomListtile({
    Key? key,
    this.image,
    required this.onTap,
    required this.titel,
    this.textStyle,
    this.widget,
  }) : super(key: key);
  final void Function()? onTap;
  final String? image, titel;
  final TextStyle? textStyle;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: widget,
      title: Text(
        titel!,
        style: MangeStyles().getBoldStyle(
          color: ColorManager.kTextblack,
          fontSize: FontSize.s18,
        ),
      ),
    );
  }
}

void handleAttachmentPressed(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) => SafeArea(
      child: SizedBox(
        height: 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomListtile(
              widget: Icon(Icons.camera_alt_outlined),
              onTap: () {
                Navigator.pop(context);
                getImage(ImageSource.camera);
              },
              titel: 'التقاط صوره',
            ),
            CustomListtile(
              widget: Icon(Icons.browse_gallery_outlined),
              onTap: () {
                Navigator.pop(context);
                getImage(ImageSource.gallery);
              },
              titel: 'اختار صوره',
            ),
            CustomListtile(
              widget: Icon(
                Icons.arrow_back_ios_outlined,
                textDirection: TextDirection.rtl,
              ),
              onTap: () {
                Navigator.pop(context);
              },
              titel: 'الرجوع للخلف',
            ),
          ],
        ),
      ),
    ),
  );
}

Future getImage(ImageSource source) async {
  ImagePicker imagePicker = ImagePicker();
  XFile? pickedFile;
  pickedFile = await imagePicker.pickImage(source: source);
  if (pickedFile != null) {
    File imageFile = File(pickedFile.path);
  }
}

class Pro {
  final String name;

  Pro({required this.name});
}

List<Pro> pro = [
  Pro(name: 'فيلا'),
  Pro(name: 'شاليه'),
  Pro(name: 'منزل'),
];

class CustomTextWithfield extends StatelessWidget {
  const CustomTextWithfield({
    Key? key,
    required this.text1,
    this.text2,
    this.valid,
    this.onsaved,
    this.width,
    this.high,
  }) : super(key: key);
  final String? text1, text2;
  final String? Function(String?)? valid;
  final String? Function(String?)? onsaved;
  final double? width, high;
  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, deviceInfo) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: deviceInfo.localWidth * 0.07, bottom: 10),
                  child: Text(
                    text1 ?? '',
                    style: MangeStyles().getRegularStyle(
                      color: ColorManager.kTextblack,
                      fontSize: FontSize.s18,
                    ),
                  ),
                )),
            SizedBox(
              width: 10,
            ),
            CustomTextfeild(
              valid: valid,
              isenabledBorder: false,
              fillColor: ColorManager.bgColor,
              onsaved: onsaved,
              titel: text2 ?? '',
              width: width ?? 150,
              height: high ?? 55,
            ),
          ],
        );
      },
    );
  }
}

void aleartToken(BuildContext context) {
  QuickAlert.show(
    showCancelBtn: true,
    onCancelBtnTap: () {
      Get.back();
    },
    onConfirmBtnTap: () {
      // Get.to(Login());
    },
    cancelBtnText: 'الرجوع للخلف',
    confirmBtnText: 'تسجيل الدخول',
    context: context,
    type: QuickAlertType.info,
    text: 'يجب تسجيل الدخول اولا',
  );
}
