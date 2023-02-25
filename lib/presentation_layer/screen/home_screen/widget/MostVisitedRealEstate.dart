import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_easte_app/application_layer/ShardFunction/statusrequst.dart';
import 'package:real_easte_app/domin_layer/models/dataCard.dart';
import 'package:real_easte_app/presentation_layer/handlingView/handlingview.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/detalis_screen/detalis_screen.dart';
import 'package:real_easte_app/presentation_layer/screen/home_screen/controller/homeController.dart';
import 'package:real_easte_app/presentation_layer/screen/home_screen/widget/card_property.dart';

class MostVisitedRealEstate extends StatelessWidget {
  const MostVisitedRealEstate(
      {super.key, required this.title, required this.data});

  final PropertyCardModel? data;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 210,
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
              itemCount: data?.property?.length ??
                  0, //controller.catogeryModels?.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return CardProperty(
                  properties: data!.property![index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
