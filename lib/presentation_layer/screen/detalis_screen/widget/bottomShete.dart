import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:real_easte_app/application_layer/ShardFunction/valid.dart';
import 'package:real_easte_app/presentation_layer/components/custombutten.dart';
import 'package:real_easte_app/presentation_layer/components/customtextfild.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/detalis_screen/controller/PropertDetalisController.dart';

void CustombooTomSheet(
    BuildContext context, bool isreport, PropertDetalisController controller) {
  Get.bottomSheet(
    isScrollControlled: true,
    Container(
      height: 680,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      decoration: const BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Form(
        key: controller.formkeysigin,
        child: ListView(
          children: [
            const SizedBox(
              height: 7,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                isreport ? 'الابلاغ عن العقار' : 'استعلم الآن عن هذا الإعلان',
                style: TextStyle(color: Color(0xff6B85B3), fontSize: 20),
              ),
            ),
            Text(
              'اسمك',
              style: TextStyle(color: Color(0xff6B85B3), fontSize: 20),
            ),
            CustomTextfeild(
              valid: (p0) {
                return validInput(p0.toString(), 2, 50, 'type');
              },
              onsaved: (p0) {
                return controller.nameag = p0.toString();
              },
              titel: 'ادخل اسمك',
              width: double.infinity * 0.85,
              height: 70,
            ),
            const SizedBox(height: 15),
            Text(
              'هاتفك',
              style: TextStyle(color: Color(0xff6B85B3), fontSize: 20),
            ),
            CustomTextfeild(
              valid: (p0) {
                return validInput(p0.toString(), 2, 50, 'phone');
              },
              onsaved: (p0) {
                return controller.phoneag = p0.toString();
              },
              titel: 'ادخل رقم هاتف ',
              width: 400,
              height: 70,
            ),
            const SizedBox(height: 15),
            Text(
              'اميلك',
              style: TextStyle(color: Color(0xff6B85B3), fontSize: 20),
            ),
            CustomTextfeild(
              valid: (p0) {
                return validInput(p0.toString(), 2, 50, 'email');
              },
              onsaved: (p0) {
                return controller.emailag = p0.toString();
              },
              titel: 'ادخل الاميل الخاص بك',
              width: double.infinity * 0.85,
              height: 70,
            ),
            const SizedBox(height: 15),
            Text(
              isreport ? 'وصف المشكله' : 'هل تريد اضافة اي وصف',
              style: TextStyle(color: Color(0xff6B85B3), fontSize: 20),
            ),
            CustomTextfeild(
              maxLines: 5,
              valid: (p0) {
                return validInput(p0.toString(), 2, 250, 'nono');
              },
              onsaved: (p0) {
                return controller.descag = p0.toString();
              },
              titel: isreport
                  ? 'اكتب عن المشكله التي واجهتك بخصوص هذه العقار'
                  : 'اكتب الوصف هنا',
              width: double.infinity * 0.85,
              height: 70,
            ),
            const SizedBox(height: 15),
            CustomButton(
              width: double.infinity,
              haigh: 60,
              color: Color(0xff6B85B3),
              text: isreport ? 'الابلاغ الان' : 'الاستعلام الان',
              press: () {
                if (controller.formkeysigin.currentState!.validate()) {
                  controller.formkeysigin.currentState!.save();
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    text: isreport
                        ? 'تم إرسال الابلاغ بنجاح'
                        : 'تم إرسال الاستعلام بنجاح ',
                    onConfirmBtnTap: () {
                      Get.back();
                      Future.delayed(Duration(milliseconds: 100));
                      Get.back();
                    },
                  );
                }
              },
            )
          ],
        ),
      ),
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
    ),
  );
}
