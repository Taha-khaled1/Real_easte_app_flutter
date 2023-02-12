import 'package:get/get.dart';
import 'package:real_easte_app/presentation_layer/resources/routes_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/add_property/add_property.dart';
import 'package:real_easte_app/presentation_layer/screen/detalis_screen/detalis_screen.dart';
import 'package:real_easte_app/presentation_layer/screen/home_screen/home_screen.dart';

List<GetPage<dynamic>>? getPage = [
  // GetPage(
  //     name: Routes.welcomRoute,
  //     page: () => const WelcomeScreen(),
  //     middlewares: [
  //       Midelware(),
  //     ]),
  GetPage(
    name: Routes.welcomRoute,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: Routes.PropertyDetalisScreen,
    page: () => const PropertyDetalisScreen(),
  ),
  GetPage(
    name: Routes.addproperty,
    transition: Transition.fadeIn,
    page: () => AddProperty(),
  ),
// GetPage(
//   name: "/secondPage",
//   transition: Transition.fadeIn,
//   page: SecondPage(),
// ),
// GetPage(
//   name: "/secondPage",
//   transition: Transition.fadeIn,
//   page: SecondPage(),
// ),
];
