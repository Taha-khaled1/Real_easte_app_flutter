import 'package:flutter/material.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';

class CustomTextfeild extends StatelessWidget {
  final String titel;
  final bool? obsecuer;
  final IconData? icon;
  final void Function()? iconontap;
  final String? Function(String?)? onsaved;
  final String? Function(String?)? valid;
  final double width, height;
  final TextDirection? textDirection;
  final String? inialvalue;
  final BorderStyle? isBoarder;
  final int? maxLines;
  final Color? fillColor;
  final bool? isenabledBorder;
  final void Function(String)? onChanged;
  final bool readOnly;
  final void Function()? onTap;
  const CustomTextfeild({
    super.key,
    this.iconontap,
    this.obsecuer,
    this.icon,
    required this.valid,
    required this.onsaved,
    required this.titel,
    required this.width,
    required this.height,
    this.textDirection,
    this.inialvalue,
    this.isBoarder,
    this.maxLines,
    this.fillColor,
    this.isenabledBorder = true,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Material(
          elevation: 5.0,
          shadowColor: Colors.black,
          child: TextFormField(
            style: MangeStyles().getRegularStyle(
              color: ColorManager.kTextblack,
              fontSize: FontSize.s17,
            ),
            onTap: onTap,
            readOnly: readOnly,
            maxLines: maxLines,
            initialValue: inialvalue,
            textDirection: textDirection,
            obscureText: obsecuer == null ? false : obsecuer!,
            onSaved: onsaved,
            validator: valid,
            onChanged: onChanged,
            decoration: InputDecoration(
              prefixIcon: icon != null
                  ? IconButton(
                      onPressed: iconontap,
                      icon: Icon(icon),
                    )
                  : null,

              enabledBorder: isenabledBorder == true
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 1,
                        style: isBoarder ?? BorderStyle.solid,
                        color: ColorManager.kTextlightgray,
                      ), //<-- SEE HERE
                    )
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 0,
                        // style: BorderStyle.none,
                        color: ColorManager.kTextlightgray,
                      ), //<-- SEE HERE
                    ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  width: 1,
                  // style: BorderStyle.none,
                  color: ColorManager.kTextlightgray,
                ), //<-- SEE HERE
              ),

              //  enabled: true,
              filled: true,
              fillColor: ColorManager.bgColor,
              hintText: titel,
              hintStyle: MangeStyles().getRegularStyle(
                color: ColorManager.kTextblack,
                fontSize: FontSize.s16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
