import 'package:real_easte_app/domin_layer/models/dataCard.dart';

class PropertyMoreCardModel {
  int? statusCode;
  String? message;
  List<Property>? property;

  PropertyMoreCardModel({this.statusCode, this.message, this.property});

  PropertyMoreCardModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    if (json['property']['data'] != null) {
      property = <Property>[];
      json['property']['data'].forEach((v) {
        property!.add(new Property.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.property != null) {
      data['property']['data'] = this.property!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
