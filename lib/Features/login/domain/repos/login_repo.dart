import 'package:wonder_shop/Features/home/domain/entities/book_entity.dart';
import 'package:wonder_shop/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/login_entity.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginEntity>> makeLogin(Map<String, dynamic> map);
}
