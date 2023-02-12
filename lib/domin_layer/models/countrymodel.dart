class CountryModel {
  int? count;
  String? country;

  CountryModel({this.count, this.country});

  CountryModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['country'] = this.country;
    return data;
  }
}
