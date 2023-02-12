import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:real_easte_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:real_easte_app/presentation_layer/components/appbar1.dart';
import 'package:real_easte_app/presentation_layer/components/custombutten.dart';
import 'package:real_easte_app/presentation_layer/components/customtextfild.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/values_manager.dart';

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
                    inialvalue: 'Hacen Boudebbane',
                    valid: (p0) {
                      return null;
                    },
                    onsaved: (p0) {
                      return null;
                    },
                    titel: 'ادخل هنا',
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
                    inialvalue: '+96658655854',
                    valid: (p0) {
                      return null;
                    },
                    onsaved: (p0) {
                      return null;
                    },
                    titel: 'ادخل هنا',
                    width: deviceInfo.localWidth * 0.85,
                    height: 70,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'اسم البلد',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.kTextblack,
                      fontSize: FontSize.s20,
                    ),
                  ),
                  CustomTextfeild(
                    inialvalue: 'Hacen.design@gmail.com',
                    valid: (p0) {
                      return null;
                    },
                    onsaved: (p0) {
                      return null;
                    },
                    titel: 'ادخل هنا',
                    width: deviceInfo.localWidth * 0.85,
                    height: 70,
                  ),
                  const SizedBox(height: 10),
                  // Text(
                  //   'طريقة الدفع',
                  //   style: MangeStyles().getBoldStyle(
                  //     color: ColorManager.kTextblack,
                  //     fontSize: FontSize.s20,
                  //   ),
                  // ),
                  // const Editpay(),
                  // const SizedBox(height: 10),
                  Text(
                    'عنوان المنزل',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.kTextblack,
                      fontSize: FontSize.s20,
                    ),
                  ),
                  CustomTextfeild(
                    isBoarder: BorderStyle.none,
                    valid: (p0) {
                      return null;
                    },
                    onsaved: (p0) {
                      return null;
                    },
                    titel: 'Abudabhi 201,82299 ابوظبي',
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
                    press: () {},
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
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
