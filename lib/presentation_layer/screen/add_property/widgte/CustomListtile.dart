import 'package:flutter/material.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';

class CustomListtile extends StatelessWidget {
  const CustomListtile({
    Key? key,
    this.image,
    required this.onTap,
    required this.titel,
    this.textStyle,
    this.widget,
  }) : super(key: key);
  final void Function()? onTap;
  final String? image, titel;
  final TextStyle? textStyle;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: widget,
      title: Text(
        titel!,
        style: MangeStyles().getBoldStyle(
          color: ColorManager.kTextblack,
          fontSize: FontSize.s18,
        ),
      ),
    );
  }
}
