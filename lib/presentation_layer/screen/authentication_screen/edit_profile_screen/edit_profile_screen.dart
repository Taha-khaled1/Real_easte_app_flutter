import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:real_easte_app/application_layer/ShardFunction/valid.dart';
import 'package:real_easte_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:real_easte_app/presentation_layer/components/appbar1.dart';
import 'package:real_easte_app/presentation_layer/components/custombutten.dart';
import 'package:real_easte_app/presentation_layer/components/customtextfild.dart';
import 'package:real_easte_app/presentation_layer/handlingView/handlingview.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/values_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/authentication_screen/edit_profile_screen/edit_profile-controler/edit_profile_controler.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('تعديل الحساب الخاص بك'),
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
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: deviceInfo.localWidth * AppDeviceSize.m5,
              ),
              child: GetBuilder<EditProfileControler>(
                init: EditProfileControler(),
                builder: (controller) {
                  return HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Form(
                      key: controller.formkeysigin,
                      child: ListView(
                        shrinkWrap: false,
                        children: [
                          Lottie.asset(
                            'assets/json/profile.json',
                            height: 250,
                            width: 250,
                          ),
                          Text(
                            'الاسم واللقب',
                            style: MangeStyles().getBoldStyle(
                              color: ColorManager.kTextblack,
                              fontSize: FontSize.s20,
                            ),
                          ),
                          CustomTextfeild(
                            inialvalue: controller.userModel?.name,
                            valid: (p0) {
                              return validInput(p0.toString(), 1, 100, 'type');
                            },
                            onsaved: (p0) {
                              return controller.name = p0.toString();
                            },
                            titel: 'الاسم',
                            width: deviceInfo.localWidth * 0.85,
                            height: 70,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'رقم الهاتف',
                            style: MangeStyles().getBoldStyle(
                              color: ColorManager.kTextblack,
                              fontSize: FontSize.s20,
                            ),
                          ),
                          CustomTextfeild(
                            inialvalue: controller.userModel?.phone,
                            valid: (p0) {
                              return validInput(p0.toString(), 1, 50, 'phone');
                            },
                            onsaved: (p0) {
                              return controller.phonn = p0.toString();
                            },
                            titel: 'رقم الهاتف',
                            width: deviceInfo.localWidth * 0.85,
                            height: 70,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'الاميل الخاص بك',
                            style: MangeStyles().getBoldStyle(
                              color: ColorManager.kTextblack,
                              fontSize: FontSize.s20,
                            ),
                          ),
                          CustomTextfeild(
                            readOnly: true,
                            inialvalue: controller.userModel?.email,
                            valid: (p0) {
                              return validInput(p0.toString(), 1, 100, 'type');
                            },
                            onsaved: (p0) {
                              return null;
                            },
                            titel: 'الاميل',
                            width: deviceInfo.localWidth * 0.85,
                            height: 70,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'البلد',
                            style: MangeStyles().getBoldStyle(
                              color: ColorManager.kTextblack,
                              fontSize: FontSize.s20,
                            ),
                          ),
                          CustomTextfeild(
                            inialvalue: controller.userModel?.country,
                            valid: (p0) {
                              return validInput(p0.toString(), 1, 100, 'type');
                            },
                            onsaved: (p0) {
                              return controller.country = p0.toString();
                            },
                            titel: 'البلد',
                            width: deviceInfo.localWidth * 0.85,
                            height: 70,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'عنوان المنزل',
                            style: MangeStyles().getBoldStyle(
                              color: ColorManager.kTextblack,
                              fontSize: FontSize.s20,
                            ),
                          ),
                          CustomTextfeild(
                            inialvalue: controller.userModel?.adress ??
                                'Abudabhi 201,82299 ابوظبي',
                            isBoarder: BorderStyle.none,
                            valid: (p0) {
                              return validInput(p0.toString(), 1, 100, 'type');
                            },
                            onsaved: (p0) {
                              return controller.adress = p0.toString();
                            },
                            titel: 'العنوان',
                            width: deviceInfo.localWidth * 0.85,
                            height: 70,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomButton(
                            width: deviceInfo.localWidth,
                            haigh: 60,
                            color: ColorManager.primaryColorbu,
                            text: 'حفظ',
                            press: () {
                              if (controller.formkeysigin.currentState!
                                  .validate()) {
                                controller.formkeysigin.currentState!.save();
                                controller.ChangeUserData(context);
                              }
                            },
                          ),
                          SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class Editpay extends StatelessWidget {
  const Editpay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Row(
        children: [
          Image.asset('assets/images/payedit.png'),
          const SizedBox(
            width: 15,
          ),
          Text(
            'Stc Pay',
            style: MangeStyles().getBoldStyle(
              color: ColorManager.kTextblack,
              fontSize: FontSize.s22,
            ),
          ),
          const Expanded(child: SizedBox()),
          TextButton(
            onPressed: () {},
            child: Text(
              'تعديل',
              style: MangeStyles().getBoldStyle(
                color: ColorManager.kPrimary,
                fontSize: FontSize.s18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
