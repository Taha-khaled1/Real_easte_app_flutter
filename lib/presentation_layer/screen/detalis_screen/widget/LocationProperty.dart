import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';

class LocationProperty extends StatelessWidget {
  const LocationProperty({
    Key? key,
    required this.lon,
    required this.lat,
  }) : super(key: key);
  final double lon, lat;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(top: 0.0, left: 20.0, right: 20.0, bottom: 20.0),
          child: Text(
            "موقع العقار",
            style: TextStyle(
              fontSize: 19,
              color: ColorManager.kTextblack,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        Container(
          height: 190,
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              bearing: 192.8334901395799,
              target: LatLng(lon, lat),
              tilt: 59.440717697143555,
              zoom: 19.151926040649414,
            ),
            // markers: _markers,
          ),
        ),
      ],
    );
  }
}
