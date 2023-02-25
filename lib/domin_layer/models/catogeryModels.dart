class CatogeryModel {
  int? statusCode;
  String? message;
  List<Catogerys>? catogerys;

  CatogeryModel({this.statusCode, this.message, this.catogerys});

  CatogeryModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    if (json['catogerys'] != null) {
      catogerys = <Catogerys>[];
      json['catogerys'].forEach((v) {
        catogerys!.add(new Catogerys.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.catogerys != null) {
      data['catogerys'] = this.catogerys!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Catogerys {
  int? id;
  String? name;
  String? createdBy;
  String? imagePath;
  String? createdAt;
  String? updatedAt;

  Catogerys(
      {this.id,
      this.name,
      this.createdBy,
      this.imagePath,
      this.createdAt,
      this.updatedAt});

  Catogerys.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdBy = json['Created_by'];
    imagePath = json['image_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['Created_by'] = this.createdBy;
    data['image_path'] = this.imagePath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
