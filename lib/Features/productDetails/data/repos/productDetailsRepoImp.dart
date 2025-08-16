import 'package:dartz/dartz.dart';


import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entites/productDetailsEntity.dart';
import '../../domain/repos/productsRepo.dart';
import '../dataSources/productDetailsRemoteDataSource.dart';

class ProductDetailsRepoImpl extends ProductDetailsRepo {
  final ProductDetailsRemoteDataSource productDetailsRemoteDataSource;

  ProductDetailsRepoImpl({required this.productDetailsRemoteDataSource});
  @override
  Future<Either<Failure, ProductDetailsEntity>> viewProductDetails(String productId) async {
    ProductDetailsEntity entity;
    try {
      entity =
          await productDetailsRemoteDataSource.viewProductDetails(productId);
      return right(entity);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
