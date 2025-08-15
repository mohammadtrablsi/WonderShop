import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity{
  String username;
  String password;

  LoginModel({required this.username, required this.password}): super(
      username: username,
      password: password);

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    username : json['username'] as String,
    password : json['password'] as String
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}
