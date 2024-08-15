class UserDataModel {
  String? token;
  User? user;

  UserDataModel({this.token, this.user});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    data['is_blocked'] = this.isBlocked;
    data['subscription'] = this.subscription;
    return data;
  }
}