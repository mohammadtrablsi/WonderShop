
import '../entities/userEntity.dart';

abstract class LoginRepo{
  Future<void> seedUser();
  Future<bool> login(String phone, String password);
  // Future<void> saveUser(UserEntity user);
  Future<UserEntity?> getUser();
  Future<void> setLoggedIn(bool value);
  Future<bool> isLoggedIn();
}

