import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/msnge_api.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/more_product/more_product.dart';

class PropertyType extends StatelessWidget {
  const PropertyType(
      {super.key,
      required this.width,
      required this.haigh,
      required this.id,
      required this.image,
      required this.title,
      required this.iscity});
  final double width, haigh;

  final String image, title, id;
  final bool iscity;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('id :$id');
        Get.to(
          () => MoreProductScreen(),
          arguments: {'search': id},
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 15),
        alignment: iscity ? Alignment.center : Alignment.bottomRight,
        height: haigh,
        width: width,
        decoration: BoxDecoration(
          image: iscity
              ? DecorationImage(
                  image: AssetImage(image),
                  // image: NetworkImage(
                  //   img!.split(',').first,
                  // ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.darken),
                )
              : DecorationImage(
                  image: NetworkImage('${APiMange.baseurlImage}/$image'),
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
      ),
    );
  }
}
