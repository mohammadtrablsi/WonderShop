
import 'package:dartz/dartz.dart';

import 'package:wonder_shop/core/errors/failure.dart';


import 'package:dio/dio.dart';


import '../../domain/entities/login_entity.dart';
import '../../domain/repos/login_repo.dart';
import '../data_sources/login_remote_data_source.dart';


class LoginRepoImpl extends LoginRepo {
  final LoginRemoteDataSource loginRemoteDataSource;

  LoginRepoImpl(
      {required this.loginRemoteDataSource});
  @override
  Future<Either<Failure, LoginEntity>> makeLogin(Map<String, dynamic> body) async {
    LoginEntity LoginData;
    try {
      LoginData =
          await loginRemoteDataSource.makeLogin(body);
      return right(LoginData);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
