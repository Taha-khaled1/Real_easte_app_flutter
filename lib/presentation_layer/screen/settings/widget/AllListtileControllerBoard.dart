import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:real_easte_app/main.dart';
import 'package:real_easte_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:real_easte_app/presentation_layer/handlingView/handlingview.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/add_property/widgte/CustomListtile.dart';
import 'package:real_easte_app/presentation_layer/screen/authentication_screen/edit_profile_screen/edit_profile_screen.dart';
import 'package:real_easte_app/presentation_layer/screen/settings/controller/settings_controller.dart';
import 'package:real_easte_app/presentation_layer/screen/settings/screenseting/changepass.dart';
import 'package:real_easte_app/presentation_layer/screen/settings/screenseting/sharescreen.dart';
import 'package:real_easte_app/presentation_layer/screen/settings/screenseting/terms.dart';
import 'package:real_easte_app/presentation_layer/screen/settings/widget/ControllerBoardWidget.dart';

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
        return InfoWidget(
          builder: (context, deviceInfo) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: deviceInfo.localWidth * 0.9,
                    height: 150,
                    child: Image.asset(
                      'assets/icons/logoapp.png',
                    ),
                  ),
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
                  // if (sharedPreferences.getString('token') != null)
                  //   ControllerBoardWidget(),
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
                        Get.to(() => EditProfileScreen());
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
      },
    );
  }
}
