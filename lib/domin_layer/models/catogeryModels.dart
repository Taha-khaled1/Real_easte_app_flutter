class CatogeryModel {
  int? id;
  String? name;
  String? createdBy;
  String? imagePath;

  CatogeryModel({
    this.id,
    this.name,
    this.createdBy,
    this.imagePath,
  });

  CatogeryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdBy = json['Created_by'];
    imagePath = json['image_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['Created_by'] = this.createdBy;
    data['image_path'] = this.imagePath;

    return data;
  }
}
