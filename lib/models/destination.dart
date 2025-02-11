import 'dart:convert';

class Destination {
  String? name;
  String? location;
  String? status;
  String? category;
  String? description;
  String? cover;

  Destination(
      {this.name,
      this.location,
      this.status,
      this.category,
      this.description,
      this.cover});

  Destination.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'];
    status = json['status'];
    category = json['category'];
    description = json['description'];
    cover = json['cover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['location'] = location;
    data['status'] = status;
    data['category'] = category;
    data['description'] = description;
    data['cover'] = cover;
    return data;
  }

  static List<Destination> listFromJson(String jsonString) {
    List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((item) => Destination.fromJson(item)).toList();
  }
}
