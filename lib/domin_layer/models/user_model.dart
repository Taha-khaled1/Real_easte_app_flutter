class UserModel {
  int? id;
  String? name;
  String? country;
  String? userType;
  String? phone;
  int? numberAds;
  String? email;
  String? status;
  String? emailVerifiedAt;
  String? phoneVerifiedAt;
  String? adress;
  String? createdAt;
  String? updatedAt;

  UserModel(
      {this.id,
      this.name,
      this.country,
      this.userType,
      this.phone,
      this.numberAds,
      this.email,
      this.status,
      this.emailVerifiedAt,
      this.phoneVerifiedAt,
      this.adress,
      this.createdAt,
      this.updatedAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    userType = json['user_type'];
    phone = json['phone'];
    numberAds = json['number_ads'];
    email = json['email'];
    status = json['status'];
    emailVerifiedAt = json['email_verified_at'];
    phoneVerifiedAt = json['phone_verified_at'];
    adress = json['adress'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country'] = this.country;
    data['user_type'] = this.userType;
    data['phone'] = this.phone;
    data['number_ads'] = this.numberAds;
    data['email'] = this.email;
    data['status'] = this.status;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone_verified_at'] = this.phoneVerifiedAt;
    data['adress'] = this.adress;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
