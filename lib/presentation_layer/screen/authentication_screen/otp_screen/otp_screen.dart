import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:real_easte_app/application_layer/ShardFunction/valid.dart';
import 'package:real_easte_app/main.dart';
import 'package:real_easte_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:real_easte_app/presentation_layer/components/appbar1.dart';
import 'package:real_easte_app/presentation_layer/components/show_dialog.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/values_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/authentication_screen/bottomnavauth.dart';
import 'package:real_easte_app/presentation_layer/screen/authentication_screen/otp_screen/otp_controller/otp_controller.dart';
import 'package:real_easte_app/presentation_layer/screen/authentication_screen/reset_password_screen/reset_password_screen.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});
  final pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final OtpController controller = Get.put(OtpController());
    return Scaffold(
      backgroundColor: ColorManager.white,
      bottomNavigationBar: BottomNavAuth(
        press: () {
          if (controller.otp!.length < 6 || controller.otp == null) {
            return showDilog(
              context,
              'يرجي ادخال الكود صحيح',
              type: QuickAlertType.info,
            );
          }
          Get.to(
            () => ResetPasswordScreen(),
            arguments: {'otp': '${controller.otp}'},
          );
        },
        text: 'متابعه',
      ),
      appBar: appbar(''),
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
              child: GetBuilder<OtpController>(
                builder: (controller) {
                  return ListView(
                    children: [
                      const SizedBox(height: AppSize.s80),
                      Text(
                        'ادخل الرمز',
                        style: MangeStyles().getBoldStyle(
                            color: ColorManager.kTextblack,
                            fontSize: FontSize.s27),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'تم إرسال رمز مكون من 6 أرقام إلى ${sharedPreferences.get('veryemail')}',
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.kTextblack,
                          fontSize: FontSize.s18,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 20),
                      Directionality(
                        // Specify direction if desired
                        textDirection: TextDirection.ltr,
                        child: Pinput(
                          length: 6,
                          androidSmsAutofillMethod:
                              AndroidSmsAutofillMethod.smsUserConsentApi,
                          listenForMultipleSmsOnAndroid: true,
                          defaultPinTheme: PinTheme(
                              height: 75,
                              width: 70,
                              textStyle: TextStyle(color: ColorManager.white),
                              // margin: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: ColorManager.kTextblack,
                                borderRadius: BorderRadius.circular(10),
                              )),
                          onChanged: (value) {
                            controller.otp = value.toString();
                          },
                          validator: (value) {
                            return validInput(
                              value.toString(),
                              6,
                              6,
                              'type',
                            );
                          },
                          onClipboardFound: (value) {
                            debugPrint('onClipboardFound: $value');
                            pinController.setText(value);
                          },
                          hapticFeedbackType: HapticFeedbackType.lightImpact,
                          onCompleted: (pin) {
                            if (controller.otp!.length < 6 ||
                                controller.otp == null) {
                              return showDilog(
                                context,
                                'يرجي ادخال الكود صحيح',
                                type: QuickAlertType.info,
                              );
                            }
                            controller.otp = pin;
                            Get.to(
                              () => ResetPasswordScreen(),
                              arguments: {'otp': '${controller.otp}'},
                            );
                            debugPrint('onCompleted: $pin');
                          },
                          cursor: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 9),
                                width: 22,
                                height: 1,
                                //  color: focusedBorderColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
