class PropertyCardModel {
  int? statusCode;
  String? message;
  List<Properties>? properties;

  PropertyCardModel({this.statusCode, this.message, this.properties});

  PropertyCardModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    if (json['properties'] != null) {
      properties = <Properties>[];
      json['properties'].forEach((v) {
        properties!.add(new Properties.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.properties != null) {
      data['properties'] = this.properties!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Properties {
  int? id;
  String? name;
  String? picture;
  String? country;
  int? status;
  int? views;
  int? recommended;
  int? catogerieId;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Properties(
      {this.id,
      this.name,
      this.picture,
      this.country,
      this.status,
      this.views,
      this.recommended,
      this.catogerieId,
      this.userId,
      this.createdAt,
      this.updatedAt});

  Properties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picture = json['picture'];
    country = json['country'];
    status = json['status'];
    views = json['views'];
    recommended = json['recommended'];
    catogerieId = json['catogerie_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['country'] = this.country;
    data['status'] = this.status;
    data['views'] = this.views;
    data['recommended'] = this.recommended;
    data['catogerie_id'] = this.catogerieId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
