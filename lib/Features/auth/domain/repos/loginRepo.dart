import 'package:wonder_shop/Features/home/domain/entities/book_entity.dart';
import 'package:wonder_shop/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/userEntity.dart';

abstract class LoginRepo{
  Future<void> seedUser();
  Future<bool> login(String phone, String password);
  // Future<void> saveUser(UserEntity user);
  Future<UserEntity?> getUser();
  Future<void> setLoggedIn(bool value);
  Future<bool> isLoggedIn();
}

