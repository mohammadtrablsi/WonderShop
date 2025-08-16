import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/userEntity.dart';

abstract class LoginLocalDataSource {
  Future<void> seedUser();
  Future<UserEntity?> getUser();
  Future<void> setLoggedIn(bool value);
  Future<bool> isLoggedIn();
}

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  LoginLocalDataSourceImpl();
  static const _keyPhone = "phone";
  static const _keyPassword = "password";
  static const _keyLoggedIn = "logged_in";

  @override
  Future<void> seedUser() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(_keyPhone) || !prefs.containsKey(_keyPassword)) {
      await prefs.setString(_keyPhone, "0997477838");
      await prefs.setString(_keyPassword, "password123");
    }
  }

  @override
  Future<UserEntity?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final phone = prefs.getString(_keyPhone);
    final password = prefs.getString(_keyPassword);
    if (phone != null && password != null) {
      return UserEntity(phone: phone, password: password);
    }
    return null;
  }

  @override
  Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyLoggedIn, value);
  }

  @override
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyLoggedIn) ?? false;
  }
}
