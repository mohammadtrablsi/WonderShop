import 'package:dartz/dartz.dart';


import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entites/categoriesEntity.dart';
import '../../domain/repos/categoriesRepo.dart';
import '../dataSources/categoriesRemoteDataSource.dart';

class CategoriesRepoImpl extends CategoriesRepo {
  final CategoriesRemoteDataSource categoriesRemoteDataSource;

  CategoriesRepoImpl({required this.categoriesRemoteDataSource});
  @override
  Future<Either<Failure, List<CategoriesEntity>>> viewCategories() async {
    List<CategoriesEntity> entities;
    try {
      entities =
          await categoriesRemoteDataSource.viewCategories();
      return right(entities);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
