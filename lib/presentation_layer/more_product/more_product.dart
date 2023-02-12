import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_easte_app/presentation_layer/Infowidget/models/device_info.dart';
import 'package:real_easte_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:real_easte_app/presentation_layer/components/appbar1.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/home_screen/widget/MostVisitedRealEstate.dart';
import 'package:real_easte_app/presentation_layer/resources/values_manager.dart';

class MoreProductScreen extends StatelessWidget {
  const MoreProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    //  final MoreProductController controller = Get.put(MoreProductController());
    return Scaffold(
      backgroundColor: ColorManager.kPrimary2,
      appBar: appbar('نتائج البحث'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // margin: EdgeInsets.only(top: AppSize.s80),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: InfoWidget(
          builder: (context, deviceInfo) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SearchBar(kBackgroundColor: ColorManager.grey2),

                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: GridView.builder(
                    // controller: controller.controller,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      //  mainAxisSpacing: 10,
                      childAspectRatio: getChildAspectRatio(deviceInfo),
                    ),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(); //CardProperty();
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // //  if (controller.isLoadMoreRunning == true)
                // const Padding(
                //   padding: EdgeInsets.only(top: 10, bottom: 40),
                //   child: Center(
                //     child: CircularProgressIndicator(),
                //   ),
                // ),
                // //    if (controller.hasNextPage == false)
                // Center(
                //   child: Text(
                //     'تم تجلب كل المنتجات',
                //     style: MangeStyles().getRegularStyle(
                //       color: ColorManager.kPrimary,
                //       fontSize: FontSize.s20,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // )
              ],
            );
          },
        ),
      ),
    );
  }
}

double getChildAspectRatio(DeviceInfo deviceInfo) {
  print(deviceInfo.localHeight);
  if (deviceInfo.localHeight < 680) {
    return 0.9;
  } else if (deviceInfo.localHeight < 845) {
    return 0.9;
  } else if (deviceInfo.localHeight < 1000) {
    return 1.05;
  } else {
    return 2;
  }
}
