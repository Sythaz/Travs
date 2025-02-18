import 'dart:convert';

class DestinationModel {
  String? name;
  String? location;
  String? city;
  String? status;
  String? category;
  double? rating;
  String? description;
  String? cover;

  DestinationModel(
      {this.name,
      this.location,
      this.city,
      this.status,
      this.category,
      this.rating,
      this.description,
      this.cover});

  DestinationModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'];
    city = json['city'];
    status = json['status'];
    category = json['category'];
    rating = json['rating'];
    description = json['description'];
    cover = json['cover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['location'] = location;
    data['city'] = city;
    data['status'] = status;
    data['category'] = category;
    data['rating'] = rating;
    data['description'] = description;
    data['cover'] = cover;
    return data;
  }

  static List<DestinationModel> listFromJson(String jsonString) {
    List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((item) => DestinationModel.fromJson(item)).toList();
  }
}
