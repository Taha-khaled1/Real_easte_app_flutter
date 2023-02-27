import 'package:flutter/material.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';

class CustomContainerBoard extends StatelessWidget {
  const CustomContainerBoard({
    Key? key,
    required this.color,
    required this.number,
    required this.titel,
    required this.subtitel,
    this.opcty,
  }) : super(key: key);
  final Color color;
  final int number;
  final String titel, subtitel;
  final double? opcty;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: color,
      ),
      child: Column(
        children: [
          Text(
            '$number',
            style: MangeStyles().getBoldStyle(
              color: ColorManager.kTextblack,
              fontSize: FontSize.s22,
            ),
          ),
          Text(
            titel,
            style: MangeStyles().getBoldStyle(
              color: ColorManager.kTextblack,
              fontSize: FontSize.s16,
            ),
          ),
          Text(
            subtitel,
            textAlign: TextAlign.center,
            style: MangeStyles().getBoldStyle(
              color: ColorManager.kTextblack.withOpacity(opcty ?? 0.5),
              fontSize: FontSize.s16,
            ),
          ),
        ],
      ),
    );
  }
}
