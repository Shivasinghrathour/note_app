class UserModel {
  String? email;
  String? userName;

  UserModel({
    this.email,
    this.userName,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['userName'] = userName;
    return data;
  }
}
