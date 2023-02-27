import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_easte_app/application_layer/ShardFunction/statusrequst.dart';
import 'package:real_easte_app/application_layer/ShardFunction/valid.dart';
import 'package:real_easte_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:real_easte_app/presentation_layer/components/custombutten.dart';
import 'package:real_easte_app/presentation_layer/components/customtextfild.dart';
import 'package:real_easte_app/presentation_layer/handlingView/handlingview.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/routes_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/values_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/authentication_screen/login_screen/login_screen.dart';

import 'signup_controller/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      bottomNavigationBar: GetBuilder<SignupController>(
        init: SignupController(),
        initState: (_) {},
        builder: (_) {
          return InfoWidget(
            builder: (context, deviceInfo) {
              return _.statusRequest == StatusRequest.loading
                  ? SizedBox()
                  : SizedBox(
                      height: 130,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomButton(
                            width: deviceInfo.localWidth * 0.85,
                            haigh: 60,
                            color: ColorManager.icon,
                            text: 'انشئ حسابك',
                            press: () {
                              _.register(context: context);
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.off(() => LoginScreen());
                                },
                                child: Text(
                                  'هل لديك حساب؟',
                                  textAlign: TextAlign.left,
                                  style: MangeStyles().getBoldStyle(
                                    color: ColorManager.kTextlightgray,
                                    fontSize: FontSize.s18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
            },
          );
        },
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.white,
      ),
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
              child: GetBuilder<SignupController>(
                builder: (controller) {
                  return HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: Form(
                      key: controller.formkeysigin,
                      child: ListView(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'انشئ حساب',
                              style: MangeStyles().getBoldStyle(
                                color: ColorManager.kTextblack,
                                fontSize: FontSize.s27,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  'الاسم الكامل',
                                  textAlign: TextAlign.right,
                                  style: MangeStyles().getBoldStyle(
                                    color: ColorManager.kTextblack,
                                    fontSize: FontSize.s18,
                                  ),
                                ),
                              ),
                              CustomTextfeild(
                                icon: Icons.person,
                                valid: (p0) {
                                  return validInput(
                                      p0.toString(), 1, 100, 'type');
                                },
                                onsaved: (p0) {
                                  return controller.name = p0!;
                                },
                                titel: 'ادخل اسمك الكامل',
                                width: deviceInfo.localWidth,
                                height: 65,
                              ),
                              const SizedBox(height: 15),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  'رقم الهاتف',
                                  textAlign: TextAlign.right,
                                  style: MangeStyles().getBoldStyle(
                                    color: ColorManager.kTextblack,
                                    fontSize: FontSize.s18,
                                  ),
                                ),
                              ),
                              CustomTextfeild(
                                icon: Icons.phone,
                                valid: (p0) {
                                  return validInput(
                                      p0.toString(), 1, 100, 'ty');
                                },
                                onsaved: (p0) {
                                  return controller.phone = p0!;
                                },
                                titel: 'ادخل رقم الهاتف',
                                width: deviceInfo.localWidth,
                                height: 65,
                              ),
                              const SizedBox(height: 15),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  'بريد الكتروني',
                                  textAlign: TextAlign.right,
                                  style: MangeStyles().getBoldStyle(
                                    color: ColorManager.kTextblack,
                                    fontSize: FontSize.s18,
                                  ),
                                ),
                              ),
                              CustomTextfeild(
                                icon: Icons.email_outlined,
                                valid: (p0) {
                                  return validInput(
                                      p0.toString(), 1, 100, 'email');
                                },
                                onsaved: (p0) {
                                  return controller.email = p0!;
                                },
                                titel: 'ادخل بريدك الاكتروني',
                                width: deviceInfo.localWidth,
                                height: 65,
                              ),
                              const SizedBox(height: 15),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  'المكان',
                                  style: MangeStyles().getBoldStyle(
                                    color: ColorManager.kTextblack,
                                    fontSize: FontSize.s18,
                                  ),
                                ),
                              ),
                              CustomTextfeild(
                                icon: Icons.expand_more,
                                readOnly: true,
                                inialvalue: controller.country,
                                onTap: () {
                                  showCountryPicker(
                                    context: context,
                                    countryListTheme: CountryListThemeData(
                                      flagSize: 25,
                                      backgroundColor: Colors.white,
                                      textStyle: TextStyle(
                                          fontSize: 16, color: Colors.blueGrey),
                                      bottomSheetHeight:
                                          500, // Optional. Country list modal height
                                      //Optional. Sets the border radius for the bottomsheet.
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20.0),
                                        topRight: Radius.circular(20.0),
                                      ),
                                      //Optional. Styles the search field.
                                      inputDecoration: InputDecoration(
                                        labelText: 'Search',
                                        hintText: 'Start typing to search',
                                        prefixIcon: const Icon(Icons.search),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: const Color(0xFF8C98A8)
                                                .withOpacity(0.2),
                                          ),
                                        ),
                                      ),
                                    ),
                                    onSelect: (Country country) {
                                      controller.changeCountry(
                                        country.displayNameNoCountryCode,
                                      );
                                    },
                                  );
                                },
                                valid: (p0) {
                                  return validInput(
                                    controller.country.toString(),
                                    1,
                                    100,
                                    'type',
                                  );
                                },
                                onsaved: (p0) {
                                  return controller.country = p0!;
                                },
                                titel: controller.country ?? '',
                                width: deviceInfo.localWidth,
                                height: 65,
                              ),
                              const SizedBox(height: 15),
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
                              GetBuilder<SignupController>(
                                builder: (controller) {
                                  return CustomTextfeild(
                                    maxLines: 1,
                                    iconontap: () {
                                      controller.obSecuer();
                                    },
                                    obsecuer: controller.obsecuer,
                                    icon: controller.obsecuer == true
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    valid: (p0) {
                                      return validInput(
                                          p0.toString(), 1, 100, 'password');
                                    },
                                    onsaved: (p0) {
                                      return controller.password = p0!;
                                    },
                                    titel: 'ادخل كلمة السر',
                                    width: deviceInfo.localWidth,
                                    height: 65,
                                  );
                                },
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
