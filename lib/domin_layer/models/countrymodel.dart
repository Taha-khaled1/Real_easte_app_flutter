class CountryModel {
  int? statusCode;
  String? message;
  List<MostCountries>? mostCountries;

  CountryModel({this.statusCode, this.message, this.mostCountries});

  CountryModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    message = json['message'];
    if (json['mostCountries'] != null) {
      mostCountries = <MostCountries>[];
      json['mostCountries'].forEach((v) {
        mostCountries!.add(new MostCountries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.mostCountries != null) {
      data['mostCountries'] =
          this.mostCountries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MostCountries {
  int? count;
  String? country;

  MostCountries({this.count, this.country});

  MostCountries.fromJson(Map<String, dynamic> json) {
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
