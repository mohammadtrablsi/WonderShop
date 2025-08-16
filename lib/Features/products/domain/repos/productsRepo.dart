import 'package:dartz/dartz.dart';


import '../../../../core/errors/failure.dart';
import '../entites/productsEntity.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductsEntity>>> viewProducts();
}
