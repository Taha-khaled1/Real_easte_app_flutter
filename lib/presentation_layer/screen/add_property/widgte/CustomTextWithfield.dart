import 'package:flutter/material.dart';
import 'package:real_easte_app/presentation_layer/components/customtextfild.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';

import '../../../Infowidget/ui_components/info_widget.dart';

class CustomTextWithfield extends StatelessWidget {
  const CustomTextWithfield({
    Key? key,
    required this.text1,
    this.text2,
    this.valid,
    this.onsaved,
    this.width,
    this.high,
  }) : super(key: key);
  final String? text1, text2;
  final String? Function(String?)? valid;
  final String? Function(String?)? onsaved;
  final double? width, high;
  @override
  Widget build(BuildContext context) {
    return InfoWidget(
      builder: (context, deviceInfo) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: deviceInfo.localWidth * 0.07, bottom: 10),
                  child: Text(
                    text1 ?? '',
                    style: MangeStyles().getRegularStyle(
                      color: ColorManager.kTextblack,
                      fontSize: FontSize.s18,
                    ),
                  ),
                )),
            SizedBox(
              width: 10,
            ),
            CustomTextfeild(
              valid: valid,
              isenabledBorder: false,
              fillColor: ColorManager.bgColor,
              onsaved: onsaved,
              titel: text2 ?? '',
              width: width ?? 150,
              height: high ?? 55,
            ),
          ],
        );
      },
    );
  }
}
