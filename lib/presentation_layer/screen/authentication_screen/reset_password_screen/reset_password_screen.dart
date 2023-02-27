import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:real_easte_app/application_layer/ShardFunction/valid.dart';
import 'package:real_easte_app/main.dart';
import 'package:real_easte_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:real_easte_app/presentation_layer/components/appbar1.dart';
import 'package:real_easte_app/presentation_layer/components/customtextfild.dart';
import 'package:real_easte_app/presentation_layer/components/show_dialog.dart';
import 'package:real_easte_app/presentation_layer/handlingView/handlingview.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/authentication_screen/bottomnavauth.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/values_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/authentication_screen/reset_password_screen/reset_password_controller/reset_password_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ResetPasswordController controller =
        Get.put(ResetPasswordController());
    return Scaffold(
      backgroundColor: ColorManager.white,
      bottomNavigationBar: BottomNavAuth(
        press: () {
          controller.otpVerfay(context: context);
        },
        text: 'متابعه',
      ),
      appBar: appbar('تعين كلمة السر'),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        width: double.infinity,
        height: double.infinity,
        child: InfoWidget(
          builder: (context, deviceInfo) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: deviceInfo.localWidth * AppDeviceSize.m5,
              ),
              child: GetBuilder<ResetPasswordController>(
                builder: (controller) {
                  return HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Form(
                      key: controller.formkeysigin,
                      child: ListView(
                        children: [
                          const SizedBox(height: AppSize.s80),
                          Text(
                            'إعادة تعيين كلمة المرور',
                            style: MangeStyles().getBoldStyle(
                                color: ColorManager.kTextblack,
                                fontSize: FontSize.s27),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  'كلمة السر',
                                  style: MangeStyles().getBoldStyle(
                                    color: ColorManager.kTextblack,
                                    fontSize: FontSize.s18,
                                  ),
                                ),
                              ),
                              CustomTextfeild(
                                valid: (p0) {
                                  return validInput(
                                      p0.toString(), 8, 100, 'password');
                                },
                                onsaved: (p0) {
                                  return controller.pass = p0;
                                },
                                titel: 'ادخل كلمة السر',
                                width: deviceInfo.localWidth,
                                height: 65,
                                icon: Icons.email,
                              ),
                              const SizedBox(height: 20),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  'تأكيد كلمة السر',
                                  textAlign: TextAlign.right,
                                  style: MangeStyles().getBoldStyle(
                                    color: ColorManager.kTextblack,
                                    fontSize: FontSize.s18,
                                  ),
                                ),
                              ),
                              CustomTextfeild(
                                valid: (p0) {
                                  return validInput(
                                      p0.toString(), 8, 100, 'password');
                                },
                                onsaved: (p0) {
                                  return controller.confairmpass = p0;
                                },
                                titel: 'تأكيد كلمة السر',
                                width: deviceInfo.localWidth,
                                height: 65,
                              ),
                            ],
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
