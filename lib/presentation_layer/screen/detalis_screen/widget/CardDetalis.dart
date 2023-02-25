import 'package:flutter/material.dart';
import 'package:real_easte_app/domin_layer/models/propertyDetalisModel.dart';
import 'package:real_easte_app/presentation_layer/resources/color_manager.dart';
import 'package:real_easte_app/presentation_layer/screen/detalis_screen/widget/towText.dart';

class CardDetalis extends StatelessWidget {
  const CardDetalis({
    Key? key,
    required this.width,
    this.propertyD,
  }) : super(key: key);
  final double width;
  final PropertyD? propertyD;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 660,
      width: width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorManager.containacolor3,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TowText(
            text1: 'رقم للتواصل',
            text2: propertyD!.user!.phone ?? '',
          ),
          Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: 7,
          ),
          TowText(
            text1: 'اسم مالك العقار',
            text2: propertyD?.user?.name ?? '',
          ),
          Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: 7,
          ),
          TowText(
            text1: 'تصنيف العقار',
            text2: propertyD?.propertyDetails?.rentalTerm ?? '',
          ),
          Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: 7,
          ),
          TowText(
            text1: 'رقم العقار',
            text2: propertyD?.id.toString() ?? '',
          ),
          Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: 7,
          ),
          TowText(
            text1: 'عدد الحمامات',
            text2: propertyD?.propertyDetails?.numbeerToilet.toString() ?? '',
          ),
          Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: 7,
          ),
          TowText(
            text1: 'عدد الغرف',
            text2: propertyD?.propertyDetails?.numbeerRoom.toString() ?? '',
          ),
          Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: 7,
          ),
          TowText(
            text1: 'لمساحة الكلية',
            text2: propertyD?.propertyDetails?.space.toString() ?? '',
          ),
          Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: 7,
          ),
          TowText(
            text1: 'سعر المتر',
            text2: '${propertyD?.propertyDetails?.price}/  AED',
          ),
          // Divider(
          //   color: Colors.black,
          // ),
          // SizedBox(
          //   height: 7,
          // ),
          // TowText(
          //   text1: 'نوع المبنى',
          //   text2: propertyD?.c?.numbeerRoom ?? '',
          // ),
          Divider(
            color: Colors.black,
          ),
          SizedBox(
            height: 7,
          ),
          TowText(
            text1: 'الاتجاه',
            text2: propertyD?.propertyDetails?.propertyDirection ?? '',
          ),
          Divider(
            color: Colors.black,
          ),
          TowText(
            text1: 'عدد مشاهدات العقار ',
            text2: propertyD?.views.toString() ?? '0',
          ),
        ],
      ),
    );
  }
}
