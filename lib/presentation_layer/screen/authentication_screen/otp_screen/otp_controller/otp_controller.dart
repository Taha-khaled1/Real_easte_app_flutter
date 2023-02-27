import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:quickalert/models/quickalert_type.dart';
import 'package:real_easte_app/application_layer/ShardFunction/handling.dart';
import 'package:real_easte_app/application_layer/ShardFunction/statusrequst.dart';
import 'package:real_easte_app/data_layer/function_resbon.dart/auth_res.dart';
import 'package:real_easte_app/main.dart';
import 'package:real_easte_app/presentation_layer/components/show_dialog.dart';
import 'package:real_easte_app/presentation_layer/screen/authentication_screen/otp_screen/otp_screen.dart';

class OtpController extends GetxController {
  String? otp;
}
