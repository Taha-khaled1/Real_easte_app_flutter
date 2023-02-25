import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:real_easte_app/application_layer/ShardFunction/valid.dart';
import 'package:real_easte_app/presentation_layer/components/custombutten.dart';
import 'package:real_easte_app/presentation_layer/components/customtextfild.dart';
import 'package:real_easte_app/presentation_layer/components/show_dialog.dart';
import 'package:real_easte_app/presentation_layer/handlingView/handlingview.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/settings/controller/settings_controller.dart';

changepass(BuildContext context, SeetingesController controller) {
  Get.bottomSheet(
    isScrollControlled: true,
    Container(
      height: 520,
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
                'تغير كلمة المرور',
                style: TextStyle(color: ColorManager.kTextblack, fontSize: 20),
              ),
            ),
            Text(
              ' كلمة المرور القديم',
              style: TextStyle(color: ColorManager.kTextblack, fontSize: 20),
            ),
            CustomTextfeild(
              obsecuer: true,
              valid: (p0) {
                return validInput(p0.toString(), 2, 50, 'password');
              },
              onsaved: (p0) {
                return controller.oldpass = p0.toString();
              },
              titel: ' كلمة المرور القديم',
              width: double.infinity * 0.85,
              height: 70,
            ),
            const SizedBox(height: 15),
            Text(
              ' كلمة المرور الجديد',
              style: TextStyle(color: ColorManager.kTextblack, fontSize: 20),
            ),
            CustomTextfeild(
              obsecuer: true,
              valid: (p0) {
                return validInput(p0.toString(), 2, 50, 'password');
              },
              onsaved: (p0) {
                return controller.pasws = p0.toString();
              },
              titel: ' كلمة المرور الجديد',
              width: 400,
              height: 70,
            ),
            const SizedBox(height: 15),
            Text(
              'تاكيد  كلمة المرور',
              style: TextStyle(color: ColorManager.kTextblack, fontSize: 20),
            ),
            CustomTextfeild(
              obsecuer: true,
              valid: (p0) {
                return validInput(p0.toString(), 2, 50, 'password');
              },
              onsaved: (p0) {
                return controller.confirempass = p0.toString();
              },
              titel: 'تاكيد  كلمة المرور',
              width: double.infinity * 0.85,
              height: 70,
            ),
            const SizedBox(height: 15),
            GetBuilder<SeetingesController>(
              builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: CustomButton(
                    width: double.infinity,
                    haigh: 60,
                    color: ColorManager.primaryColorbu,
                    text: 'حفظ',
                    press: () {
                      if (controller.formkeysigin.currentState!.validate()) {
                        controller.formkeysigin.currentState!.save();
                        if (controller.pasws == controller.confirempass) {
                          controller.changePassordApi(context);
                        } else {
                          showDilog(
                            context,
                            'كلمة المرور غير متطابقتان',
                            type: QuickAlertType.error,
                          );
                        }
                      }
                    },
                  ),
                );
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
