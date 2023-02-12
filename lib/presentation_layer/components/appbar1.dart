import 'package:flutter/material.dart';

import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';

PreferredSizeWidget appbar(String title) {
  return AppBar(
    elevation: 0,
    backgroundColor: ColorManager.kPrimary2,
    leading: BackButton(
      color: ColorManager.kTextblack,
    ),
    centerTitle: true,
    title: Text(
      title,
      style: MangeStyles().getBoldStyle(
        color: ColorManager.kTextblack,
        fontSize: FontSize.s18,
      ),
    ),
    toolbarHeight: 75,
  );
}
