import 'package:flutter/material.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';

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
