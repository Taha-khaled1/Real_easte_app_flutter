import 'package:flutter/material.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/strings_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/home_screen/widget/propertyType.dart';

class TypeCard extends StatelessWidget {
  const TypeCard({
    Key? key,
    required this.title,
    this.iscity = false,
    required this.title2,
    required this.catogerys,
  }) : super(key: key);
  final String title, title2;
  final List catogerys;
  final bool iscity;
  @override
  Widget build(BuildContext context) {
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

              itemCount:
                  catogerys.length, //controller.catogeryModels?.data?.length,

              itemBuilder: (BuildContext context, int index) {
                return PropertyType(
                  iscity: iscity,
                  image: iscity
                      ? AppStrings.imgs[index]
                      : catogerys[index].imagePath!,
                  haigh: 180,
                  id: iscity
                      ? catogerys[index].country
                      : catogerys[index].id!.toString(),
                  title: iscity
                      ? catogerys[index].country
                      : catogerys[index].name!,
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
