class UserModel {
  String? name;
  String? email;
  String? username;
  String? password;

  UserModel({this.username, this.password, this.email, this.name});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> userInfo = {
      'name': name,
      'usrname': username,
      'password': password,
      'email': email,
    };
    return userInfo;
  }

  Map<String, dynamic> logIn() {
    final Map<String, dynamic> userInfo = {
      'username': username,
      'password': password,
    };
    return userInfo;
  }
}
