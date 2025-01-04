class UserDataModel {
  String? token;
  User? user;

  UserDataModel({this.token, this.user});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  String? email;
  String? role;
  bool? isBlocked;
  String? subscription;

  User({this.name, this.email, this.role, this.isBlocked, this.subscription});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
    isBlocked = json['is_blocked'];
    subscription = json['subscription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['role'] = role;
    data['is_blocked'] = isBlocked;
    data['subscription'] = subscription;
    return data;
  }
}
