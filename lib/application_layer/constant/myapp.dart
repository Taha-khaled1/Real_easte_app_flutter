import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:real_easte_app/presentation_layer/components/navbar.dart';
import 'package:real_easte_app/presentation_layer/resources/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      // getPages: getPage,
      home: Example(),
    );
  }
}
