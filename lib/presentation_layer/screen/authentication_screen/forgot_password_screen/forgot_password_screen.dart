import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_easte_app/application_layer/ShardFunction/statusrequst.dart';
import 'package:real_easte_app/application_layer/ShardFunction/valid.dart';
import 'package:real_easte_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:real_easte_app/presentation_layer/components/appbar1.dart';
import 'package:real_easte_app/presentation_layer/components/customtextfild.dart';
import 'package:real_easte_app/presentation_layer/handlingView/handlingview.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/authentication_screen/bottomnavauth.dart';
import 'package:real_easte_app/presentation_layer/screen/authentication_screen/forgot_password_screen/forgot_password_controller/forgot_password_controller.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/values_manager.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ForgotPasswordController controller = Get.put(ForgotPasswordController());
    return Scaffold(
      backgroundColor: ColorManager.white,
      bottomNavigationBar: controller.statusRequest == StatusRequest.loading
          ? SizedBox()
          : BottomNavAuth(
              press: () {
                controller.forgetPass(context: context);
              },
              text: 'متابعه',
            ),
      appBar: appbar('نسيت كلمة السر'),
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
              child: GetBuilder<ForgotPasswordController>(
                init: ForgotPasswordController(),
                builder: (controller) {
                  return HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Form(
                      key: controller.formkeysigin,
                      child: ListView(
                        children: [
                          const SizedBox(height: AppSize.s80),
                          Text(
                            'نسيت كلمة السر ؟',
                            style: MangeStyles().getBoldStyle(
                                color: ColorManager.kTextblack,
                                fontSize: FontSize.s27),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'لا تقلق بشأن حدوث ذلك. الرجاء إدخال البريد الإلكتروني المرتبط بحسابك.',
                            style: MangeStyles().getBoldStyle(
                                color: ColorManager.kTextblack,
                                fontSize: FontSize.s18),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  'بريد الكتروني',
                                  textAlign: TextAlign.right,
                                  style: MangeStyles().getBoldStyle(
                                      color: ColorManager.kTextblack,
                                      fontSize: FontSize.s18),
                                ),
                              ),
                              CustomTextfeild(
                                valid: (p0) {
                                  return validInput(
                                      p0.toString(), 1, 100, 'email');
                                },
                                onsaved: (p0) {
                                  return controller.email = p0.toString();
                                },
                                titel: 'ادخل بريدك الاكتروني',
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
