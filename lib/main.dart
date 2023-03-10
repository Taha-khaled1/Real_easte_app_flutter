import 'package:flutter/material.dart';
import 'package:real_easte_app/application_layer/constant/myapp.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences sharedPreferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    const MyApp(),
  );
}
