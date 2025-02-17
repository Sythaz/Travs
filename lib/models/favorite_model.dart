class FavoriteModel {
  String? destinationName;
  String? createdAt;

  FavoriteModel({this.destinationName, this.createdAt});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    destinationName = json['destination_name'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['destination_name'] = destinationName;
    data['created_at'] = createdAt;
    return data;
  }

  static List<FavoriteModel> fromJsonList(List? data) {
    if (data == null || data.isEmpty) {
      return [];
    }
    return data.map((e) => FavoriteModel.fromJson(e)).toList();
  }
}
