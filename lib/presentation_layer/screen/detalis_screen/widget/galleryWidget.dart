import 'package:flutter/material.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/font_manager.dart';
import 'package:real_easte_app/presentation_layer/resources/msnge_api.dart';
import 'package:real_easte_app/presentation_layer/resources/styles_manager.dart';

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({
    Key? key,
    required this.imges,
  }) : super(key: key);
  final List<String> imges;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              EdgeInsets.only(top: 70.0, left: 20.0, right: 20.0, bottom: 10.0),
          child: Text(
            'صور العقار',
            style: MangeStyles().getRegularStyle(
              color: ColorManager.kTextblack,
              fontSize: FontSize.s18,
              isover: true,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          height: 200,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imges.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) {
                            return new Material(
                              color: Colors.black54,
                              child: Container(
                                padding: const EdgeInsets.all(30.0),
                                child: InkWell(
                                  child: Hero(
                                      tag: index,
                                      child: Image.network(
                                        '${APiMange.baseurlImage}/${imges[index]}',
                                        width: 300,
                                        height: 400,
                                        alignment: Alignment.center,
                                        fit: BoxFit.contain,
                                      )),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            );
                          },
                          transitionDuration:
                              const Duration(milliseconds: 500)));
                    },
                    child: SizedBox(
                      child: Hero(
                        tag: index,
                        child: Image.network(
                          '${APiMange.baseurlImage}/${imges[index]}',
                          fit: BoxFit.cover,
                          height: 140.0,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
