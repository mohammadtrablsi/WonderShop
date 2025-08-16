import 'package:dartz/dartz.dart';


import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entites/productsEntity.dart';
import '../../domain/repos/productsRepo.dart';
import '../dataSources/productsRemoteDataSource.dart';

class ProductsRepoImpl extends ProductsRepo {
  final ProductsRemoteDataSource productsRemoteDataSource;

  ProductsRepoImpl({required this.productsRemoteDataSource});
  @override
  Future<Either<Failure, List<ProductsEntity>>> viewProducts() async {
    List<ProductsEntity> entities;
    try {
      entities =
          await productsRemoteDataSource.viewProducts();
      return right(entities);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
