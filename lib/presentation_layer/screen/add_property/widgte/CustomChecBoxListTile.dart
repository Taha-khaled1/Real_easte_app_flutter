import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/add_property/add_property_controller/add_property_controller.dart';

class CustomChecBoxListTile extends StatefulWidget {
  const CustomChecBoxListTile({
    Key? key,
    required this.name,
    this.width,
  }) : super(key: key);
  final String name;
  final double? width;

  @override
  State<CustomChecBoxListTile> createState() => _CustomChecBoxListTileState();
}

class _CustomChecBoxListTileState extends State<CustomChecBoxListTile> {
  bool done = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 300,
      // height: 120,
      child: Row(
        children: [
          GetBuilder<AddPropertyController>(
            init: AddPropertyController(),
            builder: (controller) {
              return Checkbox(
                value: done,
                onChanged: (value) {
                  setState(() {
                    done = value!;
                    print('$done : $value');
                  });
                  if (done == true) {
                    controller.future!.add(widget.name);
                  } else {
                    controller.future!.removeWhere(
                      (element) => element == widget.name,
                    );
                  }

                  print(controller.future);
                },
              );
            },
          ),
          Text(
            widget.name,
            style: MangeStyles().getRegularStyle(
              color: ColorManager.kTextblack,
              fontSize: FontSize.s14,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
