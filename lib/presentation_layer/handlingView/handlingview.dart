import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:real_easte_app/presentation_layer/resources/assets_manager.dart';

import '../../application_layer/ShardFunction/statusrequst.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? HandWidget(url: JsonAssets.loading2)
        : statusRequest == StatusRequest.offlinefailure
            ? HandWidget(url: JsonAssets.empty)
            : statusRequest == StatusRequest.serverfailure
                ? HandWidget(url: JsonAssets.error)
                : statusRequest == StatusRequest.erorr
                    ? HandWidget(url: JsonAssets.error)
                    : widget;
  }
}

class HandWidget extends StatelessWidget {
  const HandWidget({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(url, width: 200, height: 150, fit: BoxFit.contain),
    );
  }
}
