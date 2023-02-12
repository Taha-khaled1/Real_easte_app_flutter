import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_easte_app/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:real_easte_app/presentation_layer/components/appbar1.dart';
import 'package:real_easte_app/presentation_layer/more_product/more_product.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/detalis_screen/detalis_screen.dart';
import 'package:real_easte_app/presentation_layer/screen/home_screen/controller/homeController.dart';
import 'package:real_easte_app/presentation_layer/screen/home_screen/widget/Filtter/Filtter_screen.dart';
import 'package:real_easte_app/presentation_layer/screen/home_screen/widget/MostVisitedRealEstate.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: appbar('الصفحه الرئيسيه'),
      backgroundColor: ColorManager.kPrimary2,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: InfoWidget(
          builder: (context, deviceInfo) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 17, right: 7),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          //    margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: ColorManager.grey2,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            // gradient: ColorManager.y,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                                spreadRadius: 2.0,
                                offset: Offset(2.0, 2.0),
                              ),
                            ],
                          ),
                          child: TextField(
                            style: TextStyle(
                                color: ColorManager.kTextblack, fontSize: 20),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'البحث هنا ......',
                              prefixIcon: IconButton(
                                  onPressed: () {
                                    Get.to(() => MoreProductScreen());
                                  },
                                  icon: Icon(
                                    Icons.search,
                                    size: 35,
                                    color: Color(0xff1917b3),
                                  )),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Get.to(() => FiltterScreen());
                        },
                        icon: Icon(
                          Icons.filter_list_alt,
                          size: 35,
                          color: Color(0xff1917b3),
                        ),
                      ),
                    ],
                  ),
                ),
                MostVisitedRealEstate(
                  title: 'العقارات الأكثر زيارة',
                  future: FUN(),
                ),
                SizedBox(
                  height: 17,
                ),
                MostVisitedRealEstate(
                  title: 'عقارات أضيفت حديثا',
                  future: FUN(),
                ),
                SizedBox(
                  height: 17,
                ),
                MostVisitedRealEstate(
                  title: 'العقارات الموصي بها',
                  future: FUN(),
                ),
                SizedBox(
                  height: 17,
                ),
                TypeCard(
                  title2: 'منازل',
                  iscity: false,
                  title: 'انواع العقارات',
                  future: FUN(),
                ),
                SizedBox(
                  height: 15,
                ),
                TypeCard(
                  title2: 'ابو ظبي',
                  title: 'اكثر المدن التي تحتوي علي عقارات',
                  future: FUN(),
                  iscity: true,
                ),
                SizedBox(
                  height: 7,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class TypeCard extends StatelessWidget {
  const TypeCard({
    Key? key,
    required this.title,
    this.future,
    this.iscity = false,
    required this.title2,
  }) : super(key: key);
  final String title, title2;
  final Future<dynamic>? future;
  final bool iscity;
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

            return Container(
              alignment: Alignment.center,
              height: iscity ? 350 : 210,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      title,
                      style: MangeStyles().getRegularStyle(
                        color: ColorManager.kTextblack,
                        fontSize: FontSize.s18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,

                      itemCount: 8, //controller.catogeryModels?.data?.length,

                      itemBuilder: (BuildContext context, int index) {
                        return PropertyType(
                          iscity: iscity,
                          image: 'assets/images/hotel2.jpg',
                          haigh: 180,
                          id: 1,
                          title: title2,
                          width: 290,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
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

      future: future,
    );
  }
}

Future FUN() async {
  await Future.delayed(
    Duration(microseconds: 500),
  );
  return '';
}

class PropertyType extends StatelessWidget {
  const PropertyType(
      {super.key,
      required this.width,
      required this.haigh,
      required this.id,
      required this.image,
      required this.title,
      required this.iscity});
  final double width, haigh, id;
  final String image, title;
  final bool iscity;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      alignment: iscity ? Alignment.center : Alignment.bottomRight,
      height: haigh,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          // image: NetworkImage(
          //   img!.split(',').first,
          // ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.darken),
        ),
        color: ColorManager.kTextblack,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF656565).withOpacity(0.15),
            blurRadius: 2.0,
            spreadRadius: 1.0,
//           offset: Offset(4.0, 10.0)
          ),
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: MangeStyles().getBoldStyle(
            color: ColorManager.ktextw,
            fontSize: FontSize.s27,
          ),
        ),
      ),
    );
  }
}
