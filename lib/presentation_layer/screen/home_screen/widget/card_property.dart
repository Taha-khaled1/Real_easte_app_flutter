import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:real_easte_app/domin_layer/models/dataCard.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/msnge_api.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/detalis_screen/detalis_screen.dart';

class CardProperty extends StatelessWidget {
  const CardProperty({super.key, required this.properties});
  final Property properties;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => PropertyDetalisScreen(), arguments: {"id": properties.id});
      },
      child: Container(
        width: 230,
        margin: EdgeInsets.only(right: 10, left: 4),
        height: 170,
        child: Column(
          children: [
            Container(
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(
                    '${APiMange.baseurlImage}/${properties.picture}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    properties.name!.length > 12
                        ? '${properties.name!.substring(0, 12)} ..'
                        : properties.name!, //searchesModel!.title ?? '',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.kTextblack,
                      fontSize: FontSize.s14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    properties.country ?? '',
                    style: MangeStyles().getBoldStyle(
                      color: ColorManager.ktextw,
                      fontSize: FontSize.s14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
