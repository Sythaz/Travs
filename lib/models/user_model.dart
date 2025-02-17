class UserModel {
  int? id;
  String? userId;
  String? name;
  String? profile;
  String? createdAt;

  UserModel({this.id, this.userId, this.name, this.profile, this.createdAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    profile = json['profile'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['profile'] = profile;
    data['created_at'] = createdAt;
    return data;
  }
}
