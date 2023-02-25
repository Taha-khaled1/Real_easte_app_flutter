import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:real_easte_app/main.dart';
import 'package:real_easte_app/presentation_layer/handlingView/handlingview.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/add_property/add_property.dart';
import 'package:real_easte_app/presentation_layer/screen/authentication_screen/edit_profile_screen/edit_profile_screen.dart';
import 'package:real_easte_app/presentation_layer/screen/home_screen/home_screen.dart';
import 'package:real_easte_app/presentation_layer/screen/settings/controller/settings_controller.dart';
import 'package:real_easte_app/presentation_layer/screen/settings/screenseting/changepass.dart';
import 'package:real_easte_app/presentation_layer/screen/settings/screenseting/sharescreen.dart';
import 'package:real_easte_app/presentation_layer/screen/settings/screenseting/terms.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SeetingesController controller = Get.put(SeetingesController());
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: AllListtileControllerBoard(controller: controller),
    );
  }
}

class AllListtileControllerBoard extends StatelessWidget {
  const AllListtileControllerBoard({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final SeetingesController controller;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SeetingesController>(
      builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/icons/logoback.png'),
              SizedBox(
                height: 10,
              ),
              Text(
                'الشركه العقاريه',
                style: MangeStyles().getBoldStyle(
                  color: ColorManager.kTextblack,
                  fontSize: FontSize.s22,
                ),
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              if (sharedPreferences.getString('token') != null)
                ControllerBoardWidget(),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              if (sharedPreferences.getString('token') != null)
                CustomListtile(
                  widget: Icon(
                    Icons.settings,
                    color: ColorManager.icon,
                  ), //assets/icons/Frame 26.svg
                  titel: 'الملف الشخصي',
                  onTap: () {
                    Get.to(EditProfileScreen());
                  },
                ),
              CustomListtile(
                widget: Icon(
                  Icons.share,
                  color: ColorManager.icon,
                ),
                titel: 'مشاركة التطبيق',
                onTap: () {
                  Get.to(() => InviteFriend());
                },
              ),
              CustomListtile(
                widget: Icon(
                  Icons.security,
                  color: ColorManager.icon,
                ),
                titel: 'الشروط و الاحكام',
                onTap: () {
                  Get.to(() => TermsAndConditionsPage());
                },
              ),
              if (sharedPreferences.getString('token') != null)
                CustomListtile(
                  widget: Icon(
                    Icons.password_outlined,
                    color: ColorManager.icon,
                  ),
                  titel: 'تغيير كلمة السر',
                  onTap: () {
                    changepass(context, controller);
                  },
                ),
              if (sharedPreferences.getString('token') != null)
                GetBuilder<SeetingesController>(
                  builder: (controller) {
                    return HandlingDataView(
                      statusRequest: controller.statusRequest1,
                      widget: CustomListtile(
                        widget: Icon(
                          Icons.exit_to_app,
                          color: ColorManager.icon,
                        ),
                        titel: 'تسجيل خروج',
                        onTap: () {
                          controller.logOut(context);
                        },
                      ),
                    );
                  },
                ),
              if (sharedPreferences.getString('token') != null)
                CustomListtile(
                  widget: Icon(
                    Icons.delete,
                    color: ColorManager.icon,
                  ),
                  titel: 'حذف الحساب',
                  onTap: () {
                    QuickAlert.show(
                      showCancelBtn: true,
                      context: context,
                      type: QuickAlertType.warning,
                      text:
                          'سيتم حذف الحساب الخاص بك نهائيا من\n قاعدة البيانات الخاصه بنا ',
                      title: 'هل متاكد من حذف الحساب',
                      cancelBtnText: 'تراجع',
                      confirmBtnText: 'نعم متاكد',
                      confirmBtnColor: ColorManager.error,
                      onCancelBtnTap: () {
                        Get.back();
                      },
                      onConfirmBtnTap: () {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.warning,
                          text:
                              '  سيتم حذف الحساب الخاص بك نهائيا من قاعدة البيانات الخاصه بنا\n في خلال 30 يوم من الان ويمكنك الدخول اليه ف هذه الوقت',
                          title: 'الحاله',
                          onConfirmBtnTap: () {
                            Get.back();
                            Get.back();
                          },
                        );
                      },
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}

class ControllerBoardWidget extends StatelessWidget {
  const ControllerBoardWidget({
    Key? key,
    // required this.controller,
  }) : super(key: key);
  //final ControlBoardController controller;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (ctx, snapshot) {
        // Checking if future is resolved or not
        if (snapshot.connectionState == ConnectionState.done) {
          // If we got an error
          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error} occurred',
                style: TextStyle(fontSize: 18),
              ),
            );

            // if we got our data
          } else if (snapshot.hasData) {
            // Extracting data from snapshot object

            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomContainerBoard(
                      color: ColorManager.containacolor1,
                      number:
                          1, //, controller.countersModels?.cartItemCount! ?? 0,
                      subtitel: 'عدد الاعلانات التي \n تم نشرها بواستطك',
                      titel: 'اعلان',
                    ),
                    CustomContainerBoard(
                      color: ColorManager.containacolor2,
                      number:
                          1, //controller.countersModels?.wishlistItemCount! ?? 0,
                      subtitel: 'مجموع مشاهدات \nالاعلانات الخاص بك',
                      titel: 'مشاهده',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomContainerBoard(
                  color: ColorManager.containacolor3,
                  number: 1, //controller.countersModels?.orderCount! ?? 0,
                  subtitel: 'مجموع الاستعلامات \nالعقارت الخاصه بك',
                  titel: 'استعلام',
                  opcty: 1,
                ),
              ],
            );
          }
        }

        // Displaying LoadingSpinner to indicate waiting state
        return Center(
          child: CircularProgressIndicator(),
        );
      },

      // Future that needs to be resolved
      // inorder to display something on the Canvas
      future: FUN(),
    );
  }
}

FUN() {}

class CustomContainerBoard extends StatelessWidget {
  const CustomContainerBoard({
    Key? key,
    required this.color,
    required this.number,
    required this.titel,
    required this.subtitel,
    this.opcty,
  }) : super(key: key);
  final Color color;
  final int number;
  final String titel, subtitel;
  final double? opcty;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: color,
      ),
      child: Column(
        children: [
          Text(
            '$number',
            style: MangeStyles().getBoldStyle(
              color: ColorManager.kTextblack,
              fontSize: FontSize.s22,
            ),
          ),
          Text(
            titel,
            style: MangeStyles().getBoldStyle(
              color: ColorManager.kTextblack,
              fontSize: FontSize.s16,
            ),
          ),
          Text(
            subtitel,
            textAlign: TextAlign.center,
            style: MangeStyles().getBoldStyle(
              color: ColorManager.kTextblack.withOpacity(opcty ?? 0.5),
              fontSize: FontSize.s16,
            ),
          ),
        ],
      ),
    );
  }
}
