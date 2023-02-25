class PropertyDetalisModel {
  int? statusCode;
  String? message;
  PropertyD? property;

  PropertyDetalisModel({this.statusCode, this.message, this.property});

  PropertyDetalisModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    property = json['property'] != null
        ? new PropertyD.fromJson(json['property'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.property != null) {
      data['property'] = this.property!.toJson();
    }
    return data;
  }
}

class PropertyD {
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
  PropertyDetails? propertyDetails;
  List<String>? images;
  List<String>? facilities;
  User? user;

  PropertyD(
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
      this.updatedAt,
      this.propertyDetails,
      this.images,
      this.facilities,
      this.user});

  PropertyD.fromJson(Map<String, dynamic> json) {
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
    propertyDetails = json['property_details'] != null
        ? new PropertyDetails.fromJson(json['property_details'])
        : null;
    images = json['images'].cast<String>();
    facilities = json['facilities'].cast<String>();
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
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
    if (this.propertyDetails != null) {
      data['property_details'] = this.propertyDetails!.toJson();
    }
    data['images'] = this.images;
    data['facilities'] = this.facilities;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class PropertyDetails {
  int? id;
  int? price;
  String? rentalTerm;
  String? description;
  int? space;
  String? buildingType;
  String? propertyDirection;
  int? numbeerRoom;
  int? numbeerToilet;
  double? longitude;
  double? latitude;
  String? address;
  String? sellerPhone;
  int? propertyId;

  PropertyDetails(
      {this.id,
      this.price,
      this.rentalTerm,
      this.description,
      this.space,
      this.buildingType,
      this.propertyDirection,
      this.numbeerRoom,
      this.numbeerToilet,
      this.longitude,
      this.latitude,
      this.address,
      this.sellerPhone,
      this.propertyId});

  PropertyDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    rentalTerm = json['Rental_term'];
    description = json['description'];
    space = json['space'];
    buildingType = json['building_type'];
    propertyDirection = json['property_direction'];
    numbeerRoom = json['numbeer_room'];
    numbeerToilet = json['numbeer_toilet'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    address = json['address'];
    sellerPhone = json['seller_phone'];
    propertyId = json['property_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['Rental_term'] = this.rentalTerm;
    data['description'] = this.description;
    data['space'] = this.space;
    data['building_type'] = this.buildingType;
    data['property_direction'] = this.propertyDirection;
    data['numbeer_room'] = this.numbeerRoom;
    data['numbeer_toilet'] = this.numbeerToilet;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['address'] = this.address;
    data['seller_phone'] = this.sellerPhone;
    data['property_id'] = this.propertyId;
    return data;
  }
}

class User {
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
  String? createdAt;
  String? updatedAt;

  User(
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
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
