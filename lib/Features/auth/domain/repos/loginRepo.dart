
import '../entities/userEntity.dart';

abstract class LoginRepo{
  Future<void> seedUser();
  Future<bool> login(String phone, String password);
  Future<UserEntity?> getUser();
  Future<void> setLoggedIn(bool value);
  Future<bool> isLoggedIn();
}

