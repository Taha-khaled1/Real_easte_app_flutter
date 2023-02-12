import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:real_easte_app/application_layer/ShardFunction/valid.dart';
import 'package:real_easte_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:real_easte_app/presentation_layer/components/custombutten.dart';
import 'package:real_easte_app/presentation_layer/components/customtextfild.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/detalis_screen/controller/PropertDetalisController.dart';

import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';

class PropertyDetalisScreen extends StatelessWidget {
  const PropertyDetalisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PropertDetalisController controller = Get.put(PropertDetalisController());
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Container(
        child: InfoWidget(
          builder: (context, deviceInfo) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 340,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/images/hotel1.jpg'),
                          fit: BoxFit.cover,
                        )
                        // image: DecorationImage(
                        //   image: NetworkImage(controller
                        //                   .infoRoomModel?.room!.imgs ==
                        //               null ||
                        //           controller
                        //                   .infoRoomModel?.room!.imgs ==
                        //               ""
                        //       ? 'https://akm-img-a-in.tosshub.com/businesstoday/images/story/202204/ezgif-sixteen_nine_161.jpg?size=948:533'
                        //       : "${MangeAPi.baseurl}/${controller.infoRoomModel?.room!.imgs!.split(',').first}"),
                        //   fit: BoxFit.cover,
                        // ),
                        ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'منزل محمد الاول',
                          style: MangeStyles().getRegularStyle(
                            color: ColorManager.kTextblack,
                            fontSize: FontSize.s18,
                          ),
                        ),
                        Text(
                          'ابو ظبي',
                          style: MangeStyles().getRegularStyle(
                            color: ColorManager.primaryColorbu,
                            fontSize: FontSize.s18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 660,
                    width: deviceInfo.localWidth * 0.95,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: ColorManager.containacolor3,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TowText(
                          text1: 'رقم للتواصل',
                          text2: '925667285263',
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        TowText(
                          text1: 'اسم مالك العقار',
                          text2: 'واليد محمد',
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        TowText(
                          text1: 'تصنيف العقار',
                          text2: 'للايجار',
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        TowText(
                          text1: 'رقم العقار',
                          text2: '412',
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        TowText(
                          text1: 'عدد الحمامات',
                          text2: '5',
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        TowText(
                          text1: 'عدد الغرف',
                          text2: '8',
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        TowText(
                          text1: 'لمساحة الكلية',
                          text2: '201/m',
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        TowText(
                          text1: 'سعر المتر',
                          text2: '${150}/  AED',
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        TowText(
                          text1: 'نوع المبنى',
                          text2: 'فندق',
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        TowText(
                          text1: 'الاتجاه',
                          text2: 'شرقي',
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        TowText(
                          text1: 'عدد مشاهدات العقار ',
                          text2: '26',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'مرافق العقار',
                        style: MangeStyles().getBoldStyle(
                          color: ColorManager.kTextblack,
                          fontSize: FontSize.s18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          width: 250,
                          height: 120,
                          decoration: BoxDecoration(
                            color: ColorManager.containacolor1,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            ' انترنت مجاني',
                            style: MangeStyles().getRegularStyle(
                              color: ColorManager.kTextblack,
                              fontSize: FontSize.s18,
                              isover: true,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  LocationHomeWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  GalleryWidget(),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 340,
                    height: 65,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          width: 150,
                          haigh: 60,
                          color: Color(0xff6B85B3),
                          text: 'استعلم الآن',
                          press: () {
                            reprt(context, false, controller);
                          },
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        CustomButton(
                          width: 150,
                          haigh: 60,
                          color: Colors.redAccent,
                          text: 'تقديم ابلاغ',
                          press: () {
                            reprt(context, true, controller);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
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

void reprt(
    BuildContext context, bool isreport, PropertDetalisController controller) {
  ;
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

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(top: 70.0, left: 20.0, right: 20.0, bottom: 10.0),
          child: Text(
            'صور العقار',
            style: MangeStyles().getRegularStyle(
              color: ColorManager.kTextblack,
              fontSize: FontSize.s18,
              isover: true,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          height: 200,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) {
                            return new Material(
                              color: Colors.black54,
                              child: Container(
                                padding: const EdgeInsets.all(30.0),
                                child: InkWell(
                                  child: Hero(
                                      tag: "hero-flashsale-${index}",
                                      child: Image.asset(
                                        'assets/images/hotel3.jpg',
                                        width: 300.0,
                                        height: 400.0,
                                        alignment: Alignment.center,
                                        fit: BoxFit.contain,
                                      )),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            );
                          },
                          transitionDuration:
                              const Duration(milliseconds: 500)));
                    },
                    child: SizedBox(
                      child: Image.asset(
                        'assets/images/hotel3.jpg',
                        fit: BoxFit.cover,
                        height: 140.0,
                      ),
                    ),
                  ),
                ),
              );
              ;
            },
          ),
        ),
      ],
    );
  }
}

class LocationHomeWidget extends StatelessWidget {
  const LocationHomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0, bottom: 20.0),
          child: Text(
            "موقع العقار",
            style: TextStyle(
              fontSize: 19,
              color: ColorManager.kTextblack,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        Container(
          height: 190,
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              bearing: 192.8334901395799,
              target: LatLng(37.43296265331129, -122.08832357078792),
              tilt: 59.440717697143555,
              zoom: 19.151926040649414,
            ),
            // markers: _markers,
          ),
        ),
      ],
    );
  }
}

class TowText extends StatelessWidget {
  const TowText({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  final String text1, text2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: MangeStyles().getBoldStyle(
              color: ColorManager.kTextblack,
              fontSize: FontSize.s18,
            ),
          ),
          Text(
            text2,
            style: MangeStyles().getBoldStyle(
              color: Colors.white,
              fontSize: FontSize.s18,
            ),
          ),
        ],
      ),
    );
  }
}
