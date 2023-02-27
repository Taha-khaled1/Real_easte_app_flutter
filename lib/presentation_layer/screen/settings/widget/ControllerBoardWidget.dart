
// import 'package:flutter/material.dart';
// import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
// import 'package:real_easte_app/presentation_layer/screen/settings/widget/CustomContainerBoard.dart';

// class ControllerBoardWidget extends StatelessWidget {
//   const ControllerBoardWidget({
//     Key? key,
//     // required this.controller,
//   }) : super(key: key);
//   //final ControlBoardController controller;
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       builder: (ctx, snapshot) {
//         // Checking if future is resolved or not
//         if (snapshot.connectionState == ConnectionState.done) {
//           // If we got an error
//           if (snapshot.hasError) {
//             return Center(
//               child: Text(
//                 '${snapshot.error} occurred',
//                 style: TextStyle(fontSize: 18),
//               ),
//             );

//             // if we got our data
//           } else if (snapshot.hasData) {
//             // Extracting data from snapshot object

//             return Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     CustomContainerBoard(
//                       color: ColorManager.containacolor1,
//                       number:
//                           1, //, controller.countersModels?.cartItemCount! ?? 0,
//                       subtitel: 'عدد الاعلانات التي \n تم نشرها بواستطك',
//                       titel: 'اعلان',
//                     ),
//                     CustomContainerBoard(
//                       color: ColorManager.containacolor2,
//                       number:
//                           1, //controller.countersModels?.wishlistItemCount! ?? 0,
//                       subtitel: 'مجموع مشاهدات \nالاعلانات الخاص بك',
//                       titel: 'مشاهده',
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 CustomContainerBoard(
//                   color: ColorManager.containacolor3,
//                   number: 1, //controller.countersModels?.orderCount! ?? 0,
//                   subtitel: 'مجموع الاستعلامات \nالعقارت الخاصه بك',
//                   titel: 'استعلام',
//                   opcty: 1,
//                 ),
//               ],
//             );
//           }
//         }

//         // Displaying LoadingSpinner to indicate waiting state
//         return Center(
//           child: CircularProgressIndicator(),
//         );
//       },

//       // Future that needs to be resolved
//       // inorder to display something on the Canvas
//       future: FUN(),
//     );
//   }
// }