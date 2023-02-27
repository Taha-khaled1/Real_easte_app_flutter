import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/settings/controller/settings_controller.dart';
import 'package:real_easte_app/presentation_layer/screen/settings/widget/AllListtileControllerBoard.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SeetingesController controller = Get.put(SeetingesController());
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: AllListtileControllerBoard(controller: controller),
    );
  }
}
