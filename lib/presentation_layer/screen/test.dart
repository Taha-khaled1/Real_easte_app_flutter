import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:real_easte_app/presentation_layer/resources/assets_manager.dart';

class name extends StatelessWidget {
  const name({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.amber,
            width: 200,
            height: 150,
            child: Lottie.asset(JsonAssets.empty),
          ),
          Container(
            color: Colors.black,
            width: 100,
            height: 100,
            child: Lottie.asset(JsonAssets.error),
          ),
          Center(
            child: Lottie.asset(
              JsonAssets.loading,
              width: 200,
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            color: Colors.blue,
            width: 250,
            height: 150,
            child: Lottie.asset(JsonAssets.success),
          ),
        ],
      ),
    );
  }
}
